<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/msg.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 프로필</title>
</head>
<body>

	<h3>내 프로필</h3>
	<img src="${user.uiFilePath}" style="border-radius: 100px" width="200px" height="200px" onerror="this.src='https://ifh.cc/g/cDROLZ.png';"> <br>
	닉네임 : ${user.uiNickname} <br>
	아이디 : ${user.uiId} <br>
	포인트 : ${user.uiReviewPoint} <br>
	<button onclick="location.href='/myInfo-update'">수정하기</button>
	

</body>
</html>