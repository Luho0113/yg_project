package com.younggam.app.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.younggam.app.vo.MovieInfoVO;

@Mapper
public interface MovieInfoMapper {
	List<MovieInfoVO> selectMovieInfos(MovieInfoVO movie); //영화 목록
	
	MovieInfoVO selectMovieInfo(String miCode); //영화 상세 정보
	
	int addMovieInfo(MovieInfoVO movie); //영화 등록
	
	int updateMovieInfo(MovieInfoVO movie); //영화 수정
	
	int deleteMovieInfo(String miCode); //영화 삭제

}	