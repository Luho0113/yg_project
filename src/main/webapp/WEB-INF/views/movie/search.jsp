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
<form action="/search">
	<input id="search" name="search" value="${param.search}" 
			placeholder="영화, 감독, 배우를 검색해보세요.">
	<button>검색</button>
</form>

<h3>검색어: ${param.search}</h3> <!-- input의 value -->
<c:if test="${empty movie}">
	<p>검색 결과가 없어요 :( </p>
</c:if>

<c:forEach items="${movie}" var="movie">
	<h3><a href="credit?movieId=${movie.id}">${movie.title}</a></h3> <!-- action 보내고 돌려 받은 값 -->
	<p>영화 아이디: ${movie.id}</p> <!-- action 보내고 돌려 받은 값 -->
	<p>개봉연도: ${movie.release_date}</p> <!-- action 보내고 돌려 받은 값 -->
	<p>줄거리: ${movie.overview}</p> <!-- action 보내고 돌려 받은 값 -->
	<p>원제: ${movie.original_title}</p>
	<p><img id="poster" src="https://image.tmdb.org/t/p/w300${movie.poster_path}" width="50" height="100" /></p>
	

</c:forEach>

<c:if test="${empty credit}">
	<p> 크레딧 검색 없음 </p>
</c:if>


감독: 
<c:forEach items="${credit}" var="credit" varStatus="status">
	<!--  <p>감독: ${credit.name}</p> <!-- action 보내고 돌려 받은 값 --> 
	${credit.name} 
	<c:if test ="${!status.last}">, </c:if>
</c:forEach>

<!-- TO DO: movieid Controller로 전달해서 TMDB API 다시 요청해서 감독 이름 뽑기!!!! -->

</body>
<script>


</script>
</html>