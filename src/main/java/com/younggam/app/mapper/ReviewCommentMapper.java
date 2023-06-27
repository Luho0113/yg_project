package com.younggam.app.mapper;

import java.util.List;

import com.younggam.app.vo.ReviewCommentVO;

public interface ReviewCommentMapper {
	
	//댓글 조회
	List<ReviewCommentVO> selectReviewComment(int riNum);
	
	//댓글 작성
	int insertReviewComment(ReviewCommentVO reviewCommentVO);
	
	//댓글 삭제
	int deleteReviewComment(int rcNum);

	//나의 리뷰
	List<ReviewCommentVO> selectUserReviewComment(ReviewCommentVO reviewCommentVO);
}
