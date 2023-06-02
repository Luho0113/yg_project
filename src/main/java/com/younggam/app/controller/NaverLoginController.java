package com.younggam.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class NaverLoginController {
	
	
	//1)로그인 성공 후 화면
	@GetMapping("/naver-login")
	public String naverMain() {
		return "naver/naver-login";
	}
}
