package com.loveGod.demo.Controller.Management;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.loveGod.demo.model.RegisterModel;
import com.loveGod.demo.service.MemberManagementService;

@RestController
public class managementControllerAPI {

	
//	@ResponseBody
//	@GetMapping("member/getbyname")
//	public List<RegisterModel> search(@Param("keyword") String keyword,Model model) {
//		List<RegisterModel> listName = mService.findByName(keyword);
//		model.addAttribute("keyword", keyword);
//		return listName;
//	}
	
	@Autowired
    MemberManagementService memberManagementService;
	
	

    public managementControllerAPI(MemberManagementService memberManagementService) {
		super();
		this.memberManagementService = memberManagementService;
	}

//    @GetMapping("/member/findByName/{keyword}")
//    public List<RegisterModel> findMemberByName(@RequestParam("keyword") String keyword,Model model) {
//    	List<RegisterModel> listrm = memberManagementService.findByName(keyword);
//    	model.addAttribute("keyword", listrm);
//        return listrm;
//    }
    
    @GetMapping("/member/findByName/{name}")
    public ArrayList<RegisterModel> findMemberByName(@PathVariable("name") String name) {
    	ArrayList<RegisterModel> rm = new ArrayList<>(memberManagementService.findByName(name));
    	System.out.println("kkkkkkk"+rm);
    	if(rm != null) {
    			return rm;
    	}
    	RegisterModel emptyrm = new RegisterModel();
    	emptyrm.setName("can not found");
    	return null;
    	
 
    
    }
    
    
    
    
    @GetMapping("member/all")
    public ResponseEntity<List<RegisterModel>> findAllMember() {
        List<RegisterModel> allMember = memberManagementService.findAllMember();
        return ResponseEntity.status(HttpStatus.OK).body(allMember);
    }
    
	@GetMapping("/member/API/page")
	public Page<RegisterModel> viewMember(@RequestParam(name="p",defaultValue="1") Integer pageNumber, Model model) {
		Page<RegisterModel> page = memberManagementService.findByPage(pageNumber);
		
		return page;
	}
    
    
    
    
}
