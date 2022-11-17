package com.loveGod.demo.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
@Controller
public class AboutController {

//================================== 關於月老頁面 ================================	
	@GetMapping("/about")       // 網址http://localhost:8080/my-app/about
	public String about() {		// 進入方法(about)
		return "about/about";   // 找路徑： about資料夾/about.jsp  顯示畫面：登入畫面
	}
}
