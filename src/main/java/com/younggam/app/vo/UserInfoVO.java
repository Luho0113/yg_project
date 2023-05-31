package com.younggam.app.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class UserInfoVO {
	
	private String uiId; //ui_id 회원 아이디
	private String uiName; //ui_name 회원 이름
	private String uiNickname; //ui_nickname 회원 닉네임
	private String uiPassword; //ui_password 회원 비밀번호
	private String uiFilePath; //ui_file_path 파일 경로(프로필사진)
	private String uiEmail; //ui_email 회원 이메일
	private String uiReviewPoint; //ui_review_point 리뷰포인트
	private String uiActive; //ui_active 회원 상태
	
	
	private MultipartFile uiFile;
	
}
