package com.younggam.app.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.younggam.app.service.UserInfoService;
import com.younggam.app.vo.UserInfoVO;

@Controller
public class UserInfoController {
	//회원 관리 컨트롤러 (가입, 로그인, 로그아웃, 탈퇴)
	
	@GetMapping("/")
	public String home() {
		//@AuthenticationPrincipal User user, Model model ->매개값
		//백엔드에서 유저 정보 알아내기 (@AuthenticationPrincipal을 사용해서)
		//로그인한 유저를 유지하는 부분 = 세션과 쿠키를 사용해야 함
		//지금 사용하면 오류있음 주석처리해서 테스트하기..
		//model.addAttribute("loginId", user.getUsername());
		//model.addAttribute("loginRoles", user.getAuthorities());
		
		return "index";
	}
	
	@Autowired
	private UserInfoService uiService;
	
	//1) 회원가입
	@GetMapping("/join")
	public String join() {

		return "user/join";
	}
	
	@PostMapping("/join")
	public String join(@ModelAttribute UserInfoVO user, Model m) throws IllegalStateException, IOException {
		
		m.addAttribute("msg", "회원가입에 실패했습니다.");
		
		if(uiService.getUserInfoVOByUiId(user) != null) {
			m.addAttribute("msg", "존재하는 아이디입니다.");
			
			return "user/join";
		} else if(uiService.join(user)) {
			m.addAttribute("msg", "회원 가입되었습니다.");
		}
		
		return "user/login";
	}

	
	@GetMapping("/check-id")
	@ResponseBody
	public boolean checkId(@ModelAttribute UserInfoVO user, Model m) throws IllegalStateException, IOException {		
		return uiService.getUserInfoVOByUiId(user) != null;
	}
	
	//2) 로그인
	@GetMapping("/login")
	public String login() {

		return "user/login";
	}

	
 	@PostMapping("/login")
 	public String login(@ModelAttribute UserInfoVO user, HttpSession session, Model m) {
 		
 		if(uiService.login(user, session)) {
	 		
 			return "index";
 		}
 		
 		//m.addAttribute("msg", "아이디나 비밀번호가 잘못되었습니다.");
 		
 		return "user/login";
 	}
	
	
//	@PostMapping("/login")
//    public String login(@ModelAttribute UserInfoVO user) {
//        boolean isValidMember = uiService.isValidMember(user.getUiId(), user.getUiPassword());
//        if (isValidMember)
//            return "/";
//        return "user/login";
//    }
	
	
	//3) 로그아웃
	@GetMapping("/logout")
	public String userLogout(HttpSession session) {
		session.invalidate();
		return "index";
	}
	
	
	
	//4) 탈퇴
	@GetMapping("/user/delete")
	public String userDelete(HttpSession session, Model m) {
		UserInfoVO sessionUserInfo = (UserInfoVO) session.getAttribute("user");
		if(uiService.deleteUserInfo(sessionUserInfo)) {
			m.addAttribute("msg", "정상적으로 탈퇴되었습니다.");
			session.invalidate(); //세션도 초기화
		}
		
		return "index";
	}
	
	//관리자 회원 관리
	
	
	
}
