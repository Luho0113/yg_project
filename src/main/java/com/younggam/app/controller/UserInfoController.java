package com.younggam.app.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
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

		return "index";
	}
	
	@Autowired
	private UserInfoService uiService;
	
	//회원가입
	@GetMapping("/join")
	public String join() {

		return "user/join";
	}
	
	@PostMapping("/join")
	public String join(@ModelAttribute UserInfoVO user, Model m) throws IllegalStateException, IOException {
		
		m.addAttribute("msg", "join fail");
		
		if(uiService.getUserInfoVOByUiId(user) != null) { //사용자 아이디가 이미 있는 경우(null이 아니라면)
			
			m.addAttribute("msg", "uiId exist");
			return "user/join";
			
		} else if(uiService.selectUserInfoByUiNickname(user) != null) { //사용자 닉네임이 이미 있는 경우
			
			m.addAttribute("msg", "uiNickname exist");
			return "user/join";
			
		} else if(uiService.join(user)) {
			
			m.addAttribute("joinMessage", "회원가입에 성공했습니다.");
		}
		
		return "user/joinSuccess"; //회원 가입 성공 안내 화면으로 이동
	}

	// 중복 아이디 확인
	@GetMapping("/check-id")
	@ResponseBody
	public boolean checkId(@ModelAttribute UserInfoVO user, Model m) throws IllegalStateException, IOException {		
		return uiService.getUserInfoVOByUiId(user) != null;
	}

	
	
	@GetMapping("/joinSuccess")
	public String joinSuccess() {
		
		return "user/joinSuccess";
	}
	
	//2) 로그인
	@GetMapping("/login")
	public String login() {
		
		return "user/login";
	}

	
 	@PostMapping("/login")
 	public String login(@ModelAttribute UserInfoVO user, HttpSession session, Model m) {
 		
 		//로그인에 성공한 경우
 		if(uiService.login(user, session)) { 
 			
 			user = (UserInfoVO) session.getAttribute("user"); //세션에 저장되어 있는 사용자의 정보를 user에 담음
 			
 			//사용자의 uiActive에 따라 로그인 처리
 			if(user.getUiActive().equals("0")) { //정지된 계정인 경우
 				session.invalidate();  //세션 초기화
 				//m.addAttribute("msg", "error");
				return "user/loginSuspended"; //안내 페이지로 이동
			} 
 			
 			//사용자의 default uiActive = 1, 자동으로 로그인 성공 처리
 			return "index";
 		}
 		
 		//로그인에 실패한 경우 (없는 계정이거나 아이디 or 비밀번호가 틀렸을 때)
 		m.addAttribute("msg", "error");
 		
 		return "user/login";
 	}
	
	
	//3) 로그아웃
	@GetMapping("/logout")
	public String userLogout(HttpSession session) {
		
		session.invalidate(); //세션 초기화
		return "index";
		
	}
	
	
	
	//4) 탈퇴 + 회원 삭제
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
	//회원 목록 + 페이징 + 검색
		@GetMapping("/admin/users")
		public String getUserInfos(@ModelAttribute UserInfoVO user, Model m) {
			m.addAttribute("page", uiService.getUserInfos(user));
			return "admin/user/user-list";	
		}
		
	//비활성 회원 목록 + 페이징 + 검색
		@GetMapping("/admin/inactive-users")
		public String getInactiveUsers(@ModelAttribute UserInfoVO user, Model m) {
			m.addAttribute("page", uiService.getInactiveUsers(user));
			return "admin/user/users-inactive";
		}
		
	//회원 상세 정보
		@GetMapping("/admin/user")
		public String getUserInfoByAdmin(Model m, UserInfoVO user) {
			user = uiService.getUserInfoVOByUiId(user);
			m.addAttribute("user", user);
			return "admin/user/user-view";
		}
		
	//회원 수정
		@GetMapping("/admin/user-update")
		public String updateUserByAdmin(Model m, UserInfoVO user) {
			user = uiService.getUserInfoVOByUiId(user);
			m.addAttribute("user", user);
			return "admin/user/user-update";
		}
		
		@PostMapping("/admin/user-update")
		public String userUpdate(UserInfoVO user, Model m) throws IllegalStateException, IOException {
			String msg = "회원 정보 수정에 실패하였습니다.";
			String url = "/admin/user-update?uiId=" + user.getUiId();
			if(uiService.updateUserByAdmin(user)) {
				msg = "회원 정보가 수정되었습니다.";
				url = "/admin/users";
			}
			m.addAttribute("msg", msg);
			m.addAttribute("url", url);
			return "common/msg";
		}
		
	//회원 삭제
		@GetMapping("/admin/user-delete")
		public String deleteUserByAdmin(Model m, UserInfoVO user) {
			String msg = "회원 정보 삭제가 실패하였습니다.";
			String url = "/admin/user?uiId=" + user.getUiId();
			if(uiService.deleteUserInfo(user)) {
				msg = "회원 정보가 삭제되었습니다.";
				url = "/admin/users";
			}
			m.addAttribute("msg", msg);
			m.addAttribute("url", url);
			return "common/msg";
		}	
		
		
	
	
	
}
