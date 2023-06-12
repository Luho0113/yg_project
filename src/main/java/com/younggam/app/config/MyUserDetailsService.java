package com.younggam.app.config;

import java.util.Optional;

import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import com.younggam.app.service.UserInfoService;
import com.younggam.app.vo.UserInfoVO;

@Component
public class MyUserDetailsService implements UserDetailsService{
	//UserDetailsService를 상속받아 DB에서 회원정보를 받아오고 스프링부트에 넘겨주는 역할
	private final UserInfoService uiService;
	
	public MyUserDetailsService(UserInfoService uiService) {
        this.uiService = uiService;
    }
	
	@Override
	public UserDetails loadUserByUsername(String uiId) throws UsernameNotFoundException {
		// uiId에는 .usernameParameter("uiId") 에 해당하는 정보가 들어옴
		// Id만 가지고 DB에서 유저 정보를 가져옴 (비밀번호 일치 여부는 스프링에서 진행)
		
		//Optional : NPE 발생을 방지하기 위해 사용(null을 반환하면 에러를 유발할 가능성이 높을 때)
		Optional<UserInfoVO> findOne = uiService.findOne(uiId);
		UserInfoVO userInfo = findOne.orElseThrow(()->new UsernameNotFoundException("없는 회원임!"));
		
		
		return User.builder()
				.username(userInfo.getUiId())
				.password(userInfo.getUiPassword())
				.roles("DEFAULT") //권한 DEFAULT 값이라도 추가
				.build();
	}

}
