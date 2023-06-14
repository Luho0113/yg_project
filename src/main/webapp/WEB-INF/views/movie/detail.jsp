<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 상세</title>
</head>
<body>
<!-- 검색페이지 처음에 null 값 나오는 이유가 페이지 시작이 jsp의 form 이기 때문이다. 이게 초기에는 null이기 때문에 페이지를 열면 null로 시작하는 것 -->
<!--  <form action="/detail" method="get">
	<input id="search" name="search" value="${param.search}" 
			placeholder="영화, 감독, 배우를 검색해보세요.">
</form>  -->
<h1>영화 상세</h1>
<!-- 검색창 유지 -->
<!--<jsp:include page="search.jsp"></jsp:include> -->

<!-- 겸색결과 -->
<!-- 서비스 getCast()메소드를 이용해 가져온 값을 컨트롤러에서 cast로 정했었다. -->

<c:forEach items="${cast}" var="cast">
<p>배우명 : ${cast.actor} </p>
<p>배역명 : ${cast.character} </p>
<p><img id="poster" src="https://image.tmdb.org/t/p/w300${cast.porfilePath}" width="50" height="100" /></p>
</c:forEach>


</body>
</html>