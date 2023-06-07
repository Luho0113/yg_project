<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영감 관리자 페이지</title>
</head>
<body>
<c:if test="${admin.adminId != null}">
	<h2>${admin.adminName} 님 반갑습니다. 영감 관리자 페이지에 접속하셨습니다.</h2>
	<button onclick="location.href='/admin/logout'">로그아웃</button>
	<button onclick="location.href='/admin/movies'">영화 관리</button>
	<button onclick="location.href='/admin/users'">회원 관리</button>
</c:if>	
</body>
</html>