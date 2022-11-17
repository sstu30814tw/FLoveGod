package com.loveGod.demo.Controller.Management;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.loveGod.demo.model.pairDetail;
import com.loveGod.demo.service.pairManagementService;

@Controller
public class pairManagementController {

	@Autowired
	private pairManagementService pService;
	
	@GetMapping("/pair/page")
	public String viewOrder(@RequestParam(name="p",defaultValue="1") Integer pageNumber, Model model) {
		Page<pairDetail> page = pService.findByPage(pageNumber);
		model.addAttribute("page", page);
		return "management/pairManagement";
	}
	
	@GetMapping("/pair/deletePair")
	public String deletePair(@RequestParam("id") Long id) {
		pService.deleteById(id);
		return "redirect:/pair/page";
	}
	
	@GetMapping("pair/editPair")
	public String editPair(@RequestParam("id") Long id, Model model) {
		pairDetail pd = pService.findById(id);
		model.addAttribute("pairDetail",pd);
		return "management/editPair";
	}
	
	@PostMapping("/pair/postEditPair")
	public String postEditPair(@ModelAttribute("pairDetail") pairDetail pd) {
		pService.insert(pd);
		return "redirect:/pair/page";
	}
}
