package com.loveGod.demo.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PageController {
	
			@GetMapping("/")
			public String home() {
				return "index";
			}
			
			@GetMapping("/index")
			public String homeindex() {
				return "index";
			}

}
