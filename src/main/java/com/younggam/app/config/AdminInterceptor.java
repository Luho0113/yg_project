package com.younggam.app.config;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.younggam.app.vo.AdminInfoVO;

@Component
public class AdminInterceptor implements HandlerInterceptor {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		AdminInfoVO admin = (AdminInfoVO)session.getAttribute("admin");
		
		if(admin == null) {
			response.sendRedirect("/login"); //회원 로그인 화면으로 redirect
			return false;
		}else if(!(admin.getAdminId().equals("younggam_official"))){
			response.sendRedirect("/login");
			return false;
		} else {
			return true;
		}
	}
}
