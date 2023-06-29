<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<c:set var="path" value="${pageContext.request.contextPath}" />


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영감</title>
<!-- 스타일 -->
<link rel="stylesheet"
	href="${path}/resources/css/movie/movie-search.css">
<script src="${path}/resources/js/movie-search.js"></script>
<link rel="stylesheet" href="${path}/resources/css/common/header.css" />
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
						<a href="detail?movieId=${movie.id}&riMovieId=${movie.id}">
						<img id="poster" src="https://image.tmdb.org/t/p/w300${movie.posterPath}" alt="영화포스터"  onerror="this.src='${path}/resources/images/noImage.png';">
						</a>
						<div class="cont-detail">
							<div class="title">
								<a href="detail?movieId=${movie.id}">${movie.title}</a>
							</div>

	<c:set var = "string1" value = "${movie.releaseDate}"/>
      <c:set var = "string2" value = "${fn:substring(string1, 0, 4)}" />
							<div class="release-date">${string2}</div>
							
						


     <c:set var="str1" value="${movie.directors}"/>
       <c:set var="str2" value="${fn:replace(str1, '[', '')}"/> 
<c:set var="str3" value="${fn:replace(str2, ']', '')}"/> 



							<div class="director">${str3}</div>
						</div>
					</div>
				</li>
			</c:forEach>
			
			</ul>
			<!-- 만약에 영화가 5개 이상이면 ul반복 -->





			<c:choose>
			
				<c:when test="${empty param.search}">
					<p>영화를 검색해보세요</p>
				</c:when>
				
				<c:when test="${empty movie}">
					<p>앗! 찾으시는 영화가 없네요 :(</p>
				</c:when>

				<c:otherwise> </c:otherwise>
				
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
    
    <c:if test="${empty reviewerList}">
    <p>찾으시는 리뷰어가 없어요 :(</p>
    </c:if>
    
   </div>
    
    
    
 
</article>
		
		
	</section>








	<!-- footer area -->
	<jsp:include page="../common/footer.jsp"></jsp:include>

	
</body>

</html>