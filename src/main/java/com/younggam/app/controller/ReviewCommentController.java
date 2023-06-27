package com.younggam.app.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;

import com.younggam.app.service.ReviewCommentService;
import com.younggam.app.vo.ReviewCommentVO;
import com.younggam.app.vo.UserInfoVO;


@Controller
public class ReviewCommentController {
	
	@Autowired
	private ReviewCommentService rcService;
	
	@PostMapping("/review-comment")
	public String insertReviewComment(ReviewCommentVO reviewComment, Model m, HttpSession session) {
		UserInfoVO user = (UserInfoVO) session.getAttribute("user");
		reviewComment.setUiId(user.getUiId());
		if(rcService.insertReviewComment(reviewComment)) {
			return "redirect:/reviews";
		}
		return "redirect:/reviews";
	}

}
