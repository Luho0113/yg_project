package com.younggam.app.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.younggam.app.vo.ReportBoardVO;

@Mapper
public interface ReportBoardMapper {
	List<ReportBoardVO> selectReports(ReportBoardVO report); //신고 글 목록 + 페이징 + 검색
	
	ReportBoardVO selectReport(int piNum); //신고 글 보기
	
	int fileReport(ReportBoardVO report); //신고 글 등록
	
	int updateReport(ReportBoardVO report); //신고 글 수정
	
	int deleteReport(int piNum); //신고 글 삭제

}
