<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>영감</title>
    <!-- 스타일 -->
    <link rel="stylesheet"
	href="${path}/resources/css/main/main.css">
  </head>
  <body>
    <!-- header area -->
    <jsp:include page="./common/header.jsp"></jsp:include>








 <section class="content">
    
    <article class="box-office">
    <h3>박스오피스/상영중인 영화?</h3>
   
   <c:forEach items="${nowPlaying}" var="nowPlaying"> 
<div class="box-office-list">
<!--  <img id="poster"
	src="https://image.tmdb.org/t/p/original/${nowPlaying.posterPath}">
-->
</div>
 </c:forEach>
 
    </article>


    
    <article class="highest-rated-movies">
        <h3>별점 높은 순</h3>
			<ul class="movies">
                <!-- 
			<c:forEach items="${____}" var="_____">
				<li class="movie-box">
					
                        <div>
						<a href="detail?movieId=${_______}&riMovieId=${______}"><img id="poster" src="https://image.tmdb.org/t/p/w300${________}" alt="영화포스터"></a>
						<div class="cont-detail">
							<div class="title">
								<a href="detail?movieId=${movie.id}">${________}</a>
							</div>
							<div class="release-date">${______}</div>
							<div class="star-rate">${_______}</div>
						</div>
					</div>
               
				</li>
			</c:forEach>
			 -->

             
				<li class="movie-box">
                        <div>
						<a href="detail?movieId=${_______}&riMovieId=${______}"><img id="poster" src="https://ifh.cc/g/zNb0Wd.jpg" alt="영화포스터"></a>
						<div class="cont-detail">
							<div class="title">
								<a href="detail?movieId=${movie.id}">영화 제목:길게했을때 대비000</a>
							</div>
							<div class="release-date">0000년</div>
							<div class="star-rate">★★★★★</div>
						</div>
					</div>
				</li>
                				<li class="movie-box">
                        <div>
						<a href="detail?movieId=${_______}&riMovieId=${______}"><img id="poster" src="https://ifh.cc/g/zNb0Wd.jpg" alt="영화포스터"></a>
						<div class="cont-detail">
							<div class="title">
								<a href="detail?movieId=${movie.id}">영화 제목:길게했을때 대비000</a>
							</div>
							<div class="release-date">0000년</div>
							<div class="star-rate">★★★★★</div>
						</div>
					</div>
				</li>
                				<li class="movie-box">
                        <div>
						<a href="detail?movieId=${_______}&riMovieId=${______}"><img id="poster" src="https://ifh.cc/g/zNb0Wd.jpg" alt="영화포스터"></a>
						<div class="cont-detail">
							<div class="title">
								<a href="detail?movieId=${movie.id}">영화 제목:길게했을때 대비000</a>
							</div>
							<div class="release-date">0000년</div>
							<div class="star-rate">★★★★★</div>
						</div>
					</div>
				</li>
                				<li class="movie-box">
                        <div>
						<a href="detail?movieId=${_______}&riMovieId=${______}"><img id="poster" src="https://ifh.cc/g/zNb0Wd.jpg" alt="영화포스터"></a>
						<div class="cont-detail">
							<div class="title">
								<a href="detail?movieId=${movie.id}">영화 제목:길게했을때 대비000</a>
							</div>
							<div class="release-date">0000년</div>
							<div class="star-rate">★★★★★</div>
						</div>
					</div>
				</li>
                				<li class="movie-box">
                        <div>
						<a href="detail?movieId=${_______}&riMovieId=${______}"><img id="poster" src="https://ifh.cc/g/zNb0Wd.jpg" alt="영화포스터"></a>
						<div class="cont-detail">
							<div class="title">
								<a href="detail?movieId=${movie.id}">영화 제목:길게했을때 대비000</a>
							</div>
							<div class="release-date">0000년</div>
							<div class="star-rate">★★★★★</div>
						</div>
					</div>
				</li>
                
                

			</ul>
    </article>


    
    <article class="new-reviews">
    <h3>최근리뷰///좋아요 많은 리뷰</h3>
     
	 		<c:forEach items="${newReviewList}" var="review" varStatus="status"> 
				<div class="review-card">
					<div class="review-header">
						<div>
							<a href="userReview?uiNickname=${review.uiNickname}"> <img
								src="${review.uiFilePath}"
								onerror="this.src='https://ifh.cc/g/cDROLZ.png';">
							</a>
							<div>리뷰어이름 ${review.uiNickname}</div>
						</div>
					</div>
					<div class="review-body">내용 ${review.riContent}</div>
					<div class="review-like">
						<div>좋아요</div>
						<div>댓글</div>
					</div>
				</div>
		 	</c:forEach>
		 	
		 	<!-- 
		 	 <div class="review-card">
					<div class="review-header">
						<div>
							<a href="userReview?uiNickname=${newReviewList.uiNickname}"> 
							<img
								src="${newReviewList.uiFilePath}"
								onerror="this.src='https://ifh.cc/g/cDROLZ.png';">
							</a>
							<div>리뷰어이름${newReviewList.uiNickname}</div>
						</div>
					</div>
					<div class="review-body">내용${newReviewList.riContent}></div>
					<div class="review-like">
						<div>좋아요</div>
						<div>댓글</div>
					</div>
				</div>
				 -->
				<div class="review-card">
					<div class="review-header">
						<div>
							<a href="userReview?uiNickname=${_____}"> 
							<img
								src="${______}"
								onerror="this.src='https://ifh.cc/g/cDROLZ.png';">
							</a>
							<div>리뷰어이름${______}</div>
						</div>
					</div>
					<div class="review-body">내용${_______}></div>
					<div class="review-like">
						<div>좋아요</div>
						<div>댓글</div>
					</div>
				</div>
				<div class="review-card">
					<div class="review-header">
						<div>
							<a href="userReview?uiNickname=${_____}"> 
							<img
								src="${______}"
								onerror="this.src='https://ifh.cc/g/cDROLZ.png';">
							</a>
							<div>리뷰어이름${______}</div>
						</div>
					</div>
					<div class="review-body">내용${_______}></div>
					<div class="review-like">
						<div>좋아요</div>
						<div>댓글</div>
					</div>
				</div>
				<div class="review-card">
					<div class="review-header">
						<div>
							<a href="userReview?uiNickname=${_____}"> 
							<img
								src="${______}"
								onerror="this.src='https://ifh.cc/g/cDROLZ.png';">
							</a>
							<div>리뷰어이름${______}</div>
						</div>
					</div>
					<div class="review-body">내용${_______}></div>
					<div class="review-like">
						<div>좋아요</div>
						<div>댓글</div>
					</div>
				</div>
		 	
		</article>




</section>
















    <!-- footer area -->
    <jsp:include page="./common/footer.jsp"></jsp:include>
  </body>
</html>
