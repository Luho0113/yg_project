package com.younggam.app.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.younggam.app.service.AdminInfoService;
import com.younggam.app.vo.AdminInfoVO;


@Controller
public class AdminInfoController {
	@Autowired
	AdminInfoService aiService;
	
	//관리자 로그인
	@PostMapping("/admin/login")
	public String login(@ModelAttribute AdminInfoVO admin, HttpSession session, Model m) {
		if(aiService.login(admin, session)) {
			return "admin/home";
		}
		m.addAttribute("msg", "관리자 아이디 또는 비밀번호가 일치하지 않습니다. 다시 확인해주세요.");
		return "admin/login";
	}
	
	@GetMapping("/admin/login")
	public String admLogin() {
		return "admin/login";
	}
	
	//관리자 로그아웃
	@GetMapping("/admin/logout")
	public String admLogout(HttpSession session) {
		session.invalidate();
		return "admin/login";
	}

	//관리자 목록
	@GetMapping("/admin/admins")
	public String getAdminList(@ModelAttribute AdminInfoVO adminInfo, HttpSession session, Model m) {
		List<AdminInfoVO> adminList = aiService.getAdminInfo(adminInfo);
		m.addAttribute("adminList", adminList);
		return "admin/list";
	}
		
}
