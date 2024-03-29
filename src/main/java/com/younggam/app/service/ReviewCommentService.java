package com.younggam.app.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.younggam.app.mapper.ReviewCommentMapper;
import com.younggam.app.vo.ReviewCommentVO;

@Service
public class ReviewCommentService {
	
	@Autowired
	private ReviewCommentMapper rcMapper;
	
	//댓글 조회
	public List<ReviewCommentVO> selectReviewComment(int riNum){
		return rcMapper.selectReviewComment(riNum);
	}
	
	//댓글 입력
	public boolean insertReviewComment(ReviewCommentVO reviewCommentVO) {
		return rcMapper.insertReviewComment(reviewCommentVO) == 1;
	}
	
	//댓글 삭제
	public boolean deleteReviewComment(int rcNum) {
		return rcMapper.deleteReviewComment(rcNum) == 1;
	}
	
	//나의 댓글
	public List<ReviewCommentVO> selectUserReviewComment(ReviewCommentVO reviewCommentVO){
		return rcMapper.selectUserReviewComment(reviewCommentVO);
	}

}
