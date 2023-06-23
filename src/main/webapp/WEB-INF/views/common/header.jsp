<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<link rel="stylesheet" href="${path}/resources/css/common/page.css" />
<link rel="stylesheet" href="${path}/resources/css/common/header.css" />
<link rel="stylesheet" href="${path}/resources/css/common/button.css" />

<div class="navbar">
	<!-- 로고 부분 -->
	<div class="nav-logo">
		<a href="/"> <img alt="navlogo"
			src="../../../resources/images/yg_logo_black.png">
		</a>
	</div>

	<!-- 메뉴 부분 -->
	<div class="navbar-menu">

		<div class="navbar-left">
			<ul>
				<li><a href="/reviews">영화후기</a></li>
				<li><a href="/review-insert">평가하기</a></li>
				<li><a href="/reports">신고게시판</a></li>
				<li>
					<div>
						<!--  <input type="text" placeholder="검색어를 입력해주세요."> -->
						<form action="/search" method="get">
							<input id="search" name="search" value="${param.search}"
								placeholder="영화, 감독, 배우를 검색해보세요.">
							<button class="button-custom btnOrange">검색</button>
						</form>

					</div>
				</li>
			</ul>
		</div>
		<div class="navbar-right">
			<div class="navbar-userProfile">
				<!-- 로그인한 경우 (세션에서 사용자 정보를 가져옴)-->
				<c:if test="${user.uiId != null}">
					<ul>
						<li><a href="/myInfo?uiNickname=${user.uiNickname}">내 프로필</a></li>
						<li><a href="/logout">로그아웃</a></li>
						<li>
							<div class="myInfo-icon">
								<a href="/myInfo?uiNickname=${user.uiNickname}"> <img id="myInfo-Img" alt="내프로필"
									src="${user.uiFilePath}"
									onerror="this.src='https://ifh.cc/g/cDROLZ.png';">
								</a> ${user.uiNickname}님
							</div>
						</li>
					</ul>

				</c:if>
				<!-- 로그아웃한 경우 -->
				<c:if test="${user.uiId == null}">
					<ul>
						<li><a href="/login">로그인</a></li>
						<!-- onclick="location.href='/login'" -->
						<li><a href="/join">회원가입</a></li>
						<li>
							<div class="myInfo-icon">
								<a href="/myInfo"> <img id="myInfo-Img" alt="내프로필"
									src="${user.uiFilePath}"
									onerror="this.src='https://ifh.cc/g/cDROLZ.png';">
								</a> ${user.uiNickname}님
							</div>
						</li>
					</ul>
				</c:if>
			</div>
		</div>
		<!-- navbar-right -->


	</div>
	<!-- navbar-menu end -->


</div>
<!-- navbar end -->




<div class="header">
	<div class="logo">
		<img src="../../../resources/images/yg_logo_orange.png" width="100px" />
	</div>
</div>