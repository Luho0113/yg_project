package com.younggam.app.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.younggam.app.vo.AdminInfoVO;

@Mapper
public interface AdminInfoMapper {
	AdminInfoVO selectAdminInfoforLogin(AdminInfoVO admin); //관리자 로그인

	List<AdminInfoVO> selectAdminInfo(AdminInfoVO admin); //관리자 목록

}
