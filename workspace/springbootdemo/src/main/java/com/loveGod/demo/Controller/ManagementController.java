package com.loveGod.demo.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ManagementController {
	
	
	@GetMapping("/management/allManagement")
	public String allManagement() {
		return "management/allManagement";
	}
	
	@GetMapping("/management/coupleManagement")
	public String coupleManagement() {
		return "management/coupleManagement";
	}
	
	@GetMapping("/management/donateManagement")
	public String donateManagement() {
		return "management/donateManagement";
	}
	
//	@GetMapping("/management/memberManagement")
//	public String memberManagement() {
//		return "management/memberManagement";
//	}
	
	@GetMapping("/management/orderManagement")
	public String orderManagement() {
		return "management/orderManagement";
	}
	
	@GetMapping("/management/poemManagement")
	public String poemManagement() {
		return "management/poemManagement";
	}

	
	@GetMapping("/management/shopManagement")
	public String shopManagement() {
		return "management/shopManagement";
	}
	
	@GetMapping("/credittest")
	public String creditTest() {
		return "shop/test";
	}

}
