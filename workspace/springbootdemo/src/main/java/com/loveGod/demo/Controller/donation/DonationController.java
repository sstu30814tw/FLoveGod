//package com.loveGod.demo.Controller.donation;
//
//import java.text.DateFormat;
//import java.text.SimpleDateFormat;
//import java.util.Date;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpSession;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.bind.annotation.ResponseBody;
//
//import com.loveGod.demo.model.DonationModel;
//
//import com.loveGod.demo.service.DonationService;
//
//
//import captcha.CaptchaGenerator;
//import captcha.CaptchaUtils;
//import ecpay.payment.integration.AllInOne;
//import ecpay.payment.integration.domain.AioCheckOutALL;
//import nl.captcha.Captcha;
//
//@Controller
//public class DonationController {
//
//	@Autowired
//	private DonationService dService;
//	
//	@Autowired
//	private CaptchaGenerator captchaGenerator;
//
//	public static AllInOne all;
//
//	private static void initial() {
//		all = new AllInOne("");
//	}
//
//	// 產生香油錢頁面
//	@GetMapping("/donation")
//	public String donation(Model model, HttpSession httpSession) {
//
//		DonationModel d1 = new DonationModel();
//
//		model.addAttribute("donations", d1);
//
//		Captcha captcha = captchaGenerator.createCaptcha(200, 50);
//		httpSession.setAttribute("captcha", captcha.getAnswer());
//		model.addAttribute("captchaEncode", CaptchaUtils.encodeBase64(captcha));
//
//		System.out.println(123);
//		return "donation/donation";
//	}
//
//	@PostMapping("/donation")
//	public String postdonation(@ModelAttribute(name = "donations") DonationModel dsg) {
//
//		dService.insert(dsg);
//
//		System.out.println(456);
//		return "index";
//
//	}
//
//	// 接收前端的值 傳到database 與 綠界
//	@ResponseBody
//	@PostMapping("/donation2")
//	public String postnewDonation(
//			
//			@RequestParam(value = "receipt", required = false) String receipt,
//			@RequestParam(value = "money", required = false) String money,
//			@RequestParam(value = "mail", required = false) String mail,
//			@RequestParam(value = "name", required = false) String name,
//			@RequestParam(value = "phone", required = false) String phone,
//			@RequestParam(value = "address", required = false) String address, HttpSession session,
//			DonationModel donationModel,HttpServletRequest request) {
//
//		if (donationModel.getCaptcha().equals(request.getSession().getAttribute("captcha"))) {
//
//			DonationModel addD = new DonationModel();
//			addD.setMoney(money);
//			addD.setAddress(address);
//			addD.setMail(mail);
//			addD.setName(name);
//			addD.setPhone(phone);
//			addD.setReceipt(receipt);
//
//			DonationModel returndonation = dService.insert(addD);
//			session.setAttribute("moneyObj", returndonation);
//
//			initial();
//			AioCheckOutALL obj = new AioCheckOutALL();
//
//			obj.setMerchantTradeNo("DD" + String.valueOf((new Date()).getTime()));
//			DateFormat df = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
//			obj.setMerchantTradeDate(df.format(new java.sql.Timestamp(System.currentTimeMillis())));
//			obj.setTotalAmount(String.valueOf(money));
//			obj.setTradeDesc("test Description");
//			obj.setItemName(name + "的香油錢");
//			obj.setReturnURL("http://localhost:8080/management/donationmanagement");
//			obj.setClientBackURL("http://localhost:8080/my-app/getdonation");
//			obj.setNeedExtraPaidInfo("N");
//			String form = all.aioCheckOut(obj, null);
//
//			return form;
//
//		} else {
//
//			return "redirect:donation/donation";
//		}
//
//	}
//
//	// 綠界回傳
//	@GetMapping("/getdonation")
//	public String getdonation(Model model, HttpSession session) {
//
//		DonationModel donation = (DonationModel) session.getAttribute("moneyObj");
//		donation.setDonationStatus(1);
//		Integer donationStatusCode = donation.getDonationStatus();
//		DonationModel donationmodel = dService.insertDonation(donation);
////		System.out.println(dm.getMoney());
//		return "index";
//	}
//
//}