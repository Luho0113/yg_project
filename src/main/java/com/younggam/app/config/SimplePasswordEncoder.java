package com.younggam.app.config;

import org.springframework.security.crypto.password.PasswordEncoder;

public class SimplePasswordEncoder implements PasswordEncoder{
	//비밀번호 암호화 관련 설정
	
	@Override
	public String encode(CharSequence rawPassword) {
		
		 return rawPassword.toString();
	}

	@Override
	public boolean matches(CharSequence rawPassword, String encodedPassword) {
		
		return encodedPassword.equals(encode(rawPassword));
	}

}
