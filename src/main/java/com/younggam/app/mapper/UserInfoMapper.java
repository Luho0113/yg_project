package com.younggam.app.mapper;

import java.util.List;
import java.util.Optional;

import com.younggam.app.vo.ReviewInfoVO;
import com.younggam.app.vo.UserInfoVO;

public interface UserInfoMapper {
	
	

	//회원가입
	int insertUserInfo(UserInfoVO userInfo);
	
	//중복아이디조회
	UserInfoVO selectUserInfoByUiId(UserInfoVO userInfo); 
	
	//중복닉네임조회
	UserInfoVO selectUserInfoByUiNickname(UserInfoVO userInfo);
	
	//로그인
	UserInfoVO selectUserInfo(UserInfoVO userInfo);
	
	//정보수정
	int updateUserInfo(UserInfoVO userInfo);
	
	//탈퇴
	int deleteUserInfo(UserInfoVO userInfo);
	
	//내 리뷰 목록 (상세)
	//List<UserInfoVO> selectMyreviewInfos(UserInfoVO reviewInfo);
	
	
	//
	List<UserInfoVO> selectMyreviews(UserInfoVO userInfo);
	//관리자 회원 관리
	
	
}
