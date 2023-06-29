<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="http://code.jquery.com/jquery-latest.js"></script>
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
            <select class="sort" onchange="sortChange(this)">
                  <option value="new" 
                     <c:if test="${param.sort == 'new'}">selected="selected"</c:if>>최신순</option>
                  <option value="old"
                     <c:if test="${param.sort == 'old'}">selected="selected"</c:if>>오래된순</option>
            </select>
         </div>
      </div>



      <div class="riGenreBar" id="riGenreBar">
         <ul class="genreUl">
            <li><a href="reviews">전체</a></li>
            <li>
               <a href="review-sort?genre=액션&sort=" <c:if test="${param.genre == '액션'}">style="color: #ff7c00";</c:if>>액션</a>
            </li>
            <li>
               <a href="review-sort?genre=모험&sort=" <c:if test="${param.genre == '모험'}">style="color: #ff7c00";</c:if>>모험</a>
            </li>
            <li>
               <a href="review-sort?genre=애니메이션&sort=" <c:if test="${param.genre == '애니메이션'}">style="color: #ff7c00";</c:if>>애니메이션</a>
            </li>
            <li>
               <a href="review-sort?genre=코미디&sort=" <c:if test="${param.genre == '코미디'}">style="color: #ff7c00";</c:if>>코미디</a>
            </li>
            <li>
               <a href="review-sort?genre=범죄&sort=" <c:if test="${param.genre == '범죄'}">style="color: #ff7c00";</c:if>>범죄</a>
            </li>
            <li>
               <a href="review-sort?genre=다큐멘터리&sort=" <c:if test="${param.genre == '다큐멘터리'}">style="color: #ff7c00";</c:if>>다큐멘터리</a>
            </li>
            <li>
               <a href="review-sort?genre=드라마&sort=" <c:if test="${param.genre == '드라마'}">style="color: #ff7c00";</c:if>>드라마</a>
            </li>
            <li>
               <a href="review-sort?genre=가족&sort=" <c:if test="${param.genre == '가족'}">style="color: #ff7c00";</c:if>>가족</a>
            </li>
            <li>
               <a href="review-sort?genre=판타지&sort=" <c:if test="${param.genre == '판타지'}">style="color: #ff7c00";</c:if>>판타지</a>
            </li>
            <li>
               <a href="review-sort?genre=역사&sort=" <c:if test="${param.genre == '역사'}">style="color: #ff7c00";</c:if>>역사</a>
            </li>
            <li>
               <a href="review-sort?genre=공포&sort=" <c:if test="${param.genre == '공포'}">style="color: #ff7c00"</c:if>>공포</a>
            </li>
            <li>
               <a href="review-sort?genre=음악&sort=" <c:if test="${param.genre == '음악'}">style="color: #ff7c00";</c:if>>음악</a>
            </li>
            <li>   
               <a href="review-sort?genre=미스터리&sort=" <c:if test="${param.genre == '미스터리'}">style="color: #ff7c00";</c:if>>미스터리</a>
            </li>
            <li>
               <a href="review-sort?genre=로맨스&sort=" <c:if test="${param.genre == '로맨스'}">style="color: #ff7c00";</c:if>>로맨스</a>
            </li>
            <li>
               <a href="review-sort?genre=SF&sort=" <c:if test="${param.genre == 'SF'}">style="color: #ff7c00";</c:if>>SF</a>
            </li>
            <li>
               <a href="review-sort?genre=TV&sort=" <c:if test="${param.genre == 'TV'}">style="color: #ff7c00";</c:if>>TV 영화</a>
            </li>
            <li>   
               <a href="review-sort?genre=스릴러&sort=" <c:if test="${param.genre == '스릴러'}">style="color: #ff7c00";</c:if>>스릴러</a>
            </li>
            <li>
               <a href="review-sort?genre=전쟁&sort=" <c:if test="${param.genre == '전쟁'}">style="color: #ff7c00";</c:if>>전쟁</a>
            </li>   
            <li>
               <a href="review-sort?genre=서부&sort=" <c:if test="${param.genre == '서부'}">style="color: #ff7c00";</c:if>>서부</a>
            </li>
         </ul>
      </div>


      <div class="riListContainer" id="riListContainer">
         <!-- riListContainer: 리뷰 목록 전체를 묶는 div -->
         
         <c:if test="${empty reviewList}">
            <div class="emptyReview">앗! 아직 영감이 없어요.</div>
         </c:if>

         <c:forEach items="${reviewList}" var="reivew" varStatus="status">
         
            <div class="riListElement">
               <!-- riListElement: 리뷰 하나의 내용을 묶는 div  -->
               <!-- 이걸 반복 생성하면 되지 않을까  -->
               <input type="hidden" class="riMovieId" value="${reivew.riMovieId}" readonly="readonly"> 
               <input type="hidden" class="index" value="${status.index}" readonly="readonly">
               
               
               <div class="riListPoster">
               <a href="detail?movieId=${reivew.riMovieId}&riMovieId=${reivew.riMovieId}">
                        <img class="posterPath">
                     </a>
               </div>

            <!-- riListMovieInfo: 영화 제목 및 연도를 표시하는 div  -->
               <div class="riListMovieInfo">
                     <a href="detail?movieId=${reivew.riMovieId}&riMovieId=${reivew.riMovieId}">
                        <span class="riMovieTitle"></span>
                     </a>
                     <span class="riListReleaseDate"></span>
               </div>

               <!-- riListUserInfo: 작성자 프로필 이미지, 닉네임, 별점을 표시하는 div  -->
               <div class="riListUserInfo">
                  <div class="profileBox">
                     <a href="userReview?uiNickname=${reivew.uiNickname}">
                        <img class="profile" src="${reivew.uiFilePath}" onerror="this.src='https://ifh.cc/g/cDROLZ.png';">
                     </a>
                  </div>

                  <div class="nickName">
                     <a href="userReview?uiNickname=${reivew.uiNickname}">
                        ${reivew.uiNickname}
                     </a>
                  </div>

                  <!-- 별점 숫자로 표시 -->
                  <div class="starPointText">
                     <span>(${reivew.riStar})</span>
                  </div>

                  <div class="starPoint">
                     <span class="star">★★★★★<span class="starRange">★★★★★</span>
                        <input type="range" value="1" step="1" min="0" max="10">
                        <input type="hidden" class="riStar" value="${reivew.riStar}" readonly="readonly">
                     </span>
                  </div>
               </div>
               
               <!-- riListReviewContent: 리뷰 그 자체,, div  -->
               <c:choose>
                     <c:when test="${reivew.riSpoil eq 1}">
                  <div class="riListReviewContent">
                           <a href="/review?riNum=${reivew.riNum}&movieId=${reivew.riMovieId}">
                              스포일러 포함 리뷰입니다. 
                           </a>
                        </div>
                  </c:when>
                  <c:otherwise>
                  <div class="riListReviewContent">
                           <a href="/review?riNum=${reivew.riNum}&movieId=${reivew.riMovieId}">
                              ${reivew.riContent}
                           </a>
                        </div>
                  </c:otherwise>           
               </c:choose>

               <div class="riListComment">
                     댓글 ${reivew.rcCount} &nbsp; &nbsp; 조회수 ${reivew.riViewCnt}
               </div>

               <div class="riListDate">
                     ${fn:substring(reivew.riCredate,0,10)}
               </div>
            </div>
         </c:forEach>
         
      <c:if test="${fn:length(reviewList) > 5}">
            <div class="review-load">
                 <a href="#" id="review-load">더보기</a>
            </div>
          </c:if>
      </div>
   </div> <!-- .content 끝 -->
<!-- footer area -->
<jsp:include page="../common/footer.jsp"></jsp:include>

<!-- javascript -->
<script>
//후기 더보기 버튼
   $(".riListContainer > .riListElement").hide(); //개별 리뷰를 숨김
   $(".riListContainer > .riListElement").slice(0, 5).css("display", "block"); //개별 리뷰 안 보이게
   $("#review-load").click( //더보기 버튼 역할
      function(e) {
         e.preventDefault();
         $(".riListContainer >.riListElement:hidden").slice(0, 5).fadeIn(200).css(
               "display", "block"); // 클릭시 more 갯수 지정
         if ($(".riListContainer >.riListElement:hidden").length == 0) {
            // 컨텐츠 남아있는지 확인
            $("#review-load").fadeOut(100); // 컨텐츠 없을 시 버튼 사라짐
         }
      }
   );
</script>
</body>
</html>