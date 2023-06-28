<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>영감</title>
<!-- 스타일 -->
<link rel="stylesheet" href="${path}/resources/css/user/joinSuccess.css" />
<link rel="stylesheet" href="${path}/resources/css/common/button.css" />
<link rel="stylesheet" href="${path}/resources/css/common/header.css" />
</head>
<body>
	<!-- 회원 가입 성공 결과 화면 -->
	<!-- header area -->
	<jsp:include page="../common/header.jsp"></jsp:include>

	<!-- content area -->
	<div class="content">
		<div class="welcome-wrap">
			<div>
				<img src="../../../resources/images/welcome.png">
			</div>
			<div class="success-message">가입을 환영합니다.</div>
			<div class="button-login">
				<button class="button-custom btnFromBlack"
					onclick="location.href='/login'">
					<span>영감 시작하기</span>
				</button>
			</div>
		</div>
	</div>

	<!-- footer area -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>
