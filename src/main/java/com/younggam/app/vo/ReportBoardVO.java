package com.younggam.app.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ReportBoardVO {
	private int piNum;
	private String piTitle;
	private String piCategory;
	private String piContent;
	private String piFilePath;
	private String piCredat;
	private String uiId;
	private String uiNickname;
	private MultipartFile piFile;
	
	private int page=1; //page 초기값
	private int rows=10; //한 페이지 당 정보 갯수

}
