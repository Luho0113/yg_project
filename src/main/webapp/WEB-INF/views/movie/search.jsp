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


					
				</c:otherwise>
			</c:choose>


		</article>
		
		
<article class="reviewer-list">
<h3>리뷰어</h3>

<div class="reviewers">

	<c:forEach items="${reviewerList}" var="reviewerList" varStatus="status">
    <div class="reviewer-box">
        <div class="reviewer">
        
        <div class="img">
        <a href="userReview?uiNickname=${reviewerList.uiNickname}">
		<img src="${reviewerList.uiFilePath}" onerror="this.src='https://ifh.cc/g/cDROLZ.png';"></a>
        </div>
       
        <div class="reviewer-name">
        <a href="userReview?uiNickname=${reviewerList.uiNickname}">${reviewerList.uiNickname}</a>
        </div>
        
   </div>
   
    <div class="review-written">10</div>	
        <div class="review-like">200</div>
       
    </div>
    </c:forEach>
    
    
   </div>
    
    
    
 
</article>
		
		
	</section>








	<!-- footer area -->
	<jsp:include page="../common/footer.jsp"></jsp:include>

	
</body>

</html>