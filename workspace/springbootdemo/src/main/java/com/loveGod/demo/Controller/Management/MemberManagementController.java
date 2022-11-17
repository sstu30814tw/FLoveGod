package com.loveGod.demo.Controller.Management;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.loveGod.demo.model.RegisterModel;
import com.loveGod.demo.service.MemberManagementService;

@Controller
public class MemberManagementController {
	
	@Autowired
	public MemberManagementService mService;
	
	

	
	@GetMapping("/member/page")
	public String viewMember(@RequestParam(name="p",defaultValue="1") Integer pageNumber, Model model) {
		Page<RegisterModel> page = mService.findByPage(pageNumber);
		model.addAttribute("page", page);
		return "management/memberManagement";
	}
	
	@GetMapping("/member/deleteMember")
	public String deleteMember(@RequestParam("id") Integer id) {
		mService.deleteById(id);
		return "redirect:/member/page";
	}
	
	@GetMapping("member/editMember")
	public String editMember(@RequestParam("id") Integer id, Model model) {
		RegisterModel rsm = mService.findById(id);
		model.addAttribute("registerMember",rsm);
		return "member/editMember";
	}
	
	@PostMapping("/member/postEditMemeber")
	public String postEditMessage(@ModelAttribute("registerMember") RegisterModel rsm) {
		mService.insert(rsm);
		return "redirect:/member/page";
	}
	
//	@RequestMapping(value="search")
//	public String search(@RequestParam("id") Integer id,Model model) {
//		List<RegisterModel>unit = mService.findByIdLike(id);
//		model.addAttribute("unit", unit);
//		return "management/memberManagement";
//	}
	

	
}

