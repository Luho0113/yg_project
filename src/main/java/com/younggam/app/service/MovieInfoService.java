package com.younggam.app.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.younggam.app.mapper.MovieInfoMapper;
import com.younggam.app.vo.MovieInfoVO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class MovieInfoService {
	
	private final String pjPath = "C:\\Users\\User\\eclipse-workspace7\\YoungGamProject\\src\\main\\webapp\\resources\\upload";
	@Autowired
	private MovieInfoMapper miMapper;
	//영화 목록
	public List<MovieInfoVO> getMovieInfos(MovieInfoVO movieInfo){
		return miMapper.selectMovieInfos(movieInfo);
	}
	//영화 상세 정보
	public MovieInfoVO getMovieInfo(String miCode) {
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
	public boolean deleteMovieInfo(String miCode) {
		return miMapper.deleteMovieInfo(miCode)==1;
	}
	
	
}
