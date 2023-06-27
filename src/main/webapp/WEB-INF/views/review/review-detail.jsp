<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영감</title>
<link rel="stylesheet" href="${path}/resources/css/common/header.css">
<link rel="stylesheet" href="${path}/resources/css/common/footer.css">
<link rel="stylesheet" href="${path}/resources/css/common/page.css">
<link rel="stylesheet" href="${path}/resources/css/review/review-detail.css">
<link rel="stylesheet" href="${path}/resources/css/review/review-detail-star.css">
<script src="${path}/resources/js/review/review-detail.js"></script>
</head>
<body>

<%-- header area --%>
<jsp:include page="../common/header.jsp"></jsp:include>


<%-- content area --%>
	<div class="content">
		<div class="space" id="space"></div>

		<div class="reivewContainer" id="reivewContainer">
			<div class="movieInfo" id="movieInfo">
					<span class="movieTitle" id="movieTitle">${movie.title}</span>
					<span class="releaseDate" id="releaseDate">${movie.releaseDate} | </span>
					<span class="genre" id="genre">${movie.genreIds} | </span>
					<span class="country" id="country">${movie.productionConturies}</span>
			</div>

			<hr>

			<div class="hambugerMenu" id="hambugerMenu">
				<!-- 여기에 메뉴 아이콘 넣기 -->
			</div>

			<div class="posterContainer" id="posterContainer">
				<img class="posetPath" id="posterPath" src="https://image.tmdb.org/t/p/original${movie.posterPath}">
			</div>

			<div class="profileBox" id="profileBox">
				<a href="userReview?uiNickname=${review.uiNickname}">
					<img id="profile" src="${review.uiFilePath}" onerror="this.src='https://ifh.cc/g/cDROLZ.png';">
				</a>
			</div>

			<div class="nickName" id="nickName">
				<a href="userReview?uiNickname=${review.uiNickname}">
					${review.uiNickname}
				</a>
			</div>

			<div class="buttonContainer" id="buttonContainer">
				<c:choose>
					<c:when test="${user.uiId == review.uiId}">
						<button class="delete" onclick="deleteReview(${review.riNum})">삭제</button>
						<button class="update" onclick="location.href='/review-update?riNum=${review.riNum}'">수정</button>
					</c:when>
					<c:otherwise>
						<button class="follow">구독</button>
					</c:otherwise>
				</c:choose>
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
					<button name="likeButton" id="likeButton" value="1">좋아요</button>
					<button name="dislikeButton" id="dislikeButton" value="1">싫어요</button> 
					<button name="commentButton" id="commentButton" value="1">댓글</button>
			</div>
		</div>

<%-- 댓글 부분 시작 --%>
		<c:choose>
			<c:when test="${comments == null}">
				<div class="" id="">
						당신의 영감을 남겨보세용.
				</div>
			</c:when>
			<c:otherwise>
				<c:forEach items="${comments}" var="comment">
					<div class="commentContainer" id="commentContainer">
						<div class="commentProfileBox" id="commentProfileBox">
							<img id="profile" src="${comment.uiFilePath}" onerror="this.src='https://ifh.cc/g/cDROLZ.png';">
						</div>
				
						<div class="commentNickName" id="commentNickName">
							${comment.uiNickname}
						</div>
				
						<div class="commentDate" id="commentDate">
							${comment.rcCredate}
						</div>
				
						<div class="hambugerMenu" id="hambugerMenu">
							<!-- 여기에 메뉴 아이콘 넣기 -->
						</div>
				
						<div class="commentContent" id="commentContent">
							${comment.rcContent}
						</div>
				
						<div class="commentLike" id="commentLike">
							<button type="button" class="commentLikeButton">♥ ${comment.rcLikeCnt}</button>
							<input class="commentLikeCnt" type="hidden" value="">
						</div>
					</div>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		
		<form action="/review-comment" method="POST">
			<div>
				<textarea placeholder="댓글을 작성하세요." name="rcContent" class="rcContent"></textarea>
				<input type="hidden" name="riNum" value="${review.riNum}">
				<button>등록</button>
			</div>
		</form>


	</div>
	
<%-- footer area --%>
<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>