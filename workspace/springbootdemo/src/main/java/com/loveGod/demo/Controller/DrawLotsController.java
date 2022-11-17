package com.loveGod.demo.Controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.loveGod.demo.model.DrawlotsModel;
import com.loveGod.demo.model.Products;
import com.loveGod.demo.model.RegisterModel;
import com.loveGod.demo.service.DrawService;


@Controller
public class DrawLotsController {
	@Autowired
	private DrawService dService; // Service部分
	

	@GetMapping("/drawlots")
	public String drawlots(Model model) {
		List<DrawlotsModel> userList = dService.findByByNewId();
		model.addAttribute("drawName", userList.get(0).getDrawName());
		model.addAttribute("drawMean", userList.get(0).getDrawMean());
		return "drawlots/drawlots";
	}
	
	//管理頁面 新增資料
	@PostMapping("/poem/drawlotssubmit")
	public String drawlotssubmit(@ModelAttribute(name = "drawlotssubmit") DrawlotsModel dM, Model model) {
		
		Optional<DrawlotsModel> resultList = dService.findById(dM);
		dService.insertlots(dM);
		
		
		return "redirect:/poem/page";
		
		}
//管理頁面 頁面控制
	@GetMapping("/poem/page")
	public String viewMember(@RequestParam(name="p",defaultValue="1") Integer pageNumber, Model model) {
		Page<DrawlotsModel> page = dService.findByPage(pageNumber);
		model.addAttribute("page", page);
		return "management/poemManagement";
	}
	//刪除資料
	@GetMapping("/poem/deleteMember")
	public String deleteMember(@RequestParam("id") Integer id) {
		dService.deleteById(id);
		return "redirect:/poem/page";
	}
	
	@GetMapping("poem/editPoem")
	public String editPoem(@RequestParam("id") Integer id, Model model) {
		DrawlotsModel pro = dService.findByIntegerId(id);
		model.addAttribute("drawlots",pro);
		return "management/editPoem";
	}
	@PostMapping("/poem/editPoem")
	public String postEditProduct(@ModelAttribute("drawlots") DrawlotsModel pro) {
		dService.insertlots(pro);
		return "redirect:/poem/page";
	}
	@PostMapping("poem/page")
		public String findDrawId(@ModelAttribute("drawIdSubmit") Integer id, Model model) {
			DrawlotsModel pro = dService.findByIntegerId(id);
			model.addAttribute("drawlots",pro);
			return "redirect:/poem/page";
	}

//	@GetMapping("/drawlots/poem")
//	public String viewPoem(@RequestParam("id") Integer id, Model model) {
//		Optional<DrawlotsModel> msg = dService.findByByNewId();
//		model.addAttribute("workMessage", msg);
//		return "drawlots/addMessages (1)";
		
	
		//		Page<DrawlotsModel> page = dService.findByPage(pageNumber);
//		model.addAttribute("page", page);
//		return "management/poemManagement";
	}
	
	
	

	
	
	
	



	

	
	
	
	
	
	
//	//增
//	@PostMapping("/drawlots/insert")
//	public DrawlotsModel insertCustomer2(@RequestBody DrawlotsModel dFile) {
//		DrawlotsModel resCus = dDao.save(dFile);
//		return resCus;
//	}
//	//查
//	@GetMapping("/drawlots/get/{id}")
//	public DrawlotsModel getById(@PathVariable("id") Integer id) {
//		Optional<DrawlotsModel> optional = dDao.findById(id);
//		
//		if(optional.isPresent()) {
//			DrawlotsModel resCus = optional.get();
//			return resCus;
//		}
//		
//		DrawlotsModel emptyCus = new DrawlotsModel();
//		emptyCus.setDrawName("沒有這筆資料");
//		
//		return emptyCus;
//	}
//	
//	//刪
//	@GetMapping("/drawlots/delete/{id}")
//	public boolean deletelotsById(@PathVariable Integer id) {
//		dDao.deletelotsById(id);
//		return true;
//	}
	

