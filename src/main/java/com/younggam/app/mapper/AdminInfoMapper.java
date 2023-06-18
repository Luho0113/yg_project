package com.younggam.app.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.younggam.app.vo.AdminInfoVO;

@Mapper
public interface AdminInfoMapper {
	AdminInfoVO selectAdminInfoforLogin(AdminInfoVO admin); //관리자 로그인

	List<AdminInfoVO> selectAdminInfo(AdminInfoVO admin); //관리자 목록
	
	AdminInfoVO findByAdminId(AdminInfoVO admin); //관리자 상세 정보
	
	int updateAdminInfo(AdminInfoVO admin); //관리자 수정
	
	int deleteAdminInfo(String adminId); //관리자 삭제

	//시큐리티 test
	//Optional<AdminInfoVO> findByAdminId(String adminId);
}
