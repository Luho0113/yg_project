<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var = "string1" value = "${movieData[0].releaseDate}"/>
      <c:set var = "string2" value = "${fn:substring(string1, 0, 4)}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 상세</title>

<link rel="stylesheet"
	href="${path}/resources/css/movie/movie-detail.css">
<link rel="stylesheet" href="${path}/resources/css/common/button.css" />
</head>

<body>
	<!-- header area -->
	<jsp:include page="../common/header.jsp"></jsp:include>


	<!-- content area -->

	<!-- 검색페이지 처음에 null 값 나오는 이유가 페이지 시작이 jsp의 form 이기 때문이다. 이게 초기에는 null이기 때문에 페이지를 열면 null로 시작하는 것 -->
	<form action="/detail" method="get"></form>


	<section class="content">
		<article class="movie-content">
			<div class="movie-info">
				<div class="movie-details1">
					<img id="poster"
						src="https://image.tmdb.org/t/p/original/${movieData[0].posterPath}"
						onerror="this.src='https://ifh.cc/g/zNb0Wd.jpg';">
				</div>
				<div class="movie-details2">
					<h2>${movieData[0].title}</h2>
					<div class="rd-g-n">
					     
						<div>${string2}</div>
						<div>${movieData[0].genreIds[0]}</div>
						<div>${movieData[0].productionConturies[0]}</div>

					</div>
					<div class="star">
						<h3>별점 ${star}</h3>
					</div>
					<div class="rt-ot-r">
						<div>상영시간 ${movieData[0].runtime} 분</div>
						<div>원제 ${movieData[0].originalTitle}</div>
						<div>연령 등급 ${movieRate[0].certification} 세</div>
					</div>
					<div class="review-button">
						<button class="button-custom btnOrange" type="button"
						onclick="location.href='review-insert?search=${movieData[0].title}'">🖋평가하기</button>
					</div>
					
				</div>
			</div>
		</article>

		<article class="overview">
			<h3>줄거리</h3>
			<div>${movieData[0].overview}</div>
		</article>
		<article class="cast-list">
			<h3>출연진</h3>
			<div class="cast-cards">
			<c:forEach items="${cast}" var="cast">
			
				<div class="cast-card">
					<img id="poster"
						src="https://image.tmdb.org/t/p/original/${cast.profilePath}"
						onerror="this.src='https://ifh.cc/g/zNb0Wd.jpg';" />
					<div class="cast-name">
						<div>${cast.actor}</div>
						<div>${cast.character}</div>
					</div>
				</div>
				
			</c:forEach>
			</div>
		</article>
		<article class="point">
			<h2>포인트</h2>
		</article>
		<article class="review-list">
			<c:forEach items="${reviewer}" var="reviewer" varStatus="status">
				<div class="review-card">
					<div class="review-header">
						<div>
							<a href="userReview?uiNickname=${reviewer.uiNickname}"> 
							<img src="${reviewer.uiFilePath}"
								onerror="this.src='https://ifh.cc/g/cDROLZ.png';">
								</a>
							<div>
							
							${reviewer.uiNickname}</div>	
						</div>
					</div>
					
					<div class="review-body">
					<a href="/review?riNum=${reviewer.riNum}&movieId=${movieData[0].id}">${reviewer.riContent}
					</a>
					</div>
					
					<div class="review-like">
						<div>좋아요</div>
						<div>댓글</div>
					</div>
				</div>
			</c:forEach>
		</article>
	</section>







	<!-- footer area -->
	<jsp:include page="../common/footer.jsp"></jsp:include>

</body>


</html>