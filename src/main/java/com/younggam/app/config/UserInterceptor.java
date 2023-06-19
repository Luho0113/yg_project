package com.younggam.app.config;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.younggam.app.vo.UserInfoVO;

@Component
public class UserInterceptor implements HandlerInterceptor{
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
			HttpSession session = request.getSession();
			UserInfoVO user = (UserInfoVO)session.getAttribute("user");
			
			String requestUrl = request.getRequestURL().toString(); 
			
			
			
			if(user==null) { //비회원
				response.sendRedirect("/login"); //회원 로그인 화면으로 redirect
				return false;
			}else if(requestUrl.contains("/")){
				return true;
			}else if(requestUrl.contains("/resources/**")){
				return true;
			}else{ //회원
				return true;
			}
			
	}
}
