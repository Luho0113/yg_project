package com.younggam.app.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class MovieInfoVO {
	private MultipartFile miFile;
	private String miCode;
	private String miTitle;
	private String miOrgTitle;
	private String miOpenDate;
	private String miShowTime;
	private String miNation;
	private String miGenre;
	private String miDirector;
	private String miActor;
	private String miCast;
	private String miImage;
	private String miOverview;
	private String miAdult;
	
}
