<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 글 상세보기 페이지</title>
</head>
<body>
<table border="1">
	<tr>
		<th>작성일</th>
		<td>${notice.niCredat}</td>
	</tr>
	<tr>
		<th>조회수</th>
		<td>${notice.niCnt}</td>
	</tr>
	<tr>
		<th>작성자</th>
		<td>${notice.adminNickName}</td>
	</tr>
	<tr>
		<th>제목</th>
		<td>${notice.niTitle}</td>
	</tr>
	<tr>
		<th>첨부</th>
		<td>
		<c:if test="${notice.niFilePath} == null}">
		</c:if>
		<c:if test="${notice.niFilePath} != null}">
		<img src="${notice.niFilePath}" width="150">
		</c:if>
		</td>
	</tr>
	<tr>
		<th>내용</th>
		<td>${notice.niContent}</td>
	</tr>
</table>
</body>
</html>