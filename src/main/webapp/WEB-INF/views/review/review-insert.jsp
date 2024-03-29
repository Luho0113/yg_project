<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/common/error-user.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영감</title>
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-round.css" rel="stylesheet">
<link rel="stylesheet" href="${path}/resources/css/review/review-insert-star.css">
<link rel="stylesheet" href="${path}/resources/css/review/review-insert.css">
<link rel="stylesheet" href="${path}/resources/css/common/header.css"/>
<script src="${path}/resources/js/review/review-star.js"></script>
<script src="${path}/resources/js/review/review-insert.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
</head>

<body>
<!-- header area -->
<jsp:include page="../common/header.jsp"></jsp:include>

<!-- content area -->
<div class="content">

    <div class="margin"></div>
    
	<form autocomplete="off" action="/review-insert" method="GET" name="form">
        <div class="autocomplete">
          <input id="myInput" type="text" name="search" placeholder="영화, 감독, 배우를 검색해보세요." value="${param.search}">
        </div>

        <div class="searchButton">
            <input type="submit" class="movie-search-input">
        </div>
    </form>
	
    <form action="/review-insert" method="POST" onsubmit="return checkNull()">
    	<input type="hidden" id="riMovieId" name="riMovieId" value="">
    	<input type="hidden" id="riGenre" name="riGenre" value="">
        <table class="reviewInfo">
            <tr>
                <th>감독</th><td id="director"></td>
            </tr>
            <tr>
                <th>개봉 연도</th><td id="releaseDate"></td>
            </tr>
            <tr>
                <th>영감 포인트</th>
                <td>
                    <input type="checkbox" id="riDirectionPoint" name="riDirectionPoint" value="0" onchange="younggamPointCheck(this)">
                    <label for="riDirectionPoint">연출</label>

                    <input type="checkbox" id="riActingPoint" name="riActingPoint" value="0" onchange="younggamPointCheck(this)">
                    <label for="riActingPoint">연기</label>

                    <input type="checkbox" id="riStoryPoint" name="riStoryPoint" value="0" onchange="younggamPointCheck(this)">
                    <label for="riStoryPoint">스토리</label>
                    
					<input type="checkbox" id="riOstPoint" name="riOstPoint" value="0" onchange="younggamPointCheck(this)">
                    <label for="riOstPoint">OST</label>
                    
                    <input type="checkbox" id="riVisualPointl" name="riVisualPoint" value="0" onchange="younggamPointCheck(this)">
                    <label for="riVisualPointl">영상미</label><br>
                </td>
            </tr>
            <tr>
                <th>별점</th>
               		<td>	
                       <span class="star">
                           ★★★★★
                           <span>★★★★★</span>
                           <input type="range" oninput="drawStar(this)" value="1" step="1" min="0" max="10">
                           <input type="hidden" name="riStar" id="riStar" value="0">
                       </span>
               		</td>
            </tr>
        </table>
        <div>
            <textarea placeholder=" 리뷰를 작성하세요." name="riContent" class="riContent" id="riContent"></textarea>
        </div>
        <div class="spoilContainer">
            <input type="checkbox" id="riSpoil" name="riSpoil" value="1" onchange="spoilCheck(this)">
            <input type="hidden" id="riSpoil_hidden" name="riSpoil" value="0">
            <label for="riSpoil">해당 리뷰는 스포일러를 포함하고 있습니다.</label>
        </div>
        <div class="buttonContainer">
            <button type="submit">등록</button>
            <button type="button" onclick="location.href='reviews'">취소</button>
        </div>
    </form>
</div>
    
<!-- footer area -->
<jsp:include page="../common/footer.jsp"></jsp:include>
</body>

<script>
var movieId = new Array();
var movieReleaseDate = new Array();
var movieDirectors = new Array();
var movieTitle = new Array();
var movieGenreId = new Array();
	<c:forEach items="${movie}" var="movie">
		movieId.push("${movie['id']}")
		movieReleaseDate.push("${movie['releaseDate']}")
		movieDirectors.push("${movie['directors']}");
		movieTitle.push("${movie['title']}");
		movieGenreId.push("${movie['genreIds']}");
    </c:forEach>
autocomplete(document.getElementById("myInput"), movieTitle, movieDirectors, movieReleaseDate, movieId, movieGenreId);


//textarea 크기 자동 조절
const DEFAULT_HEIGHT = 30; // textarea 기본 height
const $textarea = document.querySelector('#riContent');
$textarea.oninput = (event) => {
	  const $target = event.target;
	  $target.style.height = 0;
	  $target.style.height = DEFAULT_HEIGHT + ($target.scrollHeight - 100) + 'px';
};

function checkNull() {
	const riMovieId = document.querySelector("#riMovieId");
	if (riMovieId.value == null || riMovieId.value == "") {
		alert('영화 정보를 입력해주세요.');
		return false;
	}
	const riStar = document.querySelector("#riStar");
	if (riStar.value == '') {
		alert('별점을 입력해주세요.');
		return false;
	}
	const riContent = document.querySelector('.riContent');
	if (riContent.value == null || riContent.value.trim() == "") {
		alert('영화 후기를 입력해주세요.');
		return false;
	}
}
</script>

</html>