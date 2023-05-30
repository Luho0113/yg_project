package com.younggam.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserInfoController {

	@GetMapping("/")
	public String home() {
		return "index";
	}
}
