<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1">
	<tr>
		<th>번호</th>
		<th>영화제목</th>
		<th>리뷰 내용</th>
		<th>작성일</th>
		<th>평점</th>
		<th>작성자</th> 
	</tr>
	<c:if test="${empty reviewList}">
		<th colspan="5">게시물이 없습니다.</th>
	</c:if>
	<c:forEach items="${reviewList}" var="review">
	<tr>
		<td>${review.riNum}</td>
		<td><a href="/review?riNum=${review.riNum}">${review.miTitle}</a></td>
		<td>${review.riContent}</td>
		<td>${review.riCredate}</td>
		<td>${review.riStar}</td>
		<td>${review.uiId}</td>
	</tr>
	</c:forEach>
	<tr>
		<td colspan="6" align="right">
			<a href="/review-insert">등록</a>
		</td>
	</tr>
</table>
</body>
</html>