package com.younggam.app.vo;

import lombok.Data;

@Data
public class ReviewInfoVO {
	    
	    private int riNum; //리뷰 넘버
	  	private String riContent; //리뷰 내용
	  	private String riCredate; //리뷰 작성일
	  	private int riStar; //평점
	  	private int riLikeCnt; //리뷰에 대한 좋아요 수
	  	private int riViewCnt; //리뷰에 대한 조회수
	  	private int riDislikeCnt; //리뷰에 대한 싫어요 수
	  	private String riUpdateDate; //리뷰 수정일
	  	private String uiId; //참조키: 유저 아이디
	  	private String miTitle; //참조키: 영화 코드
	  	

}
