package com.younggam.app.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.younggam.app.service.ReviewService;
import com.younggam.app.service.UserInfoService;
import com.younggam.app.vo.ReviewInfoVO;
import com.younggam.app.vo.UserInfoVO;


@Controller
public class MyInfoController {
	// 회원 정보 관리 컨트롤러(내 프로필, 프로필 정보 수정)
	
	@Autowired
	private UserInfoService uiService;
	
	@Autowired
	private ReviewService riService;

	// 1)내 프로필
	@GetMapping("/myInfo")
	public String myInfo(@RequestParam("uiNickname") String uiNickname, Model m) {
		
		List<ReviewInfoVO> myReviews = riService.selectUserReviewInfos(uiNickname);
		m.addAttribute("myReviews", myReviews);
		
		return "profile/myInfo";
	}

	// 2)정보 수정
	@GetMapping("/myInfo-update")
	public String myInfoUpdate() {

		return "profile/myInfo-update";
	}

	@PostMapping("/myInfo-update")
	public String userUpdate(@ModelAttribute UserInfoVO userInfo, HttpSession session, Model m) throws IllegalStateException, IOException {

		UserInfoVO sessionUserInfo = (UserInfoVO) session.getAttribute("user"); // 세션에 저장된 정보를 가져옴, user의 데이터타입=object

		userInfo.setUiId(sessionUserInfo.getUiId()); // userInfoVO(0, id, pwd, name -> 1, id, pwd, name)

		if (uiService.updateUserInfo(userInfo)) { // 사용자가 입력한 값을 userInfo에 담아서 서비스에게 전달
			m.addAttribute("msg", "정보가 수정되었습니다.");
			session.setAttribute("user", userInfo); // 수정이 완료되면(return값이 1이면) 세션의 정보도 업데이트
		}
		return "profile/myInfo";
	}
	
	
	
	
	// 리뷰 조회 (리뷰서비스사용하는거!!!!)
	@GetMapping("/userReview")
	public String getReview(@RequestParam("uiNickname") String uiNickname, Model m) {
		
		List<ReviewInfoVO> myReviews = riService.selectUserReviewInfos(uiNickname);
		m.addAttribute("myReviews", myReviews);
		
		return "profile/userReviewList";
	}

}
