<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고 작성 글 페이지</title>
</head>
<script>
function deleteCheck(){
	if(!confirm('삭제하시면 복구할 수 없습니다. \n정말로 삭제하시겠습니까?')){
		return false;
	}else{
		location.href="/report-delete?piNum=${report.piNum}";
	}
}
</script>
<body>
<table border="1">
	<tr>
		<th>작성일</th>
		<td>${report.piCredat}</td>
	</tr>
	<tr>
		<th>닉네임</th>
		<td>${report.uiNickname}</td>
	</tr>
	<tr>
		<th>제목</th>
		<td>${report.piTitle}</td>
	</tr>
	<tr>
		<th>분류</th>
		<td>${report.piCategory}</td>
	</tr>
	<tr>
		<th>첨부</th>
		<td>
		<c:if test="${report.piFilePath} == null}">
		</c:if>
		<c:if test="${report.piFilePath} != null}">
		<img src="${report.piFilePath}" width="150">
		</c:if>
		</td>
	</tr>
	<tr>
		<th>내용</th>
		<td>${report.piContent}</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<button onclick="location.href='/report-update?piNum=${report.piNum}'">수정</button>
			<button onclick="deleteCheck()">삭제</button>
		</td>
	</tr>
</table>
</body>
</html>