<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/resources/css/common/header.css">
<link rel="stylesheet" href="${path}/resources/css/common/footer.css">
<link rel="stylesheet" href="${path}/resources/css/common/page.css">
<link rel="stylesheet"
	href="${path}/resources/css/movie/movie-search.css">
<script src="${path}/resources/js/movie-search.js"></script>
</head>
<body>
	<!-- header area -->
	<jsp:include page="../common/header.jsp"></jsp:include>

	<!-- content area -->
	<section class="content">
		<h2>${param.search}</h2>
		<%-- input의 value --%>
		<article class="movie-list">
			<h3>영화</h3>
			
			
			<ul class="movies">
			<c:forEach items="${movie}" var="movie">
				<li class="movie-box">
					<div>
						<a href="detail?movieId=${movie.id}"><img id="poster" src="https://image.tmdb.org/t/p/w300${movie.posterPath}" alt="영화포스터"></a>
						<div class="cont-detail">
							<div class="title">
								<a href="detail?movieId=${movie.id}">${movie.title}</a>
							</div>
							<div class="release-date">${movie.releaseDate}</div>
							<div class="director">${movie.directors}</div>
						</div>
					</div>
				</li>
			</c:forEach>
			
			</ul>
			<!-- 만약에 영화가 5개 이상이면 ul반복 -->





			<c:choose>
				<c:when test="${empty param.search}">
					<p>검색 고고</p>
				</c:when>
				<c:when test="${empty movie}">
					<p>앗! 찾으시는 영화가 없네요 :(</p>
				</c:when>

				<c:otherwise>


					<div>
						<c:forEach items="${movie}" var="movie">
							<h3>
								<a href="detail?movieId=${movie.id}">${movie.title}</a>
							</h3>
							<%-- action 보내고 돌려 받은 값 --> --%>
							<p>개봉연도: ${movie.releaseDate}</p>
							<%-- action 보내고 돌려 받은 값 --%>
							<p>줄거리: ${movie.overview}</p>
							<%-- action 보내고 돌려 받은 값 --%>
							<p>원제: ${movie.originalTitle}</p>
							<p>감독: ${movie.directors}</p>
							<p>제작국가: ${movie.productionConturies}</p>
							<p>
								<img id="poster"
									src="https://image.tmdb.org/t/p/w300${movie.posterPath}"
									width="50" height="100" />
							</p>
						</c:forEach>
					</div>
				</c:otherwise>
			</c:choose>


		</article>
	</section>








	<!-- footer area -->
	<jsp:include page="../common/footer.jsp"></jsp:include>

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

		autocomplete(document.getElementById("myInput"), movieId, movieTitle,
				movieDirectors, movieProductionConturies);
	</script>
</body>

</html>