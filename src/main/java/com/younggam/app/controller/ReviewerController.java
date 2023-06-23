package com.younggam.app.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import com.younggam.app.service.ReviewerInfoService;
import com.younggam.app.vo.UserInfoVO;

@Controller
public class ReviewerController {

	@Autowired
	private ReviewerInfoService reviewerInfoService;
	
	
	//검색어가 포함된 리뷰어 조회
//	@GetMapping("/search")
//	public String getReviewerList(@ModelAttribute String uiNickname, Model m) {
//		List<UserInfoVO> reviewerList = reviewerInfoService.selectReviewersInfo(uiNickname);
//		m.addAttribute("reviewerList", reviewerList);
//		return "movie/search";
//	}
	
	
	
	//유저의 리뷰리스트로 이동
//	@GetMapping("/userReview")
//	public String getRRRRRRRRR(@RequestParam UserInfoVO userInfoVO, Model m) {
//		//List<UserInfoVO> reviewerList = reviewerInfoService.
//		//m.addAttribute("reviewerList",reviewerList); //jsp ${reviewerList}
//		//m.addAttribute("movie", movieService.getMovie(param));//배열을 전달하면 movie에 담긴 상태로 jsp 파일로 이동한다. (jsp 파일에서 for each문을 돌려 배열의 값을 꺼내면 된다.)
//		return "profile/userReviewList";
//	}
	}
