package com.younggam.app.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.younggam.app.mapper.AdminInfoMapper;
import com.younggam.app.vo.AdminInfoVO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class AdminInfoService {
	
	private final String pjPath = "C:\\Users\\User\\eclipse-workspace_current1\\YoungGamProject\\src\\main\\webapp\\resources\\upload";
	@Autowired
	private AdminInfoMapper aiMapper;
	//관리자 로그인
	public boolean login(AdminInfoVO admin, HttpSession session) {
		AdminInfoVO adminTmp = aiMapper.selectAdminInfoforLogin(admin);
		if (adminTmp != null) {
			session.setAttribute("admin", adminTmp);
			return true;
		}
		return false;
	}
	//관리자 목록
	public List<AdminInfoVO> getAdminInfos(AdminInfoVO admin){
		return aiMapper.selectAdminInfo(admin);
	}
	
	//관리자 상세 정보
	public AdminInfoVO getAdminInfo(AdminInfoVO admin) {
		return aiMapper.findByAdminId(admin);
	}
	
	//관리자 수정
	public boolean updateAdminInfo(AdminInfoVO admin) throws IllegalStateException, IOException {
		String saveName = admin.getAiFile().getOriginalFilename();
		if(!"".equals(saveName)) {
			if(saveName.lastIndexOf(".") != -1) {
				saveName = saveName.substring(saveName.lastIndexOf("."));
			}
			String name = UUID.randomUUID().toString();
			log.info("save file name=>{}", name+saveName);
			File file = new File(pjPath, name+saveName);
				admin.getAiFile().transferTo(file);
				admin.setAdminFilePath("/resources/upload/" + name + saveName);
		}
		return aiMapper.updateAdminInfo(admin)==1;
	}
	
	//관리자 삭제
	public boolean deleteAdminInfo(String adminId) {
		return aiMapper.deleteAdminInfo(adminId)==1;
	}
	
	//시큐리티 test
//	public Optional<AdminInfoVO> findOne(String adminId){
//		return aiMapper.findByAdminId(adminId);
//	}

}
