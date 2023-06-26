package com.younggam.app.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;


import com.younggam.app.service.MovieMainService;
import com.younggam.app.service.ReviewerInfoService;
import com.younggam.app.vo.ReviewInfoVO;

@Controller
public class MainController {
	//메인화면 컨트롤러(/)
	
	@Autowired
	private MovieMainService movieMainService;
	
	@Autowired
	private ReviewerInfoService reviewerInfoService; 
	
	//현재 상영 영화/
	@GetMapping("/")
//	public String home() {
//		return "index";
//		
	public String home(  
						 @ModelAttribute ReviewInfoVO reviews,
						Model m) {
		m.addAttribute("nowPlaying", movieMainService.getNowPlaying());
		
		
		
		List<ReviewInfoVO> newReviewList = reviewerInfoService.selectNewReviewersInfo(reviews);
		m.addAttribute("newReviewList",newReviewList);
		return "index";
	}
	
	
}