package com.younggam.app.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.younggam.app.service.MovieService;

@Controller
public class MovieController {
	
	@Autowired
	private MovieService movieService;
	
	@GetMapping("/search")
	public String getMovie(@RequestParam Map<String, String> param, Model m) {
		m.addAttribute("movie", movieService.getMovie(param));//배열을 전달하면 movie에 담긴 상태로 jsp 파일로 이동한다. (jsp 파일에서 for each문을 돌려 배열의 값을 꺼내면 된다.)
		return "movie/search";
	}
	
	@GetMapping("/credit")
	public String getCredit(@RequestParam("movieId") String movieId, Model m) {
		m.addAttribute("credit", movieService.getCredit(movieId)); //배열을 전달하면 movie에 담긴 상태로 jsp 파일로 이동한다. (jsp 파일에서 for each문을 돌려 배열의 값을 꺼내면 된다.)
		return "movie/search";
	}
//배우와 감독을 출력하기 위해서 만들었으나 현재 영화 검색 페이지(=search)에서 조회 가능하기 때문에 삭제 보류(필요 없으면 삭제 하3~)
	
	@GetMapping("/detail")
	public String getDetail() {
		return "movie/detai";
	}
	
	

	
	
	
}
