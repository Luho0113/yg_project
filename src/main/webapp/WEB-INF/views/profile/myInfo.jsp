<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/common/msg.jsp" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 프로필</title>
<!-- 스타일 -->
<link rel="stylesheet" href="${path}/resources/css/common/page.css">
<link rel="stylesheet" href="${path}/resources/css/common/header.css">
</head>
<body>
	<!-- header area -->
	<jsp:include page="../common/header.jsp"></jsp:include>
	
	<h3>내 프로필</h3>
	<img src="${user.uiFilePath}" style="border-radius: 100px" width="200px" height="200px" onerror="this.src='https://ifh.cc/g/cDROLZ.png';"> <br>
	닉네임 : ${user.uiNickname} <br>
	아이디 : ${user.uiId} <br>
	포인트 : ${user.uiReviewPoint} <br>
	<button onclick="location.href='/myInfo-update'">수정하기</button>
	
	<!-- footer area -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
	
	<!-- javascript -->
</body>
</html>