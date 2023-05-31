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
	<input id="search" name="search" value="${param.text}">
	<button>검색</button>
</form>


${searchMovieResult}

</body>
<script>
const imgUrl = 'https://image.tmdb.org/t/p/w500';
console.log(${searchMovieResult});

</script>
</html>