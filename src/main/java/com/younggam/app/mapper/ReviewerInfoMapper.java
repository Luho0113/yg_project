package com.younggam.app.mapper;

import java.util.List;

import com.younggam.app.vo.UserInfoVO;

public interface ReviewerInfoMapper {

	//전체 유저 조회
	List<UserInfoVO> selectReviewersInfos(UserInfoVO users);
}
