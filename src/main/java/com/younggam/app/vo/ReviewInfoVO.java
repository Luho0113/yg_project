package com.younggam.app.vo;

import lombok.Data;

@Data
public class ReviewInfoVO {
	    
	    private int riNum; //리뷰 넘버
	  	private String riContent; //리뷰 내용
	  	private String riCredate; //리뷰 작성일
	  	
	  	private double riStar; //별점
	  	private int riLikeCnt; //리뷰에 대한 좋아요 수
	  	private int riViewCnt; //리뷰에 대한 조회수
	  	private int riDislikeCnt; //리뷰에 대한 싫어요 수
	  	
	  	private String riUpdateDate; //리뷰 수정일
	  	private String riMovieId; //참조키: 영화 코드
	  	private String uiId; //참조키: 유저 아이디
	  	
	  	private String riGenre; //장르
	  	private String riSpoil; //스포일러 유무 (스포일러 있으면 1, 없으면 0)
	  	
	  	//이하는 영감포인트(checked: 1, unChecked: 0)
	  	private int riDirectionPoint; //연출
	  	private int riActingPoint; //연기
	  	private int riStoryPoint; //스토리
	  	private int riVisualPoint; //영상미
	  	private int riOstPoint; //OST
	  	
	  	
	  	private String uiNickname; //참조키: 영화 코드
	  	private String uiFilePath; //참조키: 유저 아이디

}
