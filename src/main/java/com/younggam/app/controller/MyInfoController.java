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

import com.younggam.app.service.ReviewCommentService;
import com.younggam.app.service.ReviewService;
import com.younggam.app.service.UserInfoService;
import com.younggam.app.vo.ReviewCommentVO;
import com.younggam.app.vo.ReviewInfoVO;
import com.younggam.app.vo.UserInfoVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MyInfoController {
	// 회원 정보 관리 컨트롤러(내 프로필, 프로필 정보 수정)

	@Autowired
	private UserInfoService uiService;

	@Autowired
	private ReviewService riService;

	@Autowired
	private ReviewCommentService rcService;

	// 1)내 프로필
	@GetMapping("/myInfo")
	public String myInfo(@RequestParam("uiNickname") String uiNickname,@ModelAttribute ReviewCommentVO reviewCommentVO, Model m) {

		List<ReviewInfoVO> myReviews = riService.selectUserReviewInfos(uiNickname);
		m.addAttribute("myReviews", myReviews);

		log.info("uiNickname ===> {}", uiNickname);

		List<ReviewCommentVO> myComments = rcService.selectUserReviewComment(reviewCommentVO);
		log.info("reviewCommentVO ===> {}", reviewCommentVO);
		log.info(" myComments ===> {}", myComments);
		m.addAttribute("myComments", myComments);

		return "profile/myInfo";
	}

	// 2)정보 수정
	@GetMapping("/myInfo-update")
	public String myInfoUpdate() {

		return "profile/myInfo-update";
	}

	@PostMapping("/myInfo-update")
	public String userUpdate(@ModelAttribute UserInfoVO userInfo, HttpSession session, Model m)
			throws IllegalStateException, IOException {

		UserInfoVO sessionUserInfo = (UserInfoVO) session.getAttribute("user"); // 세션에 저장된 정보를 가져옴, user의 데이터타입=object

		userInfo.setUiId(sessionUserInfo.getUiId()); // userInfoVO(0, id, pwd, name -> 1, id, pwd, name)
		userInfo.setUiFilePath(sessionUserInfo.getUiFilePath());
		userInfo.setUiNickname(sessionUserInfo.getUiNickname());
		userInfo.setUiPassword(sessionUserInfo.getUiPassword());
		userInfo.setUiEmail(sessionUserInfo.getUiEmail());

		if (uiService.updateUserInfo(userInfo)) { // 사용자가 입력한 값을 userInfo에 담아서 서비스에게 전달
			m.addAttribute("msg", "정보가 수정되었습니다.");
			session.setAttribute("user", userInfo); // 수정이 완료되면(return값이 1이면) 세션의 정보도 업데이트
			return "profile/myInfo";
		}

		return "profile/myInfo";
	}

	@PostMapping("/myInfo-updateN")
	public String updateNickname(@ModelAttribute UserInfoVO userInfo, HttpSession session, Model m) {
		UserInfoVO sessionUserInfo = (UserInfoVO) session.getAttribute("user");
		userInfo.setUiId(sessionUserInfo.getUiId());
		userInfo.setUiFilePath(sessionUserInfo.getUiFilePath());
		userInfo.setUiPassword(sessionUserInfo.getUiPassword());
		userInfo.setUiEmail(sessionUserInfo.getUiEmail());

		if (uiService.selectUserInfoByUiNickname(userInfo) != null) {
			m.addAttribute("msg", "uiNickname exist");
			return "profile/myInfo-update";
		} else if (uiService.updateUserNickname(userInfo)) { // 사용자가 입력한 값을 userInfo에 담아서 서비스에게 전달
			m.addAttribute("msg", "정보가 수정되었습니다.");
			session.setAttribute("user", userInfo); // 수정이 완료되면(return값이 1이면) 세션의 정보도 업데이트
			return "profile/myInfo";
		}

		return "profile/myInfo";
	}

	@GetMapping("/myInfo-updateN")
	public String updateNickname() {

		return "profile/myInfo-update";
	}

	@PostMapping("/myInfo-updateP")
	public String updatePassword(@ModelAttribute UserInfoVO userInfo, HttpSession session, Model m) {
		UserInfoVO sessionUserInfo = (UserInfoVO) session.getAttribute("user");
		userInfo.setUiId(sessionUserInfo.getUiId());
		userInfo.setUiFilePath(sessionUserInfo.getUiFilePath());
		userInfo.setUiNickname(sessionUserInfo.getUiNickname());
		userInfo.setUiEmail(sessionUserInfo.getUiEmail());

		if (uiService.updateUserPassword(userInfo)) {
			m.addAttribute("msg", "정보가 수정되었습니다.");
			session.setAttribute("user", userInfo);
		}
		return "profile/myInfo";
	}

	@GetMapping("/myInfo-updateP")
	public String updatePassword() {

		return "profile/myInfo-update";
	}

	@PostMapping("/myInfo-updateE")
	public String updateEmail(@ModelAttribute UserInfoVO userInfo, HttpSession session, Model m) {
		UserInfoVO sessionUserInfo = (UserInfoVO) session.getAttribute("user");
		userInfo.setUiId(sessionUserInfo.getUiId());
		userInfo.setUiFilePath(sessionUserInfo.getUiFilePath());
		userInfo.setUiNickname(sessionUserInfo.getUiNickname());
		userInfo.setUiPassword(sessionUserInfo.getUiPassword());

		if (uiService.updateUserEmail(userInfo)) {
			m.addAttribute("msg", "정보가 수정되었습니다.");
			session.setAttribute("user", userInfo);
		}
		return "profile/myInfo";
	}

	@GetMapping("/myInfo-updateE")
	public String updateEmail() {

		return "profile/myInfo-update";
	}

	// 리뷰 조회 (리뷰서비스사용하는거!!!!)
	@GetMapping("/userReview")
	public String getReview(@RequestParam("uiNickname") String uiNickname,
			@ModelAttribute ReviewCommentVO reviewCommentVO, Model m) {
		
		List<ReviewInfoVO> myReviews = riService.selectUserReviewInfos(uiNickname);
		m.addAttribute("myReviews", myReviews);
		log.info("uiNickname ===> {}", uiNickname);

		List<ReviewCommentVO> myComments = rcService.selectUserReviewComment(reviewCommentVO);
		log.info("reviewCommentVO ===> {}", reviewCommentVO);
		log.info(" myComments ===> {}", myComments);
		m.addAttribute("myComments", myComments);

		return "profile/userReviewList";
	}

}
