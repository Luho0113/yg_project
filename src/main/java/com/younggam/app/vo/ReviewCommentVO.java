package com.younggam.app.vo;

import lombok.Data;

@Data
public class ReviewCommentVO {
	
	private String rcNum;
	private String rcContent;
	private String rcCredate;
	private String rcLikeCnt;
	private int riNum;
	private String uiId;
	
	private String uiNickname; //ui_nickname 회원 닉네임
	private String uiFilePath; //ui_file_path 파일 경로(프로필사진)
	
}
