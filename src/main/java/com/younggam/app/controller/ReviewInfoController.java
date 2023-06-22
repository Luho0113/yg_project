package com.younggam.app.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.younggam.app.service.MovieReviewServiece;
import com.younggam.app.service.MovieService;
import com.younggam.app.service.ReviewService;
import com.younggam.app.vo.ReviewInfoVO;
import com.younggam.app.vo.UserInfoVO;

@Controller
public class ReviewInfoController {

	@Autowired
	private ReviewService riServie;
	
	@Autowired
	private MovieService movieService;
	
	@Autowired
	private MovieReviewServiece movieReivewServiece;
	
	//전체 글 조회
	@GetMapping("/reviews")
	public String getReviewList(@ModelAttribute ReviewInfoVO reviewInfo, Model m) {
		List<ReviewInfoVO> reviewList = riServie.selectReviewInfos(reviewInfo);
		m.addAttribute("reviewList", reviewList);
		return "review/review-list";
	}
	
	//글 상세보기
	@GetMapping("/review")
	public String getReview(@RequestParam("riNum") int riNum, @RequestParam("movieId") String movieId, Model m) {
		ReviewInfoVO review = riServie.selectReviewInfo(riNum);
		
		m.addAttribute("review", review);
		return "review/review-detail";
	}
	
	//글 작성 요청(구현됨)
	@GetMapping("/review-insert")
	public String goInsertReviewInfo(@RequestParam Map<String, String> param, Model m) {
		m.addAttribute("movie", movieReivewServiece.getMovieInfo(param));
		return "review/review-insert";
	}
	
	//글 작성 응답(구현됨) - return 값 수정 필요함
	@PostMapping("/review-insert")
	public String insertReview(ReviewInfoVO review, Model m, HttpSession session) {
		UserInfoVO user = (UserInfoVO) session.getAttribute("user");
		review.setUiId(user.getUiId());
		if(riServie.insertReviewInfo(review)) {
			return "review/review-list";
		}
		return "review/review-list";
	}
	

	
	// 삭제!!!
	@GetMapping("/movie")
	public String goMovieInfo() {
		return "review/movie";
	}
	
	@GetMapping("/movie-search")
	public String goMovieSearch() {
		return "review/movie-search";
	}
	
}
