package com.younggam.app.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MyInfoController {
	
	//1)내 프로필
	@GetMapping("/myInfo")
	public String myInfo() {
		
		return "profile/myInfo";
	}
	
	//2)정보 수정
	@GetMapping("/myInfo-update")
	public String myInfoUpdate() {
		
		return "profile/myInfo-update";
	}
	
}
