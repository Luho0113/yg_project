<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영감</title>
<link rel="stylesheet" href="${path}/resources/css/common/header.css">
<link rel="stylesheet" href="${path}/resources/css/common/footer.css">
<link rel="stylesheet" href="${path}/resources/css/common/page.css">
<link rel="stylesheet" href="${path}/resources/css/review/review-list-star.css">
<link rel="stylesheet" href="${path}/resources/css/review/review-list.css">
<script src="${path}/resources/js/review/review-list.js"></script>
</head>
<body>
<!-- header area -->
<jsp:include page="../common/header.jsp"></jsp:include>

   <!-- content area -->
   <div class="content">

      <div class="riShorSelect" id="riShorSelect">
         <div class="genreSort" id="genreSort">장르별</div>
         <div class="createDateSort" id="createDateSort">
            <select class="sort" id="sort">
               <option value="new">최신순</option>
               <option value="old">오래된순</option>
            </select>
         </div>
      </div>



      <div class="riGenreBar" id="riGenreBar">
         <ul>
            <li><a href="reviews">전체</a></li>
            <li><a href="review-sort?genre=액션">액션</a></li>
            <li><a href="review-sort?genre=모험">모험</a></li>
            <li><a href="review-sort?genre=애니메이션">애니메이션</a></li>
            <li><a href="review-sort?genre=코미디">코미디</a></li>
            <li><a href="review-sort?genre=범죄">범죄</a></li>
            <li><a href="review-sort?genre=다큐멘터리">다큐멘터리</a></li>
            <li><a href="review-sort?genre=드라마">드라마</a></li>
            <li><a href="review-sort?genre=가족">가족</a></li>
            <li><a href="review-sort?genre=판타지">판타지</a></li>
            <li><a href="review-sort?genre=역사">역사</a></li>
            <li><a href="review-sort?genre=공포">공포</a></li>
            <li><a href="review-sort?genre=음악">음악</a></li>
            <li><a href="review-sort?genre=미스터리">미스터리</a></li>
            <li><a href="review-sort?genre=로맨스">로맨스</a></li>
            <li><a href="review-sort?genre=SF">SF</a></li>
            <li><a href="review-sort?genre=TV">TV 영화</a></li>
            <li><a href="review-sort?genre=스릴러">스릴러</a></li>
            <li><a href="review-sort?genre=전쟁">전쟁</a></li>
            <li><a href="review-sort?genre=서부">서부</a></li>
         </ul>
      </div>


      <div class="riListContainer" id="riListContainer">
         <!-- riListContainer: 리뷰 목록 전체를 묶는 div -->
         
         <c:if test="${empty reviewList}">
         	<div class="emptyReview">앗! 아직 영감이 없어요.</div>
         </c:if>

         <c:forEach items="${reviewList}" var="reivew" varStatus="status">
         
            <div class="riListElement" id="riListElement">
               <!-- riListElement: 리뷰 하나의 내용을 묶는 div  -->
               <!-- 이걸 반복 생성하면 되지 않을까  -->
               <input type="hidden" id="riMovieId" class="riMovieId" value="${reivew.riMovieId}" readonly="readonly"> 
               <input type="hidden" id="index" class="index" value="${status.index}" readonly="readonly">
               
               
               <div class="riListPoster" id="riListPoster">
                  <img id="posterPath" class="posterPath">
                  <!-- posterPath: 포스터 img  -->
               </div>

               <div class="riListMovieInfo" id="riListMovieInfo">
                  <!-- riListMovieInfo: 영화 제목 및 연도를 표시하는 div  -->
                  <span class="riMovieTitle" id="riMovieTitle"></span>
                  <span id="riListReleaseDate" class="riListReleaseDate"></span>
               </div>

               <div class="riListUserInfo" id="riListUserInfo">
                  <!-- riListUserInfo: 작성자 프로필 이미지, 닉네임, 별점을 표시하는 div  -->
                  <div class="profileBox" id="profileBox">
                     <a href="userReview?uiNickname=${reivew.uiNickname}">
                        <img id="profile" src="${reivew.uiFilePath}" onerror="this.src='https://ifh.cc/g/cDROLZ.png';">
                     </a>
                  </div>

                  <div class="nickName" id="nickName">
                  	<a href="userReview?uiNickname=${reivew.uiNickname}">
                  		${reivew.uiNickname}
                  	</a>
                  </div>

                  <%-- 별점 숫자로 표시 --%>
                  <div class="starPointText" id="starPointText">
                     <span>(${reivew.riStar})</span>
                  </div>

                  <div class="starPoint" id="starPoint">
                     <span class="star"> ★★★★★ <span class="starRange">★★★★★</span>
                        <input type="range" value="1" step="1" min="0" max="10">
                        <input type="hidden" class="riStar" id="riStar" value="${reivew.riStar}" readonly="readonly">
                     </span>
                  </div>
               </div>
               
               <div class="riListReviewContent" id="riListReviewContent">
                  <a href="/review?riNum=${reivew.riNum}&movieId=${reivew.riMovieId}">
                     <!-- riListReviewContent: 리뷰 그 자체,, div  -->
                     ${reivew.riContent}
                  </a>
               </div>
               
               <div class="riListComment" id="riListComment">
               		댓글 ${reivew.rcCount}
               </div>

               <div class="riListDate" id="riListDate">
                  <!-- riListDate: 리뷰 작성 일자 div  -->
                  ${reivew.riCredate}
               </div>
            </div>
         </c:forEach>
      </div>
<div id="pageDiv" style="text-align:center; font-size: 14pt" ></div>
   </div> <!-- .content 끝 -->
<!-- footer area -->
<jsp:include page="../common/footer.jsp"></jsp:include>

<!-- 페이징 처리 시작 -->
<c:if test="${!(empty page.list)}">
<script>
	const pages = ${page.pages}; //전체 페이지 (이건 기본으로 들어 있음)
	const page = ${page.pageNum}; //현재 페이지 (이건 기본으로 들어 있음)
	const start = Math.floor((page-1)/10)*10+1; //현재 화면에서 시작 페이지 (11~20이면 start = 11)
	const end = (start + 9) > pages ? pages : (start + 9); //현재 페이지에서 끝 페이지 (11~20이면 end = 20) 

	console.log(page);
	
	let html = '';
	if(start!=1){
		html += '<a href="/reviews?page=' + (start-1); //페이지 이동할 때 url
//      	if('${param.biTitle}'){
//          	html += '&biTitle=${param.biTitle}';
//	       	}
		//여기 밑에 있는 것들이 페이징 바가 되는 것임 
        html += '">&#x25c0</a>'; 
  	}
	
	for(let i = start; i<=end; i++){
		if(i==page){ //현재 선택된 page=N이 현재 화면의 첫 페이지라면
			html += ' [' + i + '] '; 
		}else{
			if(i == 1){ //현재 선택된 page=N이 1이라면
				html += ' <a href="/reviews">[' + i + ']</a> ';
			}else{//현재 선택된 page=N이 1이 아니라면 
				html += ' <a href="/reviews?page=' + i + '">[' + i + ']</a> ';
			}
		}
	}
	if(end != pages){ //현재 페이지의 마지막 페이지가 전체 페이지 번호의 마지막이 아니라면
		html += '<a href="/reviews?page=' + (end + 1) + '">&#9654</a>';
	}
	
	document.querySelector('#pageDiv').innerHTML = html;
</script>
</c:if>

</body>
</html>