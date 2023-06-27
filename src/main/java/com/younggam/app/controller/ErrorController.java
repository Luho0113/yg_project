package com.younggam.app.controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ErrorController implements org.springframework.boot.web.servlet.error.ErrorController{

		/*
		 * 에러 발생 안내 페이지
		 * https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#5xx_server_errors
		 * 허가되지 않은 요청 or 잘못된 요청은 대부분 login, index 페이지로 돌려보냄
		 * 그래도 예기치 않은 에러가 발생했을 때
		 */

	    @RequestMapping(value = "/error")
	    public String handleError(HttpServletRequest request) {
	    	
	        Object status = request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);
	        
	        //error status가 null이 아닌 경우 (에러가 발생했을 경우)
	        if(status != null){
	        	
	            int statusCode = Integer.valueOf(status.toString());
	            
	            //400
	            if(statusCode == HttpStatus.BAD_REQUEST.value()){
	                return "error/400";
	            }
	            
	            //404
	            if(statusCode == HttpStatus.NOT_FOUND.value()){
	                return "error/404";
	            }

	            //500
	            if(statusCode == HttpStatus.FORBIDDEN.value()){
	                return "error/500";
	            }
	        }
	        return "index";
	    }
}
