<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
				<a href="detail?movieId=${review.riMovieId}&riMovieId=${review.riMovieId}">
					<span class="movieTitle" id="movieTitle">${movie.title}</span>
				</a>
				<span class="releaseDate" id="releaseDate">${fn:substring(movie.releaseDate,0,4)} &nbsp; | &nbsp; </span>
				<span class="genre" id="genre">
					<c:forEach items="${movie.genreIds}" var="genre">
						${genre} &nbsp;
					</c:forEach> | &nbsp; 
				</span> 
				<span class="country" id="country">
					<c:forEach items="${movie.productionConturies}" var="country">
						${country} &nbsp;
					</c:forEach>
				</span>
			</div>

			<hr>

			<div class="posterContainer" id="posterContainer">
				<a href="detail?movieId=${review.riMovieId}&riMovieId=${review.riMovieId}">
					<img class="posterPath" src="https://image.tmdb.org/t/p/original${movie.posterPath}">
				</a>
			</div>

			<div class="profileBox" id="profileBox">
				<a href="userReview?uiNickname=${review.uiNickname}">
					<img id="profile" src="${review.uiFilePath}" onerror="this.src='${path}/resources/images/yg_profile.png';">
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
						<button class="follow" onclick="location.href='/report-file'">신고</button>
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
				댓글 ${review.rcCount} &nbsp; &nbsp; 조회수 ${review.riViewCnt}
			</div>

			<div class="riListReviewContent" id="riListReviewContent">
				<!-- riListReviewContent: 리뷰 그 자체,, div  -->
				${review.riContent}
			</div>
		</div>

<%-- 댓글 부분 시작 --%>
		<c:choose>
			<c:when test="${empty comments}">
				<div class="emptyComment">
							첫 번째 댓글을 남겨주세요!
				</div>
			</c:when>
			
			<c:otherwise>
				<c:forEach items="${comments}" var="comment">
					<div class="commentContainer" id="commentContainer">
						<div class="commentProfileBox" id="commentProfileBox">
							<a href="userReview?uiNickname=${comment.uiNickname}">
								<img id="profile" src="${comment.uiFilePath}" onerror="this.src='${path}/resources/images/yg_profile.png';">
							</a>
						</div>
				
						<div class="commentNickName" id="commentNickName">
							<a href="userReview?uiNickname=${comment.uiNickname}">
								${comment.uiNickname}
							</a>
						</div>
				
						<div class="commentDate" id="commentDate">
							${comment.rcCredate}
						</div>
						
						<div class="commentHamburger">
							<c:choose>
								<c:when test="${user.uiId == comment.uiId}">
									<button onclick="deleteComment(${comment.rcNum})">X</button>
								</c:when>
								<c:otherwise>
									<button onclick="location.href='/report-file'">신고</button>
								</c:otherwise>
							</c:choose>
						</div>
				
						<div class="hambugerMenu" id="hambugerMenu">
							<!-- 여기에 메뉴 아이콘 넣기 -->
						</div>
				
						<div class="commentContent" id="commentContent">
							${comment.rcContent}
						</div>
				
						<div class="commentLike" id="commentLike">
							<button type="button" class="commentLikeButton">♥ &nbsp; ${comment.rcLikeCnt}</button>
							<input class="commentLikeCnt" type="hidden" value="">
						</div>
					</div>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		
		<form action="/review-comment" method="POST">
			<c:choose>
				<c:when test="${empty user}">
					<div class="commentSubmit">
						<textarea placeholder="로그인 후 이용 가능합니다." name="rcContent" class="rcContent" readonly="readonly"></textarea>
					</div>
				</c:when>
				<c:otherwise>
					<div class="commentSubmit">
						<textarea placeholder="댓글을 작성하세요." name="rcContent" class="rcContent"></textarea>
						<input type="hidden" name="riNum" value="${review.riNum}">
						<button>댓글 등록</button>
					</div>
				</c:otherwise>
			</c:choose>
		</form>


	</div>
	
<%-- footer area --%>
<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>