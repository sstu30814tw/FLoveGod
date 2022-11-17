package com.loveGod.demo.Controller.Management;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import com.loveGod.demo.model.DonationModel;
import com.loveGod.demo.service.donationManagementService;

@Controller
public class donationManagementController {

	@Autowired
	private donationManagementService dService;
	
	@Autowired
	private EmailSenderService emailSenderService;
	
	@GetMapping("/donation/page")
	public String viewDonation(@RequestParam(name="p",defaultValue="1") Integer pageNumber, Model model) {
		Page<DonationModel> page = dService.findByPage(pageNumber);
		model.addAttribute("page", page);
		return "management/donationManagement";
	}
	@GetMapping("/donation/deleteDonation")
	public String deleteDonation(@RequestParam("id") Integer id) {
		dService.deleteById(id);
		return "redirect:/donation/page";
	}
	
	@GetMapping("donation/editDonation")
	public String editDonation(@RequestParam("id") Integer id, Model model) {
		DonationModel dm = dService.findById(id);
		model.addAttribute("donationModel",dm);
		return "management/editDonation";
	}
	
	public String postEditDonation(@ModelAttribute("donation") DonationModel dm) {
		dService.insert(dm);
		if(dm.getSendReceipt()==1) {
			emailSenderService.sendEmailAttachment(null, null, null, false, null);
		}
		
	
	return "redirect:/donation/page";
	}
}
