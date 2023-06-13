package com.younggam.app.config;

import static org.springframework.security.config.Customizer.withDefaults;

import javax.servlet.DispatcherType;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityCustomizer;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

@Configuration
public class SpringSecurityConfig {
	
	
	private MyUserDetailsService detailService;
	
	@Bean
	PasswordEncoder passwordEncoder() {
	    return new BCryptPasswordEncoder();
	}
	
	
	//기본 로그인 정보 : user, 서버 실행 시 콘솔에 뜨는 임시 비밀번호
	//@Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http.csrf().disable().cors().disable()
        		.authenticationProvider(null)
        		.userDetailsService(detailService)
                .authorizeHttpRequests(request -> request
                        .dispatcherTypeMatchers(DispatcherType.FORWARD).permitAll()
                        .antMatchers("/**").permitAll() //모든 요청 허용
                        .requestMatchers(new AntPathRequestMatcher("/images/**")).permitAll()  
                        .requestMatchers(new AntPathRequestMatcher("/")).permitAll() 
                        .requestMatchers(new AntPathRequestMatcher("/join")).permitAll() //.requestMatchers("/", "/login").permitAll() 형태로 안되는 이유 찾아보기
                        .requestMatchers(new AntPathRequestMatcher("/search")).permitAll()
                        .anyRequest().authenticated()
                        
                )
                .formLogin(login -> login
                        .loginPage("/login")	// [A] 커스텀 로그인 페이지 지정
                        .loginProcessingUrl("/login")	// [B] submit 받을 url
                        .usernameParameter("uiId")	// [C] submit할 아이디
                        .passwordParameter("uiPassword")	// [D] submit할 비밀번호
                        .defaultSuccessUrl("/", true) //로그인 성공 시 이동할 수 있는 기본 페이지
                        .permitAll()
                )
                
                .logout(withDefaults());

        return http.build();
    }
	
	@Bean
	public WebSecurityCustomizer webSecurityCustomizer() {
		return web->{
			web.ignoring()
			.antMatchers("/**");
		};
	}
	
}
