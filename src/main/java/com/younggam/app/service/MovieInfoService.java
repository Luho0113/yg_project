package com.younggam.app.service;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.younggam.app.mapper.MovieInfoMapper;
import com.younggam.app.vo.MovieInfoVO;

import lombok.extern.slf4j.Slf4j;

import com.github.pagehelper.PageInfo;

@Service
@Slf4j
public class MovieInfoService {
	
	private final String pjPath = "C:\\works\\workspace_current\\YoungGamProject\\src\\main\\webapp\\resources\\upload";
	@Autowired
	private MovieInfoMapper miMapper;
	
	//영화 목록 + 페이징 + 검색
		public PageInfo<MovieInfoVO> getMovieInfos(MovieInfoVO movie){
			PageHelper.startPage(movie.getPage(), movie.getRows());
			return new PageInfo<>(miMapper.selectMovieInfos(movie));
		}
		
	//영화 상세 정보
	public MovieInfoVO getMovieInfo(int miCode) {
		return miMapper.selectMovieInfo(miCode);
	}
	
	//영화 등록
	public boolean addMovieInfo(MovieInfoVO movie) throws IllegalStateException, IOException{
		String saveName = movie.getMiFile().getOriginalFilename();
		if(!"".equals(saveName)) {
			if(saveName.lastIndexOf(".") != -1) {
				saveName = saveName.substring(saveName.lastIndexOf("."));
			}
			String name = UUID.randomUUID().toString();
			log.info("save file name=>{}", name+saveName);
			File file = new File(pjPath, name+saveName);
				movie.getMiFile().transferTo(file);
				movie.setMiImage("/resources/upload/" + name + saveName);
		}
		return miMapper.addMovieInfo(movie)==1;
	}
	//영화 수정
	public boolean updateMovieInfo(MovieInfoVO movie) throws IllegalStateException, IOException{
		String saveName = movie.getMiFile().getOriginalFilename();
		if(!"".equals(saveName)) {
			if(saveName.lastIndexOf(".") != -1) {
				saveName = saveName.substring(saveName.lastIndexOf("."));
			}
			String name = UUID.randomUUID().toString();
			File file = new File(pjPath, name+saveName);
				movie.getMiFile().transferTo(file);
				movie.setMiImage("/resources/upload/" + name + saveName);
		}
		return miMapper.updateMovieInfo(movie)==1;
	}	
	//영화 삭제
	public boolean deleteMovieInfo(int miCode) {
		return miMapper.deleteMovieInfo(miCode)==1;
	}
	
	
}
