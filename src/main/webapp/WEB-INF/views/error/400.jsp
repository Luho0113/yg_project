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
<link rel="stylesheet" href="${path}/resources/css/common/error.css" />
<link rel="stylesheet" href="${path}/resources/css/common/button.css" />
</head>
<body>
	<!-- 404 error -->
	<!-- header area -->
	<jsp:include page="../common/header.jsp"></jsp:include>

	<!-- content area -->
	<div class="content">
		<div class="error-wrap">
			<div>
				<img src="../../../resources/images/400.png">
			</div>
			<div class="error-message">죄송합니다. 더 나은 서비스 제공을 위해 노력하겠습니다.</div>

			<div class="button-home">
				<button class="button-custom btnFromBlack"
					onclick="location.href='/'">
					<span>영감 둘러보기</span>
				</button>
			</div>

			<div class="button-login">
				<button class="button-custom btnFromBlack"
					onclick="location.href='/login'">
					<span>로그인</span>
				</button>
			</div>
		</div>
	</div>

	<!-- footer area -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>