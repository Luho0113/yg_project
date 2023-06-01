<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="/search">
	<input id="search" name="search" value="${param.search}">
	<button>검색</button>
</form>
<h3>검색어: ${param.search}</h3> <!-- input의 value -->
<h3>결과: ${searchMovieResult}</h3> <!-- action 보내고 돌려 받은 값 -->



</body>
<script>
const imgUrl = 'https://image.tmdb.org/t/p/w500';
console.log(${searchMovieResult});

</script>
</html>