package com.younggam.app.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.younggam.app.vo.NoticeBoardVO;

@Mapper
public interface NoticeBoardMapper {
	List<NoticeBoardVO> selectNotices(NoticeBoardVO notice); //공지사항 글 목록 + 페이징 + 검색
	
	NoticeBoardVO selectNotice(int niNum); //공지사항 글 보기
	
	int registerNotice(NoticeBoardVO notice); //공지사항 등록
	
	int updateNotice(NoticeBoardVO notice); //공지사항 수정
	
	int deleteNotice(int niNum); //공지사항 삭제
	
	int updateNoticeBoardCnt(int niNum); //공지사항 조회수
	
	

}
