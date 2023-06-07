<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 목록 페이지</title>
</head>
<body>
<table border="1">
	<tr>
		<th>코드</th>
		<th>제목</th>
		<th>원제</th>
		<th>개봉 연도</th>
		<th>상영 시간</th>
		<th>국가</th>
		<th>장르</th>
		<th>감독</th>
		<th>배우</th>
		<th>배역명</th>
		<th>등급</th>
		<th>포스터</th>
		<th>줄거리</th>
	</tr>
	<c:if test="${empty movies}">
		<th colspan="4">영화 목록이 없습니다.</th>
	</c:if>
	<c:forEach items="${movies}" var="movie">
	<tr>
		<td>${movie.miCode}</td>
		<td><a href="/admin/movie?miCode=${movie.miCode}">${movie.miTitle}</a></td>
		<td>${movie.miOrgTitle}</td>
		<td>${movie.miOpenDate}</td>
		<td>${movie.miShowTime}</td>
		<td>${movie.miNation}</td>
		<td>${movie.miGenre}</td>
		<td>${movie.miDirector}</td>
		<td>${movie.miActor}</td>
		<td>${movie.miCast}</td>
		<td>${movie.miAdult}</td>
		<td><img src= "${movie.miImage}" width="150"></td>
		<td>${movie.miOverview}</td>
		<td><a href="/admin/movie-update?miCode=${movie.miCode}">수정</a></td>
		<td><a href="/admin/movie-delete?miCode=${movie.miCode}">삭제</a></td>
	</tr>
	</c:forEach>
	<tr>
		<td colspan="4" align="right">
			<a href="/admin/movie-add">영화 등록</a>	
	</tr>
</table>
</body>
</html>