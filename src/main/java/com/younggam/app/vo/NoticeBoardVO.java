package com.younggam.app.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class NoticeBoardVO {
	private int niNum;
	private String niTitle;
	private String niContent;
	private String niFilePath;
	private String niCredat;
	private int niCnt; //조회수
	private String adminId;
	private String adminNickName;
	private MultipartFile niFile;
	
	private int page=1; //page 초기값
	private int rows=10; //한 페이지 당 정보 갯수

}
