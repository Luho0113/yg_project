<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<c:set var="path" value="${pageContext.request.contextPath}"/> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 상세</title>
<link rel="stylesheet" href="${path}/resources/css/common/header.css">
<link rel="stylesheet" href="${path}/resources/css/common/footer.css">
<link rel="stylesheet" href="${path}/resources/css/common/page.css">
</head>

<style>
table, th, td {
  border: 1px solid black;
  border-collapse: collapse;
}
</style>

<body>
<!-- header area -->
<jsp:include page="../common/header.jsp"></jsp:include>


<!-- content area -->
<h1>영화 상세</h1>
<!-- 검색페이지 처음에 null 값 나오는 이유가 페이지 시작이 jsp의 form 이기 때문이다. 이게 초기에는 null이기 때문에 페이지를 열면 null로 시작하는 것 -->
 <form action="/detail" method="get"></form> 



<!-- 검색창 -->
<form action="/search" method="get">
	<input id="search" name="search" value="${param.search}" 
			placeholder="영화, 감독, 배우를 검색해보세요.">
	<button>검색</button>
</form>

<br>

<table>
<tr>
<td rowspan="7"> <p><img id="poster" src="https://image.tmdb.org/t/p/original/${movieData[0].posterPath}" width="50" height="100" /></p> </td>
<th colspan="3">${movieData[0].title}</th>
</tr>

<tr>
<td>${movieData[0].releaseDate}</td>
<td>장르</td>
<td>${movieData[0].productionConturies}</td>
</tr>
<tr>
<td colspan="3">별점</td>
</tr>
<tr>
<td>상영시간</td>
<td colspan="2">${movieData[0].runtime}</td>
</tr>
<tr>
<td>원제</td>
<td colspan="2">${movieData[0].originalTitle}</td>
</tr>
<tr>
<td>연령 등급</td>
<td colspan="2">${movieRate[0].certification}</td>
</tr>
<tr>
<td colspan="3"><button type="button" onclick="location.href='review-insert'">평가하기</button></td>
</tr>
</table>
<br>
<table>
<tr>
<td>
<h3>내용</h3>
${movieData[0].overview}</td>
</tr>
</table>
<br>
<!-- 배우는 페이지 처리 -->
<!-- 일단 테이블 -->
 <table>
<tr>
<td>배우정보
<h4>감독</h4> 
${movieData[0].directors}
<h4>배우 정보</h4>
<p><img id="poster" src="https://image.tmdb.org/t/p/original/${cast[0].profilePath}" width="50" height="100" /></p>
<p>배우명 : ${cast[0].actor} | 배역명 : ${cast[0].character} </p>
<br>
<p><img id="poster" src="https://image.tmdb.org/t/p/original/${cast[1].profilePath}" width="50" height="100" /></p>
<p>배우명 : ${cast[1].actor} | 배역명 : ${cast[1].character} </p>




</td>
</tr>
</table>

<!-- 영화정보 -->

	<p>등급: ${movieRate[0].certification}</p>





<!-- 서비스 getCast()메소드를 이용해 가져온 값을 컨트롤러에서 cast로 정했었다. -->
<c:forEach items="${cast}" var="cast">
<p>배우명 : ${cast.actor} </p>
<p>배역명 : ${cast.character} </p>
<p><img id="poster" src="https://image.tmdb.org/t/p/original/${cast.profilePath}" width="50" height="100" /></p>
</c:forEach>


<!-- footer area -->
<jsp:include page="../common/footer.jsp"></jsp:include>

</body>
<script type="text/javascript">
var movieId = new Array();
var movieTitle = new Array();

var movieDirectors = new Array();
var movieProductionConturies = new Array();


	<c:forEach items="${movie}" var="movie">
		movieId.push("${movie['id']}")
		movieTitle.push("${movie['title']}");

		movieDirectors.push("${movie['directors']}");
		movieProductionConturies.push("${movie['productionConturies']}");
    </c:forEach>
    
autocomplete(document.getElementById("myInput"), movieId, movieTitle, movieDirectors, movieProductionConturies);




</script>


</html>