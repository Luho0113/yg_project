package com.younggam.app.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.younggam.app.mapper.ReviewInfoMapper;
import com.younggam.app.mapper.UserInfoMapper;
import com.younggam.app.vo.ReviewInfoVO;
import com.younggam.app.vo.UserInfoVO;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class UserInfoService {
	
	@Autowired
	private UserInfoMapper uiMapper;
	
	
	//프로필 사진 저장 경로 설정
	private final String uploadFilePath = "C:\\works\\workspace\\YoungGamProject\\src\\main\\webapp\\resources\\upload";
	//저장 경로 : C:\\works\\workspace\\YoungGamProject\\src\\main\\webapp\\resources\\upload
	
	//회원 가입
	public boolean join(UserInfoVO userInfo) throws IllegalStateException, IOException {
		
		String extName = userInfo.getUiFile().getOriginalFilename();

		if (!"".equals(extName)) {
			if (extName.lastIndexOf(".") != -1) { // 확장자명이 틀리면 idx = -1
				extName = extName.substring(extName.lastIndexOf(".")); // .jpg, .png
			}
			String name = UUID.randomUUID().toString(); // 문자와 숫자로 이루어진 난수
			File file = new File(uploadFilePath, name + extName);

			userInfo.getUiFile().transferTo(file);
			userInfo.setUiFilePath("/resources/upload/" + name + extName);
		} 
		return uiMapper.insertUserInfo(userInfo)==1;
	}
	
	//중복 아이디 조회
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
	
	
	//회원 정보 수정
	public boolean updateUserInfo(UserInfoVO userInfo) throws IllegalStateException, IOException {
		String extName = userInfo.getUiFile().getOriginalFilename();

		if (!"".equals(extName)) {
			if (extName.lastIndexOf(".") != -1) { // 확장자명이 틀리면 idx = -1
				extName = extName.substring(extName.lastIndexOf(".")); // .jpg, .png
			}
			String name = UUID.randomUUID().toString(); // 문자와 숫자로 이루어진 난수
			File file = new File(uploadFilePath, name + extName);

			userInfo.getUiFile().transferTo(file);
			userInfo.setUiFilePath("/resources/upload/" + name + extName);
		} 
		return uiMapper.updateUserInfo(userInfo) == 1;
	}
	
	//회원 탈퇴
	public boolean deleteUserInfo(UserInfoVO userInfo) {
		
		return uiMapper.deleteUserInfo(userInfo) == 1;
	}
	
	
	
	
	
	//관리자 회원 관리

}
