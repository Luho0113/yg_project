<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
		
		
<article class="reviewer-list">
<h3>리뷰어</h3>
<ul class="reviewers">
    <li class="reviewer-box">
        <div class="reviewer">
        <div class="img"><a href="myInfo?uiId=00000000"><img src="./강아지.jpg" alt="이미지없음"></a></div>
        <div class="reviewer-name"><a href="myInfo?uiId=00000000"><h4>0000</h4></a></div>
    </div>
    <div class="review-written">10</div>
        <div class="review-like">200</div>
       
    </li>
    <li class="reviewer-box">
        <div class="reviewer">
        <div class="img"><a href="누르면 상세페이지로 이동"><img src="./common.jpg" alt="이미지없음"></a></div>
        <div class="reviewer-name"><a href="reviewer-detail link">닉네임</a></div>
    </div>
    <div class="review-written">10</div>
        <div class="review-like">200</div>
    </li>
    <li class="reviewer-box">
        <div class="reviewer">
        <div class="img"><a href="누르면 상세페이지로 이동"><img src="./강아지2.jpg" alt="이미지없음"></a></div>
        <div class="reviewer-name"><a href="reviewer-detail link">닉네임</a></div>
    </div>
    <div class="review-written">10</div>
        <div class="review-like">200</div>
    </li>
</ul>
<ul class="reviewers">
    <li class="reviewer-box">
        <div class="reviewer">
        <div class="img">
            <a href="누르면 상세페이지로 이동"><img src="./강아지.jpg" alt="작성자프로필사진" onerror="this.src='https://ifh.cc/g/cDROLZ.png';"></a>
        </div>
        <div class="reviewer-name"><a href="reviewer-detail link">닉네임</a></div>
    </div>
    <div class="review-written">10</div>
        <div class="review-like">200</div>
    </li>
    <li class="reviewer-box">
        <div class="reviewer">
        <div class="img"><a href="누르면 상세페이지로 이동"><img src="./강지.jpg" alt="작성자프로필사진" onerror="this.src='https://ifh.cc/g/cDROLZ.png';"></a></div>
        <div class="reviewer-name"><a href="reviewer-detail link">닉네임</a></div>
    </div>
    <div class="review-written">10</div>
        <div class="review-like">200</div>
    </li>
    <li class="reviewer-box">
        <div class="reviewer">
        <div class="img"><a href="누르면 상세페이지로 이동"><img src="./강아지.jpg" alt="이미지없음"></a></div>
        <div class="reviewer-name"><a href="reviewer-detail link">닉네임</a></div>
    </div>
    <div class="review-written">10</div>
        <div class="review-like">200</div>
    </li>
</ul>

</article>
		
		
	</section>








	<!-- footer area -->
	<jsp:include page="../common/footer.jsp"></jsp:include>

	
</body>

</html>