<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록 페이지</title>
</head>
<script>
function searchUser(){
	const uiId = document.querySelector('#uiId');
	if(uiId.value==''){
		alert('유저 아이디를 입력해주세요.');
		uiId.focus();
		var e = window.event;
		e.preventDefault(); //이벤트 발생(페이지 이동 중지)
		return false;
	}
	return true;
}
</script>
<form action="/admin/user" method="GET">
	<input type="text" name="uiId" id ="uiId" placeholder="유저 아이디" value="${param.uiId}">
	<button onclick="searchUser()">유저 검색</button>
</form>
<body>
	<table class="userTable" border="1">
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>닉네임</th>
			<th>프로필 이미지</th>
			<th>이메일</th>
			<th>상태</th>
			<th>상태 변경</th>
		</tr>
		<c:if test="${empty users}">
			<th colspan="4">등록된 회원이 없습니다.</th>
		</c:if>
		<c:forEach items="${users}" var="user">
		<tr>
			<td>${user.uiId}</td>
			<td><a href="/admin/user?uiId=${user.uiId}">${user.uiName}</a></td>
			<td>${user.uiNickname}</td>
			<td><img src="${user.uiFilePath}" width="150"></td>
			<td>${user.uiEmail}</td>
			<td>${user.uiActive}</td>
			<td><button onclick="updateActive(this)">변경</button></td>
			<td><a href="/admin/user-update?uiId=${user.uiId}">수정</a></td>
			<td><a href="/admin/user-delete?uiId=${user.uiId}">삭제</a></td>
			
		</tr>
		</c:forEach>
	</table>
</body>
</html>