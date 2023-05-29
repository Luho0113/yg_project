package com.younggam.app.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.younggam.app.service.ReviewService;
import com.younggam.app.vo.ReviewInfoVO;

@Controller
public class ReviewInfoController {

	@Autowired
	private ReviewService riServie;
	
	//전체 글 조회
	@GetMapping("/reviews")
	public String getReviewList(@ModelAttribute ReviewInfoVO reviewInfo, Model m) {
		List<ReviewInfoVO> reviewList = riServie.selectReviewInfos(reviewInfo);
		m.addAttribute("reviewList", reviewList);
		return "review/review-list";
	}
	
	//글 작성 요청
	@GetMapping("/review-insert")
	public String goInsertReviewInfo() {
		return "review/review-insert";
	}
	
	//글 작성 응답
	@PostMapping("/review-insert")
	public String insertReview(@ModelAttribute ReviewInfoVO review, Model m) {
		if(riServie.insertReviewInfo(review)) {
			m.addAttribute("msg", "글이 등록되었습니다.");
			return "review/reviews";
		}
		return "review/reviews";
	}
	
	@GetMapping("/movie")
	public String goMovieInfo() {
		return "review/movie";
	}
	
	@GetMapping("/movie-search")
	public String goMovieSearch() {
		return "review/movie-search";
	}
	
}
