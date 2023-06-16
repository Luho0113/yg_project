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

<!-- 로그인 -->
<form method="POST" action="/login" name="login_form" onclick="checkId()">
	
	<!-- 아이디 입력 -->
	<div>
		<label> 
			<input type="text" name="uiId" id="uiId" placeholder="아이디"> <br>
		</label>
	</div>
	
	<!-- 비밀번호 입력 -->
	<div>
		<label> 
			<input type="password" name="uiPassword" id="uiPassword" placeholder="비밀번호"> <br>
		</label>
	</div>
	
	<!-- 경고 메세지 -->
	<div id="alert_checkId">
		<span >
		</span>
	</div>
	
	<button >로그인</button> <br>
	<button onclick="location.href='/join'" type="button">가입하기</button>
</form>

<script>
	//아이디 유효성 검사


	function checkId(){
		//var obj = document.login_form;
		const uiId = document.querySelector('#uiId');
		const uiPassword = document.querySelector('#uiPassword');
		if(uiId.value == "" || uiPassword.value == ""){
			document.getElementById("alert_checkId").innerHTML = ('<span>뭐틀림요</span>');
			//document.getElementById("alert_checkId").style.display = "";
			
		} 
		//if(!(uiId.value == "") && !(uiPassword.value == "") ){
		//	document.getElementById("alert_checkId").style.display = "hidden";
			
		//}
	}
	
</script>

</body>
</html>