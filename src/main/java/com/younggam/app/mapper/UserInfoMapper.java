package com.younggam.app.mapper;

import java.util.Optional;

import com.younggam.app.vo.UserInfoVO;

public interface UserInfoMapper {
	
	

	//회원가입
	int insertUserInfo(UserInfoVO userInfo);
	
	//중복아이디조회
	UserInfoVO selectUserInfoByUiId(UserInfoVO userInfo); //
	
	//로그인
	UserInfoVO selectUserInfo(UserInfoVO userInfo);
	
	//정보수정
	int updateUserInfo(UserInfoVO userInfo);
	
	//탈퇴
	int deleteUserInfo(UserInfoVO userInfo);
	
	//스프링 시큐리티
	Optional<UserInfoVO> findUserInfoByUiId(String uiId); 

	
	
}
