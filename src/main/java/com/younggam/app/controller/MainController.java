package com.younggam.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {
	//메인화면 컨트롤러(/)
	
	
	@GetMapping("/")
	public String home() {

		return "index";
	}
}
