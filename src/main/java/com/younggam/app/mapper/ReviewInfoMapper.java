package com.younggam.app.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.younggam.app.vo.ReviewInfoVO;

//@Mapper
public interface ReviewInfoMapper {
	
	List<ReviewInfoVO> selectReviewInfos(ReviewInfoVO reivews);
	
	int insertReviewInfo(ReviewInfoVO review);
	

}
