<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영감</title>
<!-- 스타일 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="${path}/resources/css/common/about.css" />
</head>
<body>
	<!-- header area -->
	<jsp:include page="../common/header.jsp"></jsp:include>

	<!-- content area -->
	<div class="content">
		<p>About</p>
		<h1>YoungGam</h1>

		<h2>영화 <span>감상</span>과 <span>감동</span>을 함께 !</h2>

		<!-- 웹 페이지 소개 -->
		<div class="yg-description">
			<div class="yg-description-part1">
				<p>우리 영감은, 영화감상(映畵鑑賞)에서 앞 글자 영(映), 감(鑑)을 따와 지었습니다.</p>
				<p>원하는 영화를 검색하고 다른 사람들의 후기에 댓글을 달면서 서로 자유롭게 소통할 수 있는 공간입니다.</p>
			</div>



			<div class="yg-description-part2">
				<p>영감의 목표는</p>
				<p>더 많은 사람이 자신의 취향에 따른 인생 영화를 발견하고,</p>
				<p>그 다양한 영감을 기록하며,
				</p><p>서로 다양한 관점을 존중하는,</p>
				<p>공간을 만드는 것입니다.</p>
			</div>


			<div class="yg-description-part3">
				<p>다양한 관점이 담긴 세상을 만나고 자신의 영감을 발견해보세요.</p>
			</div>

		</div>

		<!-- 사이트의 주요 기능 -->
		<div class="yg-summary-wrap">
			<div class="yg-summary">
				<div class="yg-summary-img">
					<a href="/"> <i class="fa-solid fa-film"
						style="color: #ff7c00;"></i>
					</a>

				</div>
				<p class="yg-summary-text">영화 검색</p>

			</div>
			<div class="yg-summary">
				<div class="yg-summary-img">
					<a href="/review-insert"> <i class="fa-brands fa-slideshare"
						style="color: #ff7c00;"></i>
					</a>

				</div>
				<p class="yg-summary-text">영감 공유</p>
			</div>

			<div class="yg-summary">
				<div class="yg-summary-img">
					<a href="/reviews"> <i class="fa-solid fa-comments"
						style="color: #ff7c00;"></i>
					</a>

				</div>
				<p class="yg-summary-text">영감 연결</p>
			</div>
		</div>



	</div>

	<!-- footer area -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>