<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화록록</title>
<link rel="stylesheet" href="${path}/resources/css/common/header.css">
<link rel="stylesheet" href="${path}/resources/css/common/footer.css">
<link rel="stylesheet" href="${path}/resources/css/common/page.css">
<link rel="stylesheet" href="${path}/resources/css/review/review-star.css">
<link rel="stylesheet" href="${path}/resources/css/review/review-list.css">
<script src="${path}/resources/js/review/review-list.js"></script>
</head>
<body>
<!-- header area -->
<jsp:include page="../common/header.jsp"></jsp:include>

<!-- content area -->
<div class="content">

        <div class="riShorSelect" id="riShorSelect">
            <div class="genreSort" id="genreSort">
                장르별
            </div>
            <div class="createDateSort" id="createDateSort">
            <select  class="" id="">
                <option value="new">최신순</option>
                <option value="old">오래된순</option>
            </select>
        </div>
    </div>



    <div class="riGenreBar" id="riGenreBar">
        <ul>
            <li>전체</li>
            <li>액션</li>
            <li>모험</li>
            <li>애니메이션</li>
            <li>코미디</li>
            <li>범죄</li>
            <li>다큐멘터리</li>
            <li>드라마</li>
            <li>가족</li>
            <li>판타지</li>
            <li>역사</li>
            <li>공포</li>
            <li>음악</li>
            <li>미스터리</li>
            <li>로맨스</li>
            <li>SF</li>
            <li>TV 영화</li>
            <li>스릴러</li>
            <li>전쟁</li>
            <li>서부</li>
        </ul>
    </div>




    <div class="riListContainer" id="riListContainer"><!-- riListContainer: 리뷰 목록 전체를 묶는 div -->
    
<c:forEach items="${reviewList}" var="reivew" varStatus="status">
        <div class="riListElement" id="riListElement"><!-- riListElement: 리뷰 하나의 내용을 묶는 div  --><!-- 이걸 반복 생성하면 되지 않을까  -->
		<input type="hidden" id="riMovieId" class="riMovieId" value="${reivew.riMovieId}">
		<input type="hidden" id="index" class="index" value="${status.index}">
            <div class="riListPoster" id="riListPoster"><!-- riListPoster: riListElement에 들어갈 포스터를 묶는 div  -->
                <img id="posterPath" class="posterPath"><!-- posterPath: 포스터 img  -->
            </div>

            <div class="riListMovieInfo" id="riListMovieInfo"><!-- riListMovieInfo: 영화 제목 및 연도를 표시하는 div  -->
                <span class="riMovieTitle" id="riMovieTitle"></span>
                <span id="riListReleaseDate" class="riListReleaseDate"></span>
            </div>

            <div class="riListUserInfo" id="riListUserInfo"><!-- riListUserInfo: 작성자 프로필 이미지, 닉네임, 별점을 표시하는 div  -->
                <div class="profileBox" id="profileBox">
                    <img id="profile" src="${reivew.uiFilePath}" onerror="this.src='https://ifh.cc/g/cDROLZ.png';">
                </div>

                <div class="nickName" id="nickName">
                    ${reivew.uiNickname}
                </div>
                
                <div class="starPoint" id="starPoint">
                <span class="star">
                    ★★★★★
                    <span>★★★★★</span>
                    <input type="range" oninput="drawStar(this)" value="1" step="1" min="0" max="10">
                </span>
				
				<%-- 별점 숫자로 표시 --%>
                <span>${reivew.riStar}</span>
                </div>
            </div>

            <div class="riListReviewContent" id="riListReviewContent"><!-- riListReviewContent: 리뷰 그 자체,, div  -->
	  			${reivew.riContent}  
            </div>

            <div class="riListComment" id="riListComment"><!-- riListComment: 해당 리뷰의 댓글과 좋아요 수 div  -->
                ♥ ${review.riLikeCnt} 🗨2
            </div>

            <div class="riListDate" id="riListDate"><!-- riListDate: 리뷰 작성 일자 div  -->
                ${reivew.riCredate}
            </div>
        </div>
</c:forEach>
    </div>

</div>
<!-- footer area -->
<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>