package com.younggam.app.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.younggam.app.service.MovieDetailService;
import com.younggam.app.service.MovieMainService;
import com.younggam.app.vo.MovieVO;
import com.younggam.app.vo.ReviewInfoVO;

@Controller
public class MainController {
	//메인화면 컨트롤러(/)

	@Autowired
	private MovieMainService movieMainService;

	@Autowired
	private MovieDetailService movieDetailService;


	//메인 페이지
	@GetMapping("/")

	public String home(@ModelAttribute ReviewInfoVO reviews,
			@ModelAttribute MovieVO movies,
			Model m) {

		//현재 상영 영화
		m.addAttribute("nowPlaying", movieMainService.getNowPlaying()); 

		//최신 리뷰 리스트
		List<ReviewInfoVO> newReviewList = movieMainService.selectNewReviewersInfo(reviews);
		m.addAttribute("newReviewList",newReviewList);


		//영화 아이디, 별접 결과값 받기
		List<ReviewInfoVO> BestMovieList = movieMainService.selectBestMoviesInfo(reviews);
		m.addAttribute("BestMovieList", BestMovieList);

		//영화 아이디와 별점 연결
		List<MovieVO> movieInfo = new ArrayList<>();

		//별점 높은 영화
		if(BestMovieList.size()>4) {
			
			for(int i=0; i<5; i++) {
				MovieVO movievo = movieDetailService.getMovieDetail(BestMovieList.get(i).getRiMovieId());
				movieInfo.add(movievo);
			}
		
			m.addAttribute("MovieInfo", movieInfo);
		
		} else {
		
			for(int i=0; i<BestMovieList.size(); i++) {
				MovieVO movievo = movieDetailService.getMovieDetail(BestMovieList.get(i).getRiMovieId());
				movieInfo.add(movievo);
			}
			
			m.addAttribute("MovieInfo", movieInfo);
		
		}

		return "index";
	}







	//웹사이트 정보
	@GetMapping("/about")
	public String about() {
		return "common/about";
	}



}
