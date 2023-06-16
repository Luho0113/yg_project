<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영감</title>
<!-- 스타일 -->
<link rel="stylesheet" href="${path}/resources/css/common/page.css">
<link rel="stylesheet" href="${path}/resources/css/common/header.css">
</head>
<body>
	<!-- header area -->
	<jsp:include page="./common/header.jsp"></jsp:include>
	<h3>영감</h3>
	
	<!-- content area -->
	<p>본문 영역</p>
	
	
	<!-- footer area -->
	<jsp:include page="./common/footer.jsp"></jsp:include>
</body>
</html>