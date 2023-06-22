package com.younggam.app.service;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.younggam.app.mapper.NoticeBoardMapper;
import com.younggam.app.vo.NoticeBoardVO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class NoticeBoardService {
	
	private final String pjPath = "C:\\works\\workspace_current\\YoungGamProject\\src\\main\\webapp\\resources\\upload";
	@Autowired
	private NoticeBoardMapper niMapper;
	
	//공지사항 글 목록 + 페이징 + 검색
	public PageInfo<NoticeBoardVO> getNotices(NoticeBoardVO notice){
		PageHelper.startPage(notice.getPage(), notice.getRows());
		return new PageInfo<>(niMapper.selectNotices(notice));
	}
	
	//공지사항 글 보기
	public NoticeBoardVO seeNotice(int niNum) {
		return niMapper.selectNotice(niNum);
	}
	
	//공지사항 등록
	public boolean registerNotice(NoticeBoardVO notice) throws IllegalStateException, IOException{
		String saveName = notice.getNiFile().getOriginalFilename();
		if(!"".equals(saveName)) {
			if(saveName.lastIndexOf(".") != -1) {
				saveName = saveName.substring(saveName.lastIndexOf("."));
			}
			String name = UUID.randomUUID().toString();
			log.info("save file name=>{}", name+saveName);
			File file = new File(pjPath, name+saveName);
				notice.getNiFile().transferTo(file);
				notice.setNiFilePath("/resources/upload/" + name + saveName);
		}
		return niMapper.registerNotice(notice)==1;
	}
	
	//공지사항 수정
	public boolean updateNotice(NoticeBoardVO notice) throws IllegalStateException, IOException{
		String saveName = notice.getNiFile().getOriginalFilename();
		if(!"".equals(saveName)) {
			if(saveName.lastIndexOf(".") != -1) {
				saveName = saveName.substring(saveName.lastIndexOf("."));
			}
			String name = UUID.randomUUID().toString();
			log.info("save file name=>{}", name+saveName);
			File file = new File(pjPath, name+saveName);
				notice.getNiFile().transferTo(file);
				notice.setNiFilePath("/resources/upload/" + name + saveName);
		}
		return niMapper.updateNotice(notice)==1;
	}
	
	//공지사항 삭제
	public boolean deleteNotice(int niNum) {
		return niMapper.deleteNotice(niNum)==1;
	}
	
	//공지사항 조회수
	public boolean updateCnt(int niNum) {
		return niMapper.updateNoticeBoardCnt(niNum)==1;
	}
	
	
	
	
	

	
	
}

