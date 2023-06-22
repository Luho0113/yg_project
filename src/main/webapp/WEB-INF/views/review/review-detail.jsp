<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 상세</title>
<link rel="stylesheet" href="${path}/resources/css/common/header.css">
<link rel="stylesheet" href="${path}/resources/css/common/footer.css">
<link rel="stylesheet" href="${path}/resources/css/common/page.css">
<link rel="stylesheet" href="${path}/resources/css/review/review-detail.css">
<link rel="stylesheet" href="${path}/resources/css/review/review-detail-star.css">
<script src="${path}/resources/js/review/review-detail.js"></script>
</head>
<body>
	<!-- header area -->
	<jsp:include page="../common/header.jsp"></jsp:include>

	<div class="content">
		<div class="space" id="space"></div>

		<div class="reivewContainer" id="reivewContainer">
			<div class="movieInfo" id="movieInfo">
				<input type="hidden" class="movieId" value="${review.riMovieId}">
				<span class="movieTitle" id="movieTitle"></span>
				<span class="releaseDate" id="releaseDate"></span>
				<span class="genre" id="genre">장르 | </span>
				<span class="country" id="country">국가</span>
			</div>

			<hr>

			<div class="hambugerMenu" id="hambugerMenu">
				<!-- 여기에 메뉴 아이콘 넣기 -->
			</div>

			<div class="posterContainer" id="posterContainer">
				<img class="posetPath" id="posterPath">
			</div>

			<div class="profileBox" id="profileBox">
				<a href="userReview?uiId=${review.uiId}">
					<img id="profile" src="${review.uiFilePath}" onerror="this.src='https://ifh.cc/g/cDROLZ.png';">
				</a>
			</div>

			<div class="nickName" id="nickName">${review.uiNickname}</div>

			<div class="buttonContainer" id="buttonContainer">
				<input type="button" class="follow" id="follow" value="구독">
			</div>

			<div class="starPoint" id="starPoint">
				<span class="star"> ★★★★★ <span class="starRange">★★★★★</span>
					<input type="range" value="1" step="1" min="0" max="10">
					<input type="hidden" class="riStar" id="riStar" value="${review.riStar}">
				</span>
			</div>

			<div class="riListDate" id="riListDate">
				${review.riCredate}
			</div>

			<div class="reviewComment" id="reviewComment">
				좋아요 ${review.riLikeCnt} 댓글 ?? 조회수 ${review.riViewCnt}
			</div>

			<div class="riListReviewContent" id="riListReviewContent">
				<!-- riListReviewContent: 리뷰 그 자체,, div  -->
				${review.riContent}
			</div>

			<div class="buttonGroup" id="buttonGroup">
				<input type="button" name="likeButton" id="likeButton" value="좋아요">
				<input type="button" name="dislikeButton" id="dislikeButton" value="싫어요"> <input type="button" name="commentButton"
					id="commentButton" value="댓글">
			</div>
		</div>



		<div class="commentContainer" id="commentContainer">
			<div class="commentProfileBox" id="commentProfileBox">
				<img id="profile" src="${reivew.uiFilePath}"
					onerror="this.src='https://ifh.cc/g/cDROLZ.png';">
			</div>

			<div class="commentNickName" id="commentNickName">
				${reivew.uiNickname}
			</div>

			<div class="commentDate" id="commentDate">
				??
			</div>

			<div class="hambugerMenu" id="hambugerMenu">
				<!-- 여기에 메뉴 아이콘 넣기 -->
			</div>

			<div class="commentContent" id="commentContent">
				??
			</div>

			<div class="commentLike" id="commentLike">
				<button type="button" class="commentLikeButton">♥ 15</button>
				<input class="commentLikeCnt" type="hidden" value="">
			</div>

		</div>


	</div>
	<!-- footer area -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>