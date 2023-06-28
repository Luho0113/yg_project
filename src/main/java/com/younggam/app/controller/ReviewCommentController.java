package com.younggam.app.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.younggam.app.service.ReviewCommentService;
import com.younggam.app.vo.ReviewCommentVO;
import com.younggam.app.vo.UserInfoVO;


@Controller
public class ReviewCommentController {
	
	@Autowired
	private ReviewCommentService rcService;
	
	//리뷰 댓글 작성 응답
	@PostMapping("/review-comment")
	public String insertReviewComment(ReviewCommentVO reviewComment, Model m, HttpSession session, HttpServletRequest request) {
		UserInfoVO user = (UserInfoVO) session.getAttribute("user");
		reviewComment.setUiId(user.getUiId());
		if(rcService.insertReviewComment(reviewComment)) {
			return "redirect:" + request.getHeader("Referer");
		}
		return "redirect:/reviews";
	}
	
	//리뷰 댓글 삭제
	@GetMapping("/delete-comment")
	public String deleteReviewComment(@RequestParam("rcNum") int rcNum, Model m) {
		if(rcService.deleteReviewComment(rcNum)) {
			 return "redirect:/reviews";
		}
		return "redirect:/reviews";
	}
	

}
