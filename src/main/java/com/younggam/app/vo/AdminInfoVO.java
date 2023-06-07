package com.younggam.app.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class AdminInfoVO {
	private MultipartFile miFile; //관리자 프로필 이미지
	private String adminId; //관리자 아이디
	private String adminName; //관리자 이름
	private String adminNickName; //관리자 닉네임
	private String adminPwd; //관리자 비밀번호
	private String adminFilePath; //관리자 프로필 이미지 경로
	private String adminEmail; //관리자 이메일
}
