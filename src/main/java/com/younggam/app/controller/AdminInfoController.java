package com.younggam.app.controller;

import java.io.IOException;

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
	private AdminInfoService aiService;
	
	//관리자 홈
	@GetMapping("/admin/home")
	public String admHome() {
		return "admin/home";
	}

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
	
	//관리자 상세 정보
	@GetMapping("/admin/profile")
	public String getAdminInfo(Model m, AdminInfoVO admin) {
		admin = aiService.getAdminInfo(admin);
		m.addAttribute("admin", admin);
		return "admin/profile";
	}
	
	//관리자 수정
		@GetMapping("/admin/update")
		public String updateAdmin(Model m, AdminInfoVO admin) {
			admin = aiService.getAdminInfo(admin);
			m.addAttribute("admin", admin);
			return "admin/profile-update";
		}
		@PostMapping("/admin/update")
	     public String adminUpdate(AdminInfoVO admin, Model m) throws IllegalStateException, IOException {
	         String msg = "관리자 정보 수정에 실패하였습니다.";
	         String url = "/admin/update?adminId=" + admin.getAdminId();
	         if(aiService.updateAdminInfo(admin)) {
	            msg = "관리자 정보가 수정되었습니다.";
	            url = "/admin/profile?adminId=" + admin.getAdminId();
	         }
	         m.addAttribute("msg", msg);
	         m.addAttribute("url", url);
	         return "common/msg";
	      }
		
	/* 관리자 삭제
		@GetMapping("/admin/delete")
		public String deleteAdmin(Model m, @RequestParam("adminId") String adminId) {
			String msg = "관리자 삭제가 실패하였습니다.";
			String url = "/admin/profile?adminId=" + adminId;
			if(aiService.deleteAdminInfo(adminId)) {
				msg = "관리자 삭제가 성공하였습니다.";
				url = "/admin/home";
			}
			m.addAttribute("msg", msg);
			m.addAttribute("url", url);
			return "common/msg";
		}
	
	//관리자 목록
	@GetMapping("/admin/admins")
	public String getAdminList(@ModelAttribute AdminInfoVO adminInfo, HttpSession session, Model m) {
		List<AdminInfoVO> adminList = aiService.getAdminInfos(adminInfo);
		m.addAttribute("adminList", adminList);
		return "admin/list";
	} */
}

