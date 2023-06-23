<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영감</title>
<!-- 스타일 -->
<link rel="stylesheet" href="${path}/resources/css/common/button.css" />
<link rel="stylesheet" href="${path}/resources/css/user/login.css" />
</head>
<body>
	<!-- 로그인 실패 안내 페이지 (정지된 계정 전용) -->
	
	<!-- header area -->
	<jsp:include page="../common/header.jsp"></jsp:include>
	
	<!-- content area -->
	<div class="content">
		정지된 계정입니다!!!!!
	</div>
	
	<!-- footer area -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>