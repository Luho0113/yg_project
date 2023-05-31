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
		m.addAttribute("searchMovieResult", movieService.get(param)); //param 해결
		return "movie/search";
	}
	
	
	
}
