package com.younggam.app.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.younggam.app.service.MovieDetailService;
import com.younggam.app.service.MovieService;
import com.younggam.app.service.ReviewerInfoService;
import com.younggam.app.vo.ReviewInfoVO;
import com.younggam.app.vo.UserInfoVO;

@Controller
public class MovieController {
	
	@Autowired
	private MovieService movieService;
	
	@Autowired
	private MovieDetailService movieDetailService;
	
	@Autowired
	private ReviewerInfoService reviewerInfoService;
	
	
	//검색 페이지
	@GetMapping("/search")
	public String getMovie(@RequestParam Map<String, String> param, Model m) {
		List<UserInfoVO> reviewerList = reviewerInfoService.selectReviewersInfo(param.get("search"));
		m.addAttribute("reviewerList", reviewerList);
		m.addAttribute("movie", movieService.getMovie(param)); //배열을 전달하면 movie에 담긴 상태로 jsp 파일로 이동한다. (jsp 파일에서 for each문을 돌려 배열의 값을 꺼내면 된다.)
		return "movie/search";
	}

	
	//영화 상세 페이지
	@GetMapping("/detail")
	public String getCast(@RequestParam("movieId") String movieId, 
						  @RequestParam("riMovieId") String riMovieId, 
						  Model m) {
		
		m.addAttribute("cast", movieDetailService.getCast(movieId)); 
		m.addAttribute("movieData",movieDetailService.getMovieDetail(movieId)); 
		m.addAttribute("movieRate",movieDetailService.getMovieCertification(movieId)); 
		
		List<ReviewInfoVO> detailReviewerList = reviewerInfoService.selectDetailReviewersInfo(riMovieId); 
		m.addAttribute("reviewer",detailReviewerList);
	
		ReviewInfoVO star = reviewerInfoService.selectStarInfo(riMovieId);
		m.addAttribute("star", star);
		
		return "movie/detail"; 
	}
	
}
