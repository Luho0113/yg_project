<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<c:set var="path" value="${pageContext.request.contextPath}"/> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 상세</title>

<link rel="stylesheet" href="${path}/resources/css/movie/movie-detail.css">
</head>

<style>
table, th, td {
  border: 1px solid black;
  border-collapse: collapse;
}
</style>

<body>
<!-- header area -->
<jsp:include page="../common/header.jsp"></jsp:include>


<!-- content area -->

<!-- 검색페이지 처음에 null 값 나오는 이유가 페이지 시작이 jsp의 form 이기 때문이다. 이게 초기에는 null이기 때문에 페이지를 열면 null로 시작하는 것 -->
 <form action="/detail" method="get"></form> 


<section class="content">
        <article class="movie-content">


            <div class="movie-info">
                <div class="movie-details">
                   <img id="poster" src="https://image.tmdb.org/t/p/original/${movieData[0].posterPath}" alt="대체이미지"></div>
                <div class="movie-details">
                    <h3>${movieData[0].title}</h3>
                    <div class="rd-g-n">
                        <div>${movieData[0].releaseDate}</div>
                         <div>${movieData[0].genreIds[0]}</div>
                        <div>${movieData[0].productionConturies[0]}</div>
                       
                    </div>
                    <div class="star">작은 별점</div>
                    <div class="rt-ot-r">
                        <div>${movieData[0].runtime}</div>
                        <div>${movieData[0].originalTitle}</div>
                        <div>${movieRate[0].certification}</div>
                    </div>
                    <button type="button" onclick="location.href='review-insert?search=${movieData[0].title}'">리뷰쓰기</button>
                </div>
            </div>

        </article>

        <article class="overview">
            <h3>내용</h3>
            <div></div>
        </article>
        <article class="cast-list">
            <h3>출연진</h3>
            <c:forEach items="${cast}" var="cast">
            <div class="cast-card">
             
                    <img id="poster" src="https://image.tmdb.org/t/p/original/${cast.profilePath}"/>
    
                <div class="cast-name">
                    <div>${cast.actor} </div>
                    <div>${cast.character}</div>
                </div>
            </div>
   </c:forEach>
   
        </article>
        <article class="point">
            포인트
        </article>
        <article class="review-list">
            <ul class="review-card">
                <li class="review-header">
                    <div>
                    <a href="myInfo?uiId=00000000"><img src="./common.jpg" alt="대체이미지"></a>
                    </div>
                    <div>0000</div>
                </li>
                <li class="review-body">리뷰어 글 내용</li>
                <li class="review-like">
                    <div>좋아요</div>
                    <div>댓글</div>
                </li>
            </ul>
            <ul class="review-card">
                <li class="review-header">
                    <div><img src="./common.jpg" alt="대체이미지"></div>
                    <div>리뷰어 닉네임</div>
                </li>
                <li class="review-body">리뷰어 글 내용</li>
                <li class="review-like">
                    <div>좋아요</div>
                    <div>댓글</div>
                </li>
            </ul>
            <ul class="review-card">
                <li class="review-header">
                    <div><img src="./common.jpg" alt="대체이미지"></div>
                    <div>리뷰어 닉네임</div>
                </li>
                <li class="review-body">리뷰어 글 내용</li>
                <li class="review-like">
                    <div>좋아요</div>
                    <div>댓글</div>
                </li>
            </ul>
        </article>
    </section>







<!-- footer area -->
<jsp:include page="../common/footer.jsp"></jsp:include>

</body>


</html>