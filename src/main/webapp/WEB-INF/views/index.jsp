<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>영감</title>
<!-- 스타일 -->
<link rel="stylesheet" href="${path}/resources/css/main/main.css">
</head>
<body>
	<!-- header area -->
	<jsp:include page="./common/header.jsp"></jsp:include>




	<section class="content">

		<article class="box-office">
			<h3>박스오피스/상영중인 영화?</h3>

			<c:forEach items="${nowPlaying}" var="nowPlaying">
				<div class="box-office-list">
					<img id="poster"
						src="https://image.tmdb.org/t/p/original/${nowPlaying.posterPath}">

				</div>
			</c:forEach>


			<!--   슬라이드 해보는중..
   <div class="slideshow-container">
     
        <div class="mySlideDiv fade">
         <c:forEach items="${nowPlaying}" var="nowPlaying"> 
           <img id="poster"
	src="https://image.tmdb.org/t/p/original/${nowPlaying.posterPath}">
	  </c:forEach> 
        </div>
        
        <a class="prev" onclick="prevSlide()">&#10094;</a>
        <a class="next" onclick="nextSlide()">&#10095;</a>
              
   </div>
    -->







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
						<c:forEach items="${MovieInfo}" var="MovieInfo" varStatus="status">
							<a href="detail?movieId=${MovieInfo.id}&riMovieId=${MovieInfo.id}">
								<img id="poster"
								src="https://image.tmdb.org/t/p/w300${MovieInfo.posterPath}"
								onerror="this.src='https://ifh.cc/g/zNb0Wd.jpg';">
							</a>
							<div class="cont-detail">
								<div class="title">
									<a href="detail?movieId=${MovieInfo.title}">영화 제목:
										${MovieInfo.title}</a>
								</div>
								<div class="release-date">${MovieInfo.releaseDate}년</div>
					</div> 
					</c:forEach> 
					
					
					
					<c:forEach items="${BestMovieList}" var="BestMovieList"
						varStatus="status">
						<div class="star-rate">${BestMovieList.riStar}</div>
					</c:forEach>
					</div>
				</li>

			</ul>
		</article>



		<article class="new-reviews">
			<h3>최신 리뷰</h3>

			<c:forEach items="${newReviewList}" var="review" varStatus="status">
				<div class="review-card">
					<div class="review-header">
						<div>
							<a href="userReview?uiNickname=${review.uiNickname}"> <img
								src="${review.uiFilePath}"
								onerror="this.src='https://ifh.cc/g/cDROLZ.png';">
							</a>
							<div>${review.uiNickname}</div>
						</div>
					</div>
					<div class="review-body">
						<a
							href="/review?riNum=${review.riNum}&movieId=${review.riMovieId}">${review.riContent}
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
	<jsp:include page="./common/footer.jsp"></jsp:include>

	<script type="text/javascript">

    $(document).ready(function () {
        $(".mySlideDiv").not(".active").hide(); //화면 로딩 후 첫번째 div를 제외한 나머지 숨김
        
        setInterval(nextSlide, 4000); //4초(4000)마다 다음 슬라이드로 넘어감
    });
    
    //이전 슬라이드
    function prevSlide() {
        $(".mySlideDiv").hide(); //모든 div 숨김
        var allSlide = $(".mySlideDiv"); //모든 div 객체를 변수에 저장
        var currentIndex = 0; //현재 나타난 슬라이드의 인덱스 변수
        
        //반복문으로 현재 active클래스를 가진 div를 찾아 index 저장
        $(".mySlideDiv").each(function(index,item){ 
            if($(this).hasClass("active")) {
                currentIndex = index;
            }
            
        });
        
        //새롭게 나타낼 div의 index
        var newIndex = 0;
        
        if(currentIndex <= 0) {
            //현재 슬라이드의 index가 0인 경우 마지막 슬라이드로 보냄(무한반복)
            newIndex = allSlide.length-1;
        } else {
            //현재 슬라이드의 index에서 한 칸 만큼 뒤로 간 index 지정
            newIndex = currentIndex-1;
        }
    
        //모든 div에서 active 클래스 제거
        $(".mySlideDiv").removeClass("active");
        
        //새롭게 지정한 index번째 슬라이드에 active 클래스 부여 후 show()
        $(".mySlideDiv").eq(newIndex).addClass("active");
        $(".mySlideDiv").eq(newIndex).show();
    
    }
    
    //다음 슬라이드
    function nextSlide() {
        $(".mySlideDiv").hide();
        var allSlide = $(".mySlideDiv");
        var currentIndex = 0;
        
        $(".mySlideDiv").each(function(index,item){
            if($(this).hasClass("active")) {
                currentIndex = index;
            }
            
        });
        
        var newIndex = 0;
        
        if(currentIndex >= allSlide.length-1) {
            //현재 슬라이드 index가 마지막 순서면 0번째로 보냄(무한반복)
            newIndex = 0;
        } else {
            //현재 슬라이드의 index에서 한 칸 만큼 앞으로 간 index 지정
            newIndex = currentIndex+1;
        }
    
        $(".mySlideDiv").removeClass("active");
        $(".mySlideDiv").eq(newIndex).addClass("active");
        $(".mySlideDiv").eq(newIndex).show();
        
    }
    
    </script>
</body>
</html>
