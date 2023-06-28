package com.younggam.app.mapper;

import java.util.List;
import java.util.Optional;

import com.younggam.app.vo.ReviewInfoVO;
import com.younggam.app.vo.UserInfoVO;

public interface UserInfoMapper {
	
	

	//회원가입
	int insertUserInfo(UserInfoVO userInfo);
	
	//중복아이디조회 + 회원 상세 정보
	UserInfoVO selectUserInfoByUiId(UserInfoVO userInfo); 
	
	//중복닉네임조회
	UserInfoVO selectUserInfoByUiNickname(UserInfoVO userInfo);
	
	//로그인
	UserInfoVO selectUserInfo(UserInfoVO userInfo);
	
	//정보수정
	int updateUserInfo(UserInfoVO userInfo);
	
	//정보수정 - 닉네임
	int updateUserNickname(UserInfoVO userInfo);
	
	//정보수정 - 비밀번호
	int updateUserPassword(UserInfoVO userInfo);
	
	
	//정보수정 - 이메일
	int updateUserEmail(UserInfoVO userInfo);
	
	
	//탈퇴
	int deleteUserInfo(UserInfoVO userInfo);
	
	//내 리뷰 목록 (상세)
	//List<UserInfoVO> selectMyreviewInfos(UserInfoVO reviewInfo);
	
	
	//
	List<UserInfoVO> selectMyreviews(UserInfoVO userInfo);
	
	
	//관리자 회원 관리
	List<UserInfoVO> selectUserInfosByAdmin(UserInfoVO user); //회원 목록 + 페이징 + 검색
	
	int updateUserByAdmin(UserInfoVO user); //회원 수정
	
	List<UserInfoVO> selectInactiveUsers(UserInfoVO user); //비활성화 회원 목록 + 페이징 + 검색
	
	int kickoutUser(String uiId);
	
	
}
