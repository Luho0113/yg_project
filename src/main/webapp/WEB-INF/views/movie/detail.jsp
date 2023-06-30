<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="string1" value="${movieData.releaseDate}" />
<c:set var="string2" value="${fn:substring(string1, 0, 4)}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>영화 상세</title>

<link rel="stylesheet" href="${path}/resources/css/movie/movie-detail.css">
<link rel="stylesheet" href="${path}/resources/css/common/button.css" />
<link rel="stylesheet" href="${path}/resources/css/common/header.css" />

</head>

<body>

	<!-- header area -->
	<jsp:include page="../common/header.jsp"></jsp:include>


	<!-- content area -->
	<form action="/detail" method="get"></form>
	
	<section class="content">
	
		<article class="movie-content">
	
			<div class="movie-info">
				
				<div class="movie-details1">
					<div class=movie-details1-img>
						<img id="poster"
							 src="https://image.tmdb.org/t/p/original/${movieData.posterPath}"
							 onerror="this.src='${path}/resources/images/noImage.png';">
					</div>
				</div>
				
				<div class="movie-details2">	
					<h2>${movieData.title}</h2>
					<div class="rd-g-n">
						<div>${string2}</div>
						<div>${movieData.genreIds[0]}</div>
						<div>${movieData.productionConturies[0]}</div>
					</div>
					<div class="star">
						<c:if test="${empty star.riStar}">
							<h3>★ -</h3>
						</c:if>
						<c:if test="${not empty star.riStar}">
							<h3>★ ${star.riStar}</h3>
						</c:if>
					</div>

					<div class="rt-ot-r">
						<div>상영시간 ${movieData.runtime} 분</div>
						<div>원제 ${movieData.originalTitle}</div>
						<div>연령 등급 ${movieRate[0].certification}</div>
					</div>
					
					<div class="review-button">
						<button class="button-custom btnFromBlack" type="button"
							onclick="location.href='review-insert?search=${movieData.title}'">영감남기기</button>
					</div>
					
				</div>
				
			</div>
			
		</article>


		<article class="overview">
		
			<h3>줄거리</h3>
			<div>${movieData.overview}</div>
		
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


		<article class="new-reviews">
		
			<h3>최신 리뷰</h3>
		
			<div class="more">

				<c:if test="${fn:length(reviewer)> 4}">
					<p>
						<a href="/reviews">더보기</a>
					</p>
				</c:if>

			</div>
			
			<div class="new-reviews-box">

				<c:forEach items="${reviewer}" var="reviewer" begin="0" end="3">
					<div class="review-card">
						<div class="review-header">
							<div class="review-img">
								<a href="userReview?uiNickname=${reviewer.uiNickname}"> 
								<img src="${reviewer.uiFilePath}"
									 onerror="this.src='https://ifh.cc/g/cDROLZ.png';">
								</a>
							</div>
							<div class="review-nickname">${reviewer.uiNickname}</div>
						</div>
						
						<div class="review-body">
							<div class="review-body-text">
								<p>
									<a href="/review?riNum=${reviewer.riNum}&movieId=${reviewer.riMovieId}">
										${reviewer.riContent}
									</a>
								</p>
							</div>
						</div>

						<div class="review-comment">조회수 ${reviewer.riViewCnt}</div>
						
					</div>
					
				</c:forEach>

				<c:if test="${empty reviewer}">
					<div class="review-card">
						<div class="review-body-null">
							<a href="/review-insert"> 리뷰를<br>작성해보세요 </a>
						</div>
					</div>
				</c:if>
				
			</div>

		</article>

	</section>


	<!-- footer area -->
	<jsp:include page="../common/footer.jsp"></jsp:include>


</body>

</html>