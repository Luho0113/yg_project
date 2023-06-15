<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 상세 정보 페이지</title>
</head>
<body>
	<table border="1">
		<tr>
			<th>아이디</th>
			<td>${user.uiId}</td>
		</tr>
		<tr>
			<th>이름</th>
			<td>${user.uiName}</td>
		</tr>
		<tr>
			<th>닉네임</th>
			<td>${user.uiNickname}</td>
		</tr>
		<tr>
			<th>프로필 이미지</th>
			<td>
			<c:if test="${user.uiFilePath == null}">
			</c:if>
			<c:if test="${user.uiFilePath != null}">
			<img src="${user.uiFilePath}" width="150">
			</c:if>
			</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td>${user.uiEmail}</td>
		</tr>
		<tr>
			<th>상태</th>
			<td>${user.uiActive}</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<button onclick="location.href='/admin/user-update?uiId=${user.uiId}'">수정</button>
				<button onclick="location.href='/admin/user-delete?uiId=${user.uiId}'">삭제</button>
			</td>
		</tr>
	</table>
</body>
</html>