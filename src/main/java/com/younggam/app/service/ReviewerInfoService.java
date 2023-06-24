package com.younggam.app.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.younggam.app.mapper.ReviewerInfoMapper;
import com.younggam.app.vo.ReviewInfoVO;
import com.younggam.app.vo.UserInfoVO;

@Service
public class ReviewerInfoService {
	
	@Autowired
	private ReviewerInfoMapper riMapper;
	
	//검색 - 리뷰어 조회
	public List<UserInfoVO> selectReviewersInfo (String uiNickname) {
		return riMapper.selectReviewersInfos(uiNickname);
	}
	
	//상세 - 리뷰어 목록
	public List<ReviewInfoVO> selectDetailReviewersInfo (String riMovieId) {
		return riMapper.selectDetailReviewersInfos(riMovieId);
	}
	
	//별점
	public ReviewInfoVO selectStarInfo (String riMovieId) {
		return riMapper.selectStarInfos(riMovieId);
	}
	
	//포인트
	
	
}
