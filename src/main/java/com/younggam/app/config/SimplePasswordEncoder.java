package com.younggam.app.config;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
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
	public static void main(String[] args) {
		PasswordEncoder pe = new SimplePasswordEncoder();
		pe = new BCryptPasswordEncoder();
		System.out.println(pe.encode("1234")); //<--이러면 암호화가 되어야함 sha256
	}

}
