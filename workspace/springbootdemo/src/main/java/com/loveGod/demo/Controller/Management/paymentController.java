package com.loveGod.demo.Controller.Management;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import ecpay.payment.integration.AllInOne;
import ecpay.payment.integration.domain.AioCheckOutALL;

@Controller
public class paymentController {

//	public static void main(String[] args) {
//		initial();
//		System.out.println("aioCheckOutALL: " + paymentcheck());
//	}
	

	
	
	public static AllInOne all;
	private static void initial(){
		all = new AllInOne("");
	}
	
	@ResponseBody
	@PostMapping("/donatepayment")
	public static String donationpayment(@RequestParam("transAmount")Integer transAmount) {
		initial();
		AioCheckOutALL obj = new AioCheckOutALL();
	
		obj.setMerchantTradeNo("LL"+String.valueOf((new Date()).getTime()));
		DateFormat df= new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		obj.setMerchantTradeDate(df.format(new java.sql.Timestamp(System.currentTimeMillis())));
//		obj.setMerchantTradeDate("2017/01/01 08:05:23");
//		obj.setTotalAmount("50");
		obj.setTotalAmount(String.valueOf(transAmount));
		obj.setTradeDesc("test Description");
		obj.setItemName("香油錢");
		obj.setReturnURL("http://localhost:8080/my-app/donation");
		obj.setClientBackURL("http://localhost:8080/my-app/donation");
//		obj.setOrderResultURL("http://localhost:8080/my-app/donation");
		obj.setNeedExtraPaidInfo("N");
		
		
		String form = all.aioCheckOut(obj, null);
		
		return form;
		
	}
	
	@ResponseBody
	@PostMapping("/payment")
	public static String prodpaymentcheck(@RequestParam("transAmount")Integer transAmount) {
		initial();
		AioCheckOutALL obj = new AioCheckOutALL();
	
		obj.setMerchantTradeNo("LL"+String.valueOf((new Date()).getTime()));
		DateFormat df= new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		obj.setMerchantTradeDate(df.format(new java.sql.Timestamp(System.currentTimeMillis())));
//		obj.setMerchantTradeDate("2017/01/01 08:05:23");
//		obj.setTotalAmount("50");
		obj.setTotalAmount(String.valueOf(transAmount));
		obj.setTradeDesc("test Description");
		obj.setItemName("香油錢");
		obj.setReturnURL("http://localhost:8080/my-app/oconfirm");
		obj.setClientBackURL("http://localhost:8080/my-app/shop");
//		obj.setOrderResultURL("http://localhost:8080/my-app/donation");
		obj.setNeedExtraPaidInfo("N");
		
		
		String form = all.aioCheckOut(obj, null);
		
		return form;
		
	}
	
	@ResponseBody
	@PostMapping("/prod_payment")
	public static String paymentcheck(@RequestParam("orderSum")Integer orderSum) {
		initial();
		AioCheckOutALL obj = new AioCheckOutALL();
		
		
	
		obj.setMerchantTradeNo("LL"+String.valueOf((new Date()).getTime()));
		DateFormat df= new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		obj.setMerchantTradeDate(df.format(new java.sql.Timestamp(System.currentTimeMillis())));
//		obj.setMerchantTradeDate("2017/01/01 08:05:23");
//		obj.setTotalAmount("50");
		obj.setTotalAmount(String.valueOf(orderSum));
		obj.setTradeDesc("test Description");
		obj.setItemName("結緣商品");
		obj.setReturnURL("http://localhost:8080/my-app/management/ordermanagement");
		obj.setClientBackURL("http://localhost:8080/my-app/Order");
//		obj.setOrderResultURL("http://localhost:8080/my-app/donation");
		obj.setNeedExtraPaidInfo("N");
	
		String form = all.aioCheckOut(obj, null);

		return form;
		
	}
	
	
	@GetMapping("/management/ordermanagement")
	public void getpaymentInfo(@RequestParam("RtnMsg")String RtnMsg) {
		
		
		System.out.println(RtnMsg);
//	return RtnMsg;
		
	}

	
	


	
	
}
