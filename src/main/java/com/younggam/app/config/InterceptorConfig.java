package com.younggam.app.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class InterceptorConfig implements WebMvcConfigurer {
	@Autowired
	private AdminInterceptor adminInterceptor;
	
	@Autowired
	private UserInterceptor userInterceptor;
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		//유저 Config 
		/*
		 * addPathPatterns : 인터셉터가 실행될 url 패턴
		 * excludePathPatterns : 인터셉터가 실행되지 않을 url 패턴
		 */
		
		registry.addInterceptor(userInterceptor)
				.addPathPatterns("/**") //비회원 접근 X
				.addPathPatterns("/admin/**") //관리자 화면 제외
				.excludePathPatterns("/login") //로그인 화면 제외
				.excludePathPatterns("/join") //회원가입 화면 제외
				.excludePathPatterns("/") //홈 화면? 제외
				.excludePathPatterns("/**/*.css")
				.excludePathPatterns("/**/*.js")
				.excludePathPatterns("/**/*.png")
				;
		
		registry.addInterceptor(adminInterceptor)
				.addPathPatterns("/admin/**")
				.excludePathPatterns("/admin/login"); //잠시 제외
	}
}
