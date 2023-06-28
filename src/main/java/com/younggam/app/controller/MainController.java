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
	
	//현재 상영 영화/
	@GetMapping("/")
	
	public String home(  
						 @ModelAttribute ReviewInfoVO reviews,
						 @ModelAttribute MovieVO movies,
						
						Model m) {
		m.addAttribute("nowPlaying", movieMainService.getNowPlaying());
		

		List<ReviewInfoVO> newReviewList = movieMainService.selectNewReviewersInfo(reviews);
		m.addAttribute("newReviewList",newReviewList);
		
		//겟무비디테일을 여기에서 호출하는데 포문을 돌려서 결과값여러개받기 포문길이는 정하기
		
		//1. 결과값 받기 2. 결과값에서 무비아이디 꺼내기 3. 아이디로 무디비디테일() 불러오기 ...2,3번 포문/ 별점이랑 영화정보는 따로 담기는데 배열 순서로 맞춰서 같이 호출 리리리스트에서 무미아이디 꺼내고
		//1. 무비아이디,별접 결과값 받기
		//2. 결과값에서 무비아이디 꺼내기
		//3. 아이디로 무비디테일()불러오기
		//4. 2-3번 포문 돌리기
		//5. jsp에서 두개 부르기(배열 번호에 맞춰서 호출)
		
		//1. 무비아이디,별접 결과값 받기
		List<ReviewInfoVO> BestMovieList = movieMainService.selectBestMoviesInfo(reviews);
		m.addAttribute("BestMovieList", BestMovieList);
		
		//2. 결과값에서 무비아이디 꺼내기 riMovieId
		
		List<MovieVO> movieInfo = new ArrayList<>();
			
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
