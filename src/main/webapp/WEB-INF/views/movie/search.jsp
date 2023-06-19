<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/resources/css/movie/movie-search.css">
<script src="${path}/resources/js/movie-search.js"></script>
</head>
<body>

<h2>Search</h2>

	<form autocomplete="off" action="/search" method="GET" name="form">
        <div class="autocomplete" style="width:300px;">
          <input id="myInput" type="text" name="search" placeholder="영화, 감독, 배우를 검색해보세요." value="${param.search}">
        </div>
        <input type="submit">
    </form>



<form action="/search" method="get">
	<input id="search" name="search" value="${param.search}" 
			placeholder="영화, 감독, 배우를 검색해보세요.">
	<button>검색</button>
</form>

<h3>${param.search}</h3> <%-- input의 value --%>

<c:choose>
<c:when test="${empty param.search}">
	<p>검색 고고 </p>
</c:when>
<c:when test="${empty movie}">
	<p>앗! 찾으시는 영화가 없네요 :( </p>
</c:when>

<c:otherwise>

<h3> 영화 </h3>
<div>
<c:forEach items="${movie}" var="movie">
	<h3><a href="detail?movieId=${movie.id}">${movie.title}</a></h3> <%-- action 보내고 돌려 받은 값 --> --%>
	<p>개봉연도: ${movie.releaseDate}</p> <%-- action 보내고 돌려 받은 값 --%>
	<p>줄거리: ${movie.overview}</p> <%-- action 보내고 돌려 받은 값 --%>
	<p>원제: ${movie.originalTitle}</p>
	<p>감독: ${movie.directors}</p>
	<p>제작국가: ${movie.productionConturies}</p>
	<p><img id="poster" src="https://image.tmdb.org/t/p/w300${movie.posterPath}" width="50" height="100" /></p>
</c:forEach>
</div>
</c:otherwise>
</c:choose>


<script>
var movieId = new Array();
var movieTitle = new Array();

var movieDirectors = new Array();
var movieProductionConturies = new Array();


	<c:forEach items="${movie}" var="movie">
		movieId.push("${movie['id']}");
		movieTitle.push("${movie['title']}");

		movieDirectors.push("${movie['directors']}");
		movieProductionConturies.push("${movie['productionConturies']}");
    </c:forEach>
    
autocomplete(document.getElementById("myInput"), movieId, movieTitle, movieDirectors, movieProductionConturies);

</script>
</body>

</html>