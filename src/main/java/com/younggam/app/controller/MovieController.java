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
		m.addAttribute("movie", movieService.get(param)); //배열을 전달하면 movie에 담긴 상태로 jsp 파일로 이동한다. (jsp 파일에서 for each문을 돌려 배열의 값을 꺼내면 된다.)
		return "movie/search";
	}
	
	
	
}
