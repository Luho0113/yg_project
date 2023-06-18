//package com.younggam.app.config;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
//import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
//
//@Configuration
//public class InterceptorConfig implements WebMvcConfigurer {
////	@Autowired
////	private AdminInterceptor adminInterceptor;
//	
//	@Autowired
//	private UserInterceptor userInterceptor;
//	
//	@Override
//	public void addInterceptors(InterceptorRegistry registry) {
//		//유저 Config
//		registry.addInterceptor(userInterceptor)
//				.addPathPatterns("/**")
//				.addPathPatterns("/admin/*") //관리자 화면 제외
//				.excludePathPatterns("/login") //로그인 화면 제외
//				.excludePathPatterns("/join") //회원가입 화면 제외
//				.excludePathPatterns("/") //홈 화면? 제외
//				.excludePathPatterns("/admin/login"); //잠시 제외	
//	}
//}
