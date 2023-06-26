<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file = "/WEB-INF/views/common/error-admin.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고 글 보기</title>
<link rel="stylesheet" href="${path}/resources/css/admin/header.css">
<link rel="stylesheet" href="${path}/resources/css/common/footer.css">
<link rel="stylesheet" href="${path}/resources/css/common/page.css">
<link rel="stylesheet" href="${path}/resources/css/admin/report-view.css">
</head>
<script>
<!-- 삭제 버튼 -->
function deleteCheck() {
	if(!confirm('삭제하시면 복구할 수 없습니다. \n정말로 삭제하시겠습니까?')){
		alert("삭제가 취소되었습니다.");
		return false;
	}else{
		location.href="/admin/report-delete?piNum=${report.piNum}";
	}
}
</script>
<body>
	<!-- header area -->
	<jsp:include page="../header/header.jsp"></jsp:include>

<div class="content reportView-area">
	<h2>신고사항</h2>
<table class="reportView-table">
	<tr>
		<th><h4>번호</h4></th>
		<td>${report.piNum}</td>
	</tr>
	<tr>
		<th><h4>작성일</h4></th>
		<td>${report.piCredat}</td>
	</tr>
	<tr>
		<th><h4>닉네임</h4></th>
		<td>${report.uiNickname}</td>
	</tr>
	<tr>
		<th><h4>제목</h4></th>
		<td>${report.piTitle}</td>
	</tr>
	<tr>
		<th><h4>분류</h4></th>
		<td>${report.piCategory}</td>
	</tr>
	<tr>
		<th><h4>첨부</h4></th>
		<td>
		<c:if test="${report.piFilePath == null}">
		</c:if>
		<c:if test="${report.piFilePath != null}">
		<img src="${report.piFilePath}" width="150">
		</c:if>
		</td>
	</tr>
	<tr>
		<th><h4>내용</h4></th>
		<td>${report.piContent}</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<button class="reportUpdate" onclick="location.href='/admin/report-update?piNum=${report.piNum}'">수정</button>
			<button class="reportDelete" onclick="deleteCheck()">삭제</button>
		</td>
	</tr>
</table>
</div>
	<!-- footer area -->
	<jsp:include page="../../common/footer.jsp"></jsp:include>
</body>
</html>