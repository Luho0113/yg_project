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
<form action="/search" method="get">
	<input id="search" name="search" value="${param.search}" 
			placeholder="영화, 감독, 배우를 검색해보세요.">
	<button>검색</button>
</form>

<h3>검색어: ${param.search}</h3> <%-- input의 value --%>

<c:if test="${empty movie}">
	<p>검색 결과가 없어요 :( </p>
</c:if>

<c:forEach items="${movie}" var="movie">
	<h3><a href="credit?movieId=${movie.id}">${movie.title}</a></h3> <%-- action 보내고 돌려 받은 값 --> --%>
	<p>개봉연도: ${movie.releaseDate}</p> <%-- action 보내고 돌려 받은 값 --%>
	<p>줄거리: ${movie.overview}</p> <%-- action 보내고 돌려 받은 값 --%>
	<p>원제: ${movie.originalTitle}</p>
	<p>감독: ${movie.directors}</p>
	<p>제작국가: ${movie.productionConturies}</p>
	<p><img id="poster" src="https://image.tmdb.org/t/p/w300${movie.posterPath}" width="50" height="100" /></p>
</c:forEach>


</body>
<script>


</script>
</html>