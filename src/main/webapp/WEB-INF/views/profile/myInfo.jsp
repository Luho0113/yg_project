<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/common/error-user.jsp"%>


<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>내 프로필</title>
<!-- 스타일 -->
<link rel="stylesheet" href="${path}/resources/css/common/button.css" />
<link rel="stylesheet" href="${path}/resources/css/profile/myInfo.css" />
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
				<p>point : ${user.uiReviewPoint}</p>
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
							<div class="reviews-empty">작성한 후기가 없습니다.</div>
						</c:if>

						<!-- 작성한 후기가 있는 경우 -->
						<c:forEach items="${myReviews}" var="myReview">
							<div class="user-review">
								<div class="user-review-text">
									<a
										href="/review?riNum=${myReview.riNum}&movieId=${myReview.riMovieId}">
										<p class="description">${myReview.riContent}</p> </a>
									
								</div>
								<span>${myReview.riCredate}</span>
							</div>
						</c:forEach>
					</div>
					<div id="tab2" class="cont">
						<!-- 작성한 댓글이 없는 경우 -->
						<c:if test="${empty myComments}">
							<div class="coments-empty">작성한 댓글이 없습니다.</div>
						</c:if>				
						
						<!-- 작성한 댓글이 있는 경우 -->
						<c:forEach items="${myComments}" var="myComment">
							<div class="user-review">
								<div class="user-review-text">
									<a
										href="/review?riNum=${myComment.riNum}&movieId=${myComment.riMovieId}">
										<p class="description">${myComment.rcContent}</p> </a>
								</div>
							</div>
						</c:forEach>
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
		
		


	</script>
</body>
</html>
