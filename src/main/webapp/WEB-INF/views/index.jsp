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
* {box-sizing: border-box;}
body {font-family: Verdana, sans-serif;}
.mySlides {display: none;}
img {vertical-align: middle;}

/* Slideshow container */
.slideshow-container {
  max-width: 1000px;
  position: relative;
  margin: auto;
}

/* Caption text */
.text {
  color: #f2f2f2;
  font-size: 15px;
  padding: 8px 12px;
  position: absolute;
  bottom: 8px;
  width: 100%;
  text-align: center;
}

/* Number text (1/3 etc) */
.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}

/* The dots/bullets/indicators */
.dot {
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.active {
  background-color: #717171;
}

/* Fading animation */
.fade {
  animation-name: fade;
  animation-duration: 1.5s;
}

@keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
  .text {font-size: 11px}
  
  
  ////////////
  
  

  
  
  
  
  
  
}
  
  .starPointText{
	float: right;
    margin: 5px 0px 0px 0px;
    font-size: 12px;
	letter-spacing: 2px;
}

.starPoint{
    float: right;
    margin-right: 5px;
}
  
  .star{
	position: relative;
	font-size: 20px;
	color: #fffc;
}
  
.star input{
    width: 100%;
    height: 100%;
    position: absolute;
    left: 0;
    opacity: 0;
    cursor: pointer;
}
  
.star span{
	width: 0;
	position: absolute; 
	left: 0;
	color: #FF7C00;
	overflow: hidden;
	pointer-events: none;
}
</style>
<body>
	<!-- header area -->
	<jsp:include page="./common/header.jsp"></jsp:include>




	<section class="content">

		<article class="box-office">
			<h3>현재 상영 중인 영화</h3>

			

<div class="slideshow-container">
<c:forEach items="${nowPlaying}" var="nowPlaying">

<div class="mySlides fade">
  <div class="numbertext">페이지번호</div>
  <a href="detail?movieId=${nowPlaying.id}&riMovieId=${nowPlaying.id}">
  <img src="https://image.tmdb.org/t/p/original/${nowPlaying.posterPath}" style="width:200px">
  </a>
  <div class="text-title">${nowPlaying.title}</div>
  <div class="text-overview">${nowPlaying.overview}</div>

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
								onerror="this.src='https://ifh.cc/g/zNb0Wd.jpg';">
							</a>
							<div class="cont-detail">
								<div class="title">
									<a href="detail?movieId=${MovieInfo.id}&riMovieId=${MovieInfo.id}">${MovieInfo.title}</a>
								</div>
								<c:set var="String1" value="${MovieInfo.releaseDate}" />
								<c:set var="string2" value="${fn:substring(String1, 0, 4)}" />
								<div class="release-date">${string2}</div>
								<h1>★ ${BestMovieList[status.index].riStar}</h1>
								
								
								 <div class="starPointText">
                     <span>(${BestMovieList[status.index].riStar})</span>
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
			
				<h3><a href="/reviews">더보기</a></h3>
				
			</div>
			<div class="new-reviews-box">
				<c:forEach items="${newReviewList}" var="review" begin="0" end="3">
					<div class="review-card">
						
						<div class="review-header">
							<div class="review-img">
								<a href="userReview?uiNickname=${review.uiNickname}"> <img
									src="${review.uiFilePath}"
									onerror="this.src='https://ifh.cc/g/cDROLZ.png';">
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
							댓글 ${reivew.rcCount}
						</div>
						
					</div>
				</c:forEach>
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
