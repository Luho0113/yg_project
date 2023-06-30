package com.younggam.app.service;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.younggam.app.mapper.ReportBoardMapper;
import com.younggam.app.vo.ReportBoardVO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ReportBoardService {
	
	private final String pjPath = "C:\\works\\workspace\\YoungGamProject\\src\\main\\webapp\\resources\\upload";
	@Autowired
	ReportBoardMapper piMapper;
	
	//신고 글 목록 + 페이징 + 검색
	public PageInfo<ReportBoardVO> getReports(ReportBoardVO report){
		PageHelper.startPage(report.getPage(), report.getRows());
		return new PageInfo<>(piMapper.selectReports(report));
	}
	
	//신고 글 보기
	public ReportBoardVO seeReport(int piNum) {
		return piMapper.selectReport(piNum);
	}
	
	//신고 글 등록
	public boolean fileReport(ReportBoardVO report) throws IllegalStateException, IOException{
		String saveName = report.getPiFile().getOriginalFilename();
		if(!"".equals(saveName)) {
			if(saveName.lastIndexOf(".") != -1) {
				saveName = saveName.substring(saveName.lastIndexOf("."));
			}
			String name = UUID.randomUUID().toString();
			log.info("save file name=>{}", name+saveName);
			File file = new File(pjPath, name+saveName);
				report.getPiFile().transferTo(file);
				report.setPiFilePath("/resources/upload/" + name + saveName);
		}
		return piMapper.fileReport(report)==1;
	}
	
	//신고 글 수정
	public boolean updateReport(ReportBoardVO report) throws IllegalStateException, IOException{
		String saveName = report.getPiFile().getOriginalFilename();
		if(!"".equals(saveName)) {
			if(saveName.lastIndexOf(".") != -1) {
				saveName = saveName.substring(saveName.lastIndexOf("."));
			}
			String name = UUID.randomUUID().toString();
			log.info("save file name=>{}", name+saveName);
			File file = new File(pjPath, name+saveName);
				report.getPiFile().transferTo(file);
				report.setPiFilePath("/resources/upload/" + name + saveName);
		}
		return piMapper.updateReport(report)==1;
	}
	
	//신고 글 삭제
	public boolean deleteReport(int piNum) {
		return piMapper.deleteReport(piNum)==1;
	}

	
	
}

