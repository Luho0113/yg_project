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
<script>
	

</script>

<h3>로그인</h3>
<form method="POST" action="/login" >
	아이디 : <input type="text" name="uiId" id="uiId"> <br>
	비밀번호 : <input type="password" name="uiPassword" id="uiPassword"> <br>
	<button>로그인</button> <br>
	<button onclick="location.href='/join'" type="button">가입하기</button>
</form>



</body>
</html>