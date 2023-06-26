<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영감 관리자 목록</title>
</head>
<body>
<table border="1">
	<tr>
		<th>관리자 아이디</th>
		<th>관리자 이름</th>
		<th>관리자 닉네임</th>
		<th>관리자 프로필 이미지</th>
		<th>관리자 이메일</th>
	</tr>
	<c:forEach items="${adminList}" var="adminVO">
	<tr>
		<td>${adminVO.adminId}</td>
		<td>${adminVO.adminName}</td>
		<td>${adminVO.adminNickName}</td>
		<td><img src="${adminVO.adminFilePath}" width="150"></td>
		<td>${adminVO.adminEmail}</td>
	</tr>
	</c:forEach>
</table>
</body>
</html>