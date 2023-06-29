<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" />


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>영감</title>
<!-- 스타일 -->
<link rel="stylesheet" href="${path}/resources/css/main/main.css">
<link
	href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-round.css"
	rel="stylesheet">
</head>
<style>

</style>
<body>
	<!-- header area -->
	<jsp:include page="./common/header.jsp"></jsp:include>




	<section class="content">

		<article class="box-office">
			

			

<div class="slideshow-container">
<c:forEach items="${nowPlaying}" var="nowPlaying">

<div class="mySlides fade">
<div class="now-poster">
  <a href="detail?movieId=${nowPlaying.id}&riMovieId=${nowPlaying.id}">
  <img id="box-office-poster" src="https://image.tmdb.org/t/p/original/${nowPlaying.posterPath}">
  </a>
  </div>
  
  <div class="now-detail">
  <div class="text-title">${nowPlaying.title}</div>
  <div class="text-overview">${nowPlaying.overview}</div>
</div>
</div>

	</c:forEach>
</div>
<br>

<div style="text-align:center">
  <span class="dot"></span> 
  <span class="dot"></span> 
  <span class="dot"></span> 
</div>













		</article>

		<article class="highest-rated-movies">
			<h3>별점 높은 순</h3>
			<ul class="movies">
				<c:forEach items="${MovieInfo}" var="MovieInfo" varStatus="status"
					begin="0" end="4">
					<li class="movie-box">
						<div>

						
							<a
								href="detail?movieId=${MovieInfo.id}&riMovieId=${MovieInfo.id}">
								<img id="poster"
								src="https://image.tmdb.org/t/p/w300${MovieInfo.posterPath}"
								onerror="this.src='${path}/resources/images/noImage.png';">
							</a>
							<div class="cont-detail">
								<div class="title">
									<a href="detail?movieId=${MovieInfo.id}&riMovieId=${MovieInfo.id}">${MovieInfo.title}</a>
								</div>
								<c:set var="String1" value="${MovieInfo.releaseDate}" />
								<c:set var="string2" value="${fn:substring(String1, 0, 4)}" />
								<div class="release-date">${string2}</div>
								
		
								 <div class="starPointText">
                     <h2>(${BestMovieList[status.index].riStar})</h2s>
                  </div>

                  <div class="starPoint">
                     <span class="star">★★★★★<span class="starRange">★★★★★</span>
                        <input type="range" value="1" step="1" min="0" max="10">
                        <input type="hidden" class="riStar" value="${BestMovieList[status.index].riStar}" readonly="readonly">
                     </span>
                  </div>
								
								
								
								
								
								
								
								
								
								
								
								
							</div>

						</div>
					</li>
				</c:forEach>
			</ul>
		</article>


		<article class="new-reviews">
			<h3>최신 리뷰</h3>
			<div class="more">

				<c:if test="${fn:length(newReviewList)> 4}">
					<p>
						<a href="/reviews">더보기</a>
					</p>
				</c:if>

			</div>
			<div class="new-reviews-box">
				<c:forEach items="${newReviewList}" var="review" begin="0" end="3">
					<div class="review-card">
						
						<div class="review-header">
							<div class="review-img">
								<a href="userReview?uiNickname=${review.uiNickname}"> <img
									src="${review.uiFilePath}"
									onerror="this.src='${path}/resources/images/yg_profile.png';">
								</a>
							</div>

							<div class="review-nickname">${review.uiNickname}</div>

						</div>
						<div class="review-body">
							<div class="review-body-text">
								<p><a
									href="/review?riNum=${review.riNum}&movieId=${review.riMovieId}">
									 ${review.riContent}
								</a></p>
							</div>

						</div>

						<div class="review-comment">
							조회수 ${review.riViewCnt}
						</div>
						</div>
				</c:forEach>
				
				<c:if test="${empty newReviewList}">
					<div class="review-card">
						<div class="review-body-null">
							<a href="/review-insert"> 리뷰를 작성해보세요 </a>
						</div>
					</div>
				</c:if>
			</div>
			
			
		</article>




<!-- 더보기 시도 
<h1>더보기 테스트</h1>

	<c:forEach items="${newReviewList}" var="review" begin="0" end="6">			
<div class="review-nickname">${review.uiNickname}</div>
				</c:forEach>

-->



	</section>



	<!-- footer area -->
	<jsp:include page="./common/footer.jsp"></jsp:include>


<script>
let slideIndex = 0;
showSlides();

function showSlides() {
  let i;
  let slides = document.getElementsByClassName("mySlides");
  let dots = document.getElementsByClassName("dot");
  for (i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";  
  }
  slideIndex++;
  if (slideIndex > slides.length) {slideIndex = 1}    
  for (i = 0; i < dots.length; i++) {
    dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " active";
  setTimeout(showSlides, 2000); // Change image every 2 seconds
}






onload = function() {
	
	for(i = 0; i < 5; i++){
		const starPointArray = document.getElementsByClassName("starPoint");
		const starPoint = starPointArray[i];
		const star = starPoint.getElementsByClassName("riStar")[0].value;
		const starCalc = ((star * 2) * 10);
		
		starPoint.getElementsByClassName("starRange")[0].style.width = starCalc + '%';
		console.log(starCalc);	
	}
	
	
}
</script>


</body>
</html>
