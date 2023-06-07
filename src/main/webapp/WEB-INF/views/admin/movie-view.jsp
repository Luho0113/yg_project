<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 상세 정보 페이지</title>
</head>
<body>
<table border="1">
	<tr>
		<th>코드</th>
		<td>${movie.miCode}</td>
	</tr>
	<tr>
		<th>제목</th>
		<td>${movie.miTitle}</td>
	</tr>
	<tr>
		<th>원제</th>
		<td>${movie.miOrgTitle}</td>
	</tr>
	<tr>
		<th>개봉 연도</th>
		<td>${movie.miOpenDate}</td>
	</tr>
	<tr>
		<th>상영 시간</th>
		<td>${movie.miShowTime}</td>
	</tr>
	<tr>
		<th>장르</th>
		<td>${movie.miGenre}</td>
	</tr>
	<tr>
		<th>감독</th>
		<td>${movie.miDirector}</td>
	</tr>
	<tr>
		<th>배우</th>
		<td>${movie.miActor} - ${movie.miCast}</td>
	</tr>
	<tr>
		<th>등급</th>
		<td>${movie.miAdult}</td>
	</tr>
	<tr>
		<th>포스터</th>
		<td>
		<c:if test="${movie.miImage == null}">
		</c:if>
		<c:if test="${movie.miImage != null}">
		<img src= "${movie.miImage}">
		</c:if>
		</td>
	</tr>
	<tr>
		<th>줄거리</th>
		<td>${movie.miOverview}</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<button onclick="location.href='/admin/movie-update?miCode=${movie.miCode}'">수정</button>
			<button onclick="location.href='/admin/movie-delete?miCode=${movie.miCode}'">삭제</button>
		</td>
	</tr>
</table>
</body>
</html>