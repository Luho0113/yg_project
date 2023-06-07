package com.younggam.app.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.younggam.app.mapper.AdminInfoMapper;
import com.younggam.app.vo.AdminInfoVO;

@Service
public class AdminInfoService {
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
	public List<AdminInfoVO> getAdminInfo(AdminInfoVO admin){
		return aiMapper.selectAdminInfo(admin);
	}

}
