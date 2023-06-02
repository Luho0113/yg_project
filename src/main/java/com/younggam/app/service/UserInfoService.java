package com.younggam.app.service;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.younggam.app.mapper.UserInfoMapper;
import com.younggam.app.vo.UserInfoVO;

@Service
public class UserInfoService {
	
	@Autowired
	private UserInfoMapper uiMapper;
	
	private final String uploadFilePath = "C:\\works\\workspace\\YoungGamProject\\src\\main\\webapp\\resources";
	
	//1) 회원가입
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
		} else if("".equals(extName)) {
			
		}

		
		return uiMapper.insertUserInfo(userInfo)==1;
	}
	
	//2) 중복아이디조회
	public UserInfoVO getUserInfoVOByUiId(UserInfoVO userInfo) {
		
		return uiMapper.selectUserInfoByUiId(userInfo);
	}
	
	//3) 로그인
	public boolean login(UserInfoVO userInfo, HttpSession session) {
		
		userInfo = uiMapper.selectUserInfo(userInfo);
		
		if(userInfo != null) {
			session.setAttribute("user", userInfo); //세션에 유저정보 저장
			return true;
		}
		
		return false;
	}
	
	//4) 탈퇴
	public boolean delete(UserInfoVO userInfo) {
		
		return uiMapper.deleteUserInfo(userInfo) == 1;
	}
	
	
}