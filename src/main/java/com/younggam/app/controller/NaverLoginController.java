package com.younggam.app.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.younggam.app.service.UserInfoService;
import com.younggam.app.vo.UserInfoVO;

@Controller
public class NaverLoginController {
	
	@Autowired
	private UserInfoService uiService;
	
	//1)로그인 성공 후 화면
	@GetMapping("/naver-main")
	public String naverMain() {
		return "naver/naver-main";
	}
	

}
