<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세정보 페이지</title>
<link rel="stylesheet" href="${path}/resources/css/common/header.css">
<link rel="stylesheet" href="${path}/resources/css/common/footer.css">
<link rel="stylesheet" href="${path}/resources/css/common/page.css">
<link rel="stylesheet" href="${path}/resources/css/admin/notice-view.css">
</head>
<body>
	<!-- header area -->
	<jsp:include page="../common/header.jsp"></jsp:include>
<div class="content notiView-area">
	<h2>공지사항 보기</h2>
<table class="noticeView-table">
	<tr>
		<th><h4>작성일</h4></th>
		<td>${notice.niCredat}</td>
	</tr>
	<tr>
		<th><h4>조회수</h4></th>
		<td>${notice.niCnt}</td>
	</tr>
	<tr>
		<th><h4>작성자</h4></th>
		<td>${notice.adminNickName}</td>
	</tr>
	<tr>
		<th><h4>제목</h4></th>
		<td>${notice.niTitle}</td>
	</tr>
	<tr>
		<th><h4>첨부</h4></th>
		<td>
		<c:if test="${notice.niFilePath == null}">
		</c:if>
		<c:if test="${notice.niFilePath != null}">
		<img src="${notice.niFilePath}" width="150">
		</c:if>
		</td>
	</tr>
	<tr>
		<th><h4>내용</h4></th>
		<td>${notice.niContent}</td>
	</tr>
</table>
</div>
	<!-- footer area -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>