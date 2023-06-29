<%@page import="com.younggam.app.vo.UserInfoVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영감</title>
</head>
<body>
<% 
	UserInfoVO user = (UserInfoVO) session.getAttribute("user");
	if(user==null){
%>
	<script>
		alert('로그인이 필요합니다.');
		location.href = '/login';
	</script>
<%
	return;
	} 
%>
</body>
</html>


