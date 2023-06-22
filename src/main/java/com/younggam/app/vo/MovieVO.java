package com.younggam.app.vo;

import java.util.List;

import lombok.Data;

@Data
public class MovieVO {

	private String id; //영화 아이디
	private String title; //영화 한국어 제목
	private String originalTitle; //영화 원제
	private String posterPath; //포스터 경로
	private String overview; //줄거리
	private String releaseDate; //개봉일(년-월-일)
	private List<String> genreIds; //장르 번호(TMDB API 기준)
	
	private List<String> productionConturies; //제작 국가
	
	private List<String> directors; //감독(한 명 or 여러 명)
	
	//이거 지워도 될 듯
	//private Map<String, String> cast; //출연진(최대 몇 명을 담을지 상의 필요함)
	
	//상영시간
	private String runtime;
	
	//등급
	private String certification;


	
	
	
}
