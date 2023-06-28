<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/common/error-user.jsp"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>내 프로필</title>
<!-- 스타일 -->
<link rel="stylesheet" href="${path}/resources/css/common/button.css" />
<link rel="stylesheet" href="${path}/resources/css/profile/myInfo.css" />
<link rel="stylesheet" href="${path}/resources/css/common/header.css" />
</head>
<body>
	<!-- header area -->
	<jsp:include page="../common/header.jsp"></jsp:include>

	<!-- content area -->
	<div class="content">
		<!-- 내 프로필 정보(user)는 세션에서 가져옴 -->
		<h3>내 프로필</h3>

		<div class="myInfo-all-wrap">
			<div class="myInfo-img-wrap">
				<div>
					<img src="${user.uiFilePath}" class="profile-image"
						onerror="this.src='https://ifh.cc/g/cDROLZ.png';" />
				</div>
			</div>

			<div class="myInfo-content">
				<h4>${user.uiNickname}</h4>
				<p>@${user.uiId}</p>
				<p>포인트 : ${user.uiReviewPoint}</p>
			</div>

			<div class="button-update">
				<button class="button-custom btnToOrange"
					onclick="location.href='/myInfo-update'">정보수정</button>
			</div>
		</div>


		<!-- 작성한 후기 정보는 ReviewInfoVO에서 가져옴 -->
		<div class="tap-wrap">
			<div class="tab-menu">
				<ul class="tab-list">
					<li class="tab-active"><a href="#tab1" class="tab-button">후기</a>
					</li>
					<li><a href="#tab2" class="tab-button">댓글</a></li>

				</ul>

				<div class="cont_area">
					<div id="tab1" class="cont" style="display: block">
						<!-- 작성한 후기가 없는 경우 -->
						<c:if test="${empty myReviews}">
							<div class="reviews-empty">첫 영감을 남겨주세요!</div>
							<div class="button-review">
								<button class="button-custom btnFromBlack"
									onclick="location.href='/review-insert'">
									<span>영감 남기기</span>
								</button>
							</div>
						</c:if>

						<!-- 작성한 후기가 있는 경우 -->
						<c:forEach items="${myReviews}" var="myReview">
							<div class="user-review">
								<div class="user-review-text">
									<a
										href="/review?riNum=${myReview.riNum}&movieId=${myReview.riMovieId}">
										<p class="description">${myReview.riContent}</p>
									</a>
								</div>
								<div class="user-review-info">
									<span>댓글 ${myReview.rcCount}</span> <span>|</span> <span>작성일
										${fn:substring(myReview.riCredate, 0,10)}</span>

									<button class="button-custom btnFromBlack"
										onclick="deleteReview(${myReview.riNum})">삭제</button>
									<button class="button-custom btnFromBlack"
										onclick="location.href='/review-update?riNum=${myReview.riNum}'">수정</button>
								</div>

							</div>
						</c:forEach>
						<c:if test="${fn:length(myReviews) >= 5}">
							<div class="review-load">
								<a href="#" id="review-load">더보기</a>
							</div>
						</c:if>

					</div>
					<div id="tab2" class="cont">
						<!-- 작성한 댓글이 없는 경우 -->
						<c:if test="${empty myComments}">
							<div class="coments-empty">첫 댓글을 남겨주세요!</div>
							<div class="button-comment">
								<button class="button-custom btnFromBlack"
									onclick="location.href='/reviews'">
									<span>댓글 남기기</span>
								</button>
							</div>
						</c:if>

						<!-- 작성한 댓글이 있는 경우 -->
						<c:forEach items="${myComments}" var="myComment">
							<div class="user-comment">
								<div class="user-comment-text">
									<a
										href="/review?riNum=${myComment.riNum}&movieId=${myComment.riMovieId}">
										<p class="description">${myComment.rcContent}</p>
									</a>
								</div>
								<div class="user-comment-info">
									<span>작성일 ${fn:substring(myComment.rcCredate, 0,10)}</span>
									<button class="button-custom btnFromBlack"
										onclick="deleteComment(${myComment.rcNum})">삭제</button>
								</div>
							</div>
						</c:forEach>
						<c:if test="${fn:length(myComments) >= 5}">
							<div class="comment-load">
								<a href="#" id="comment-load">더보기</a>
							</div>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- footer area -->
	<jsp:include page="../common/footer.jsp"></jsp:include>

	<!-- javascript -->
	<script>
		const tabList = document.querySelectorAll(".tab-menu .tab-list li");
		const contents = document
				.querySelectorAll(".tab-menu .cont_area .cont");
		let activeCont = ""; // 현재 활성화 된 컨텐츠 (기본:#tab1 활성화)

		for (var i = 0; i < tabList.length; i++) {
			tabList[i]
					.querySelector(".tab-button")
					.addEventListener(
							"click",
							function(e) {
								e.preventDefault();
								for (var j = 0; j < tabList.length; j++) {
									// 나머지 버튼 클래스 제거
									tabList[j].classList.remove("tab-active");

									// 나머지 컨텐츠 display:none 처리
									contents[j].style.display = "none";
								}

								// 버튼 관련 이벤트
								this.parentNode.classList.add("tab-active");

								// 버튼 클릭시 컨텐츠 전환
								activeCont = this.getAttribute("href");
								document.querySelector(activeCont).style.display = "block";
							});
		}
		
		function deleteReview(e){
			
			if(confirm('정말 삭제하시겠습니까?')){
				window.location.href = '/review-delete?riNum=' + e;
				alert('삭제되었습니다.');
				history.go(0);
			}
			
		}

		function deleteComment(e){
			
			if(confirm('정말 삭제하시겠습니까?')){
				window.location.href = '/delete-comment?rcNum=' + e;
				alert('삭제되었습니다.');
				history.go(0);
			}
			
		}
		
		
		
		//후기 더보기 버튼
		 $('.cont > .user-review').hide();
	     $(".cont > .user-review").slice(0, 5).css("display", "block"); 
	     $("#review-load").click(function(e){
	        e.preventDefault();
	        $(".cont >.user-review:hidden").slice(0, 5).fadeIn(200).css('display', 'block'); // 클릭시 more 갯수 지저정
	        if($(".cont >.user-review:hidden").length == 0){ // 컨텐츠 남아있는지 확인
	            $('#review-load').fadeOut(100); // 컨텐츠 없을 시 버튼 사라짐
	        }
	    });
	     
	   //댓글 더보기 버튼
		 $('.cont > .user-comment').hide();
	     $(".cont > .user-comment").slice(0, 5).css("display", "block"); 
	     $("#comment-load").click(function(e){
	        e.preventDefault();
	        $(".cont >.user-comment:hidden").slice(0, 5).fadeIn(200).css('display', 'block'); // 클릭시 more 갯수 지저정
	        if($(".cont >.user-comment:hidden").length == 0){ // 컨텐츠 남아있는지 확인
	            $('#comment-load').fadeOut(100); // 컨텐츠 없을 시 버튼 사라짐
	        }
	    });
	</script>
</body>
</html>
