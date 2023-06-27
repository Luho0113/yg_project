<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/common/error-user.jsp"%>

<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영감</title>
</head>
<body>
	<!-- header area -->
	<jsp:include page="../common/header.jsp"></jsp:include>

	<!-- content area -->
	<div class="content">
		
		<div>
			YoungGam
		</div>
		
		<div>
			영화 감상
		</div>
		
	</div>
	
	<!-- footer area -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>