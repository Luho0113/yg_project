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
	
	@GetMapping("/search")
	public String getMovie(@RequestParam Map<String, String> param, Model m) {
		List<UserInfoVO> reviewerList = reviewerInfoService.selectReviewersInfo(param.get("search"));
		m.addAttribute("reviewerList", reviewerList);
		m.addAttribute("movie", movieService.getMovie(param));//배열을 전달하면 movie에 담긴 상태로 jsp 파일로 이동한다. (jsp 파일에서 for each문을 돌려 배열의 값을 꺼내면 된다.)
		return "movie/search";
	}
	
//	@GetMapping("/credit")
//	public String getCredit(@RequestParam("movieId") String movieId, Model m) {
//		m.addAttribute("credit", movieService.getCredit(movieId)); //배열을 전달하면 movie에 담긴 상태로 jsp 파일로 이동한다. (jsp 파일에서 for each문을 돌려 배열의 값을 꺼내면 된다.)
//		return "movie/search";
//	}
//배우와 감독을 출력하기 위해서 만들었으나 현재 영화 검색 페이지(=search)에서 조회 가능하기 때문에 삭제 보류(필요 없으면 삭제 하3~)
	
	
	//detail 페이지
	//MovieDetailService에 getCast()메소드에 movieId를 넣는 다음 값을 movie/detail에 출력
	@GetMapping("/detail")
	public String getCast(@RequestParam("movieId") String movieId, 
						  @RequestParam("riMovieId") String riMovieId, 
						//  @RequestParam("riStar")  String riStar, 
						  Model m) {
		m.addAttribute("cast", movieDetailService.getCast(movieId)); //은진 수지가 만든 메소드
		m.addAttribute("movieData",movieDetailService.getMovieDetail(movieId)); //은진 수지가 만든 메소드
		m.addAttribute("movieRate",movieDetailService.getMovieCertification(movieId)); //은진 수지가 만든 메소드
		
		List<ReviewInfoVO> detailReviewerList = reviewerInfoService.selectDetailReviewersInfo(riMovieId); 
		m.addAttribute("reviewer",detailReviewerList);
	
		ReviewInfoVO star = reviewerInfoService.selectStarInfo(riMovieId);
		m.addAttribute("star", star);
		
		return "movie/detail"; 
	}
	
	


	
	
	
}
