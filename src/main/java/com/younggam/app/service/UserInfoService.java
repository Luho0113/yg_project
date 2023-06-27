package com.younggam.app.service;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.younggam.app.mapper.UserInfoMapper;
import com.younggam.app.vo.UserInfoVO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class UserInfoService {
	
	@Autowired
	private UserInfoMapper uiMapper;
	
	
	//프로필 사진 저장 경로 설정
	private final String uploadFilePath = "C:\\works\\workspace\\YoungGamProject\\src\\main\\webapp\\resources\\upload";
	//저장 경로 : C:\\works\\workspace\\YoungGamProject\\src\\main\\webapp\\resources\\upload
	
	//삭제 경로 설정
	private final String deleteFilePath = "C:\\works\\workspace\\YoungGamProject\\src\\main\\webapp";
	
	//회원 가입
	public boolean join(UserInfoVO userInfo) {
		
		return uiMapper.insertUserInfo(userInfo)==1;
	}
	
	//중복 아이디 조회 + 회원 상세 정보
	public UserInfoVO getUserInfoVOByUiId(UserInfoVO userInfo) {
		
		return uiMapper.selectUserInfoByUiId(userInfo);
	}

	// 중복 닉네임 조회
	public UserInfoVO selectUserInfoByUiNickname(UserInfoVO userInfo) {
		
		return uiMapper.selectUserInfoByUiNickname(userInfo);
	}
	
	
	//회원 로그인
	public boolean login(UserInfoVO userInfo, HttpSession session) {
		
		userInfo = uiMapper.selectUserInfo(userInfo);
		
		if(userInfo != null) {
			session.setAttribute("user", userInfo); //세션에 유저정보 저장
			
			return true;
		}
		
		return false;
	}
	
	
	// 회원 정보 수정 - 프로필 사진 변경하기
	public boolean updateUserInfo(UserInfoVO userInfo) throws IllegalStateException, IOException {
		String extName = userInfo.getUiFile().getOriginalFilename();

		if (!"".equals(extName)) {
			if (extName.lastIndexOf(".") != -1) { // 확장자명이 틀리면 idx = -1
				extName = extName.substring(extName.lastIndexOf(".")); // .jpg, .png
			}
			String name = UUID.randomUUID().toString(); // 문자와 숫자로 이루어진 난수
			File file = new File(uploadFilePath, name + extName);
			
			//이미 프로필 사진이 있다면 해당 파일 제거
			if(userInfo.getUiFilePath() != null) {
				File exfile = new File(deleteFilePath + userInfo.getUiFilePath());
				exfile.delete();
			} 
			
			userInfo.getUiFile().transferTo(file);
			userInfo.setUiFilePath("/resources/upload/" + name + extName);
		} 
		return uiMapper.updateUserInfo(userInfo) == 1;
	}
	
	// 회원 정보 수정 - 닉네임 변경하기
	public boolean updateUserNickname(UserInfoVO userInfo) {
		
		return uiMapper.updateUserNickname(userInfo) == 1;
	}
	
	// 회원 정보 수정 - 비밀번호 변경하기
	public boolean updateUserPassword(UserInfoVO userInfo) {
		
		return uiMapper.updateUserPassword(userInfo) == 1;
	}
	
	// 회원 정보 수정 - 이메일주소 변경하기
	public boolean updateUserEmail(UserInfoVO userInfo) {
		
		return uiMapper.updateUserEmail(userInfo) == 1;
	}
	
	//회원 탈퇴 + 회원 삭제
	public boolean deleteUserInfo(UserInfoVO userInfo) {
		
		return uiMapper.deleteUserInfo(userInfo) == 1;
	}
	
	
	//관리자 회원 관리
	//회원 목록 + 페이징 + 검색
	public PageInfo<UserInfoVO> getUserInfos(UserInfoVO user){
		PageHelper.startPage(user.getPage(), user.getRows());
		return new PageInfo<>(uiMapper.selectUserInfosByAdmin(user));
	}
		
	//비활성 회원 목록 + 페이징 + 검색
	public PageInfo<UserInfoVO> getInactiveUsers(UserInfoVO user){
		PageHelper.startPage(user.getPage(), user.getRows());
		return new PageInfo<>(uiMapper.selectInactiveUsers(user));
	}
	
	//회원 수정
	public boolean updateUserByAdmin(UserInfoVO user) throws IllegalStateException, IOException {
		String saveName = user.getUiFile().getOriginalFilename();
		if(!"".equals(saveName)) {
			if(saveName.lastIndexOf(".") != -1) {
				saveName = saveName.substring(saveName.lastIndexOf("."));
			}
			String name = UUID.randomUUID().toString();
			log.info("save file name=>{}", name+saveName);
			File file = new File(uploadFilePath, name+saveName);
				user.getUiFile().transferTo(file);
				user.setUiFilePath("/resources/upload/" + name + saveName);
		}
		return uiMapper.updateUserByAdmin(user)==1;
	}
	
	

}
