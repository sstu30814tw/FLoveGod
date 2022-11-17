package com.loveGod.demo.Controller.marriage;

import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.loveGod.demo.model.pairDetail;
import com.loveGod.demo.service.pairDetailService;

@Controller
public class marriageController {
	
	@Autowired
	pairDetailService pairDetailS;
	
		//產生配對頁面
	@GetMapping("/marriage")
	public String drawlots(Model model,HttpServletRequest request) {
		HttpSession session = request.getSession();
		String memberId = (String) session.getAttribute("memberId");
		String match = (String) session.getAttribute("match");
		String match1 = "on";
		if (memberId != null) {// 如果已有登入未登入
			if(match !=null && match.equals(match1) ) {
			Calendar cal = Calendar.getInstance();
			int yearNow = cal.get(Calendar.YEAR);
			int monthNow = cal.get(Calendar.MONTH)+1;
			int dayNow = cal.get(Calendar.DAY_OF_MONTH);
			List<pairDetail> flag = pairDetailS.findTodayPair(yearNow, monthNow, dayNow);
			if(flag.size() == 0) {
				pairDetail pd = new pairDetail();
				pairDetailS.newPairDetail(pd);	
			}else {
				model.addAttribute("errorBuild","今日已有配對表單");
			}
			//配對
			pairDetail pd = new pairDetail();
			if(flag.size()>0) {
				for(int i=0;i<flag.size();i++) {
					if(flag.get(i).getIdBoy() !=null) {
						if(flag.get(i).getIdBoy().getMemberId().equals(memberId)) {
							pd= flag.get(i);
						}else if(flag.get(i).getIdGirl() !=null){
							if(flag.get(i).getIdGirl().getMemberId().equals(memberId)) {
								pd= flag.get(i);
						}
					}else if(flag.get(i).getIdGirl() !=null) {
						if(flag.get(i).getIdGirl().getMemberId().equals(memberId)) {
							pd= flag.get(i);
						}else if(flag.get(i).getIdBoy() !=null){
							if(flag.get(i).getIdBoy().getMemberId().equals(memberId)) {
								pd= flag.get(i);
						}
					}else{
						pd=null;
					}
					}
					model.addAttribute("Marriage",pd);
					model.addAttribute("MemberId",memberId);
				}
			}
			}
			return "marriage/marriage";
			}
			else {
				return "redirect:/user";
			}
		} else {
			return "login/login"; 						// 找 /login.jsp 顯示畫面：登入畫面
		}
		
	}
	//產生新的配對表
//	@GetMapping("/NewMarriageTable")
//	public String NewTable() {
//		pairDetail pd = new pairDetail();
//		pairDetailS.newPairDetail(pd);
//		return "/";
//	}
	
	
	
}

