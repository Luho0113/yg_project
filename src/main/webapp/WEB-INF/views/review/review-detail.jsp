<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 상세</title>
<link rel="stylesheet" href="${path}/resources/css/common/header.css">
<link rel="stylesheet" href="${path}/resources/css/common/footer.css">
<link rel="stylesheet" href="${path}/resources/css/common/page.css">
</head>
<body>
<!-- header area -->
<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="content">
	${review.riContent}

	<button>좋아요</button>
	<button>싫어요</button>
	<button>댓글</button>
	
	</div>
<!-- footer area -->
<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>