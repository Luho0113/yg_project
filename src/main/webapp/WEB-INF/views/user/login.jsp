<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/common/msg.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>

<h3>로그인</h3>
<form method="POST" action="/login" name="login_form">
	<div>
		<label> 
			아이디 : <input type="text" name="uiId" id="uiId" onkeyup="checkId()"> <br>
			<span id="alert_text"></span>
			<span id="uiId_false" style="display: none">아이디 형식 틀림</span>
			<span id="uiId_true" style="display: none">아이디 형식 맞음</span>
		</label>
	</div>
	
	<div>
		<label> 
			비밀번호 : <input type="password" name="uiPassword" id="uiPassword"> <br>
			<span class="uiPwd_false" style="display: none">비밀번호 형식 틀림</span>
			<span class="uiPwd_true" style="display: none">비밀번호 형식 맞음</span>
		</label>
	</div>
	
	<button>로그인</button> <br>
	<button onclick="location.href='/join'" type="button">가입하기</button>
</form>

<script>
	//아이디 유효성 검사
	function checkId(){
		var obj = document.login_form;
		if(obj.uiId.value.length < 6 || obj.uiId.value.length >10){
			document.getElementById("alert_text").innerHTML = ('<span style="color:red;"> 아이디형식틀림</span>');
			return;
		} else {
			document.getElementById("alert_text").innerHTML = ('<span style="color:green;"> 아이디형식맞음</span>');
		}
	}
	
	//비밀번호 유효성 검사
	function checkPwd(){
		
	}
</script>

</body>
</html>