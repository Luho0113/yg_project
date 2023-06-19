<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<div class="navbar">
	<!-- 로고 부분 -->
	<div class="nav-logo">
		<img alt="navlogo" src="../../../resources/images/yg_logo_black.png"
			width="40px">
	</div>

	<!-- 메뉴 부분 -->
	<div class="navbar-menu">

		<div class="navbar-left">
			<ul>
				<li><a href="/reviews">영화후기</a></li>
				<li><a href="/review-insert">평가하기</a></li>
				<li><a href="/reports">신고게시판</a></li>
			</ul>
			<div>
				<input type="text">
			</div>
		</div>
		<div class="navbar-right">
			<div class="navbar-userProfile">
				<!-- 로그인한 경우 -->
				<c:if test="${user.uiId != null}">
					<ul>
						<li><a href="/myInfo">내 프로필</a></li>
						<li><a href="/logout">로그아웃</a></li>
					</ul>
					<div>
						<a href="/myInfo"> <img alt="내프로필" src="${user.uiFilePath}"
							style="border-radius: 20px" width="40px" height="40px"
							onerror="this.src='https://ifh.cc/g/cDROLZ.png';">
						</a> ${user.uiNickname}님
					</div>
				</c:if>
				<!-- 로그아웃한 경우 -->
				<c:if test="${user.uiId == null}">
					<ul>
						<li><a href="/login">로그인</a></li>
						<!-- onclick="location.href='/login'" -->
						<li><a href="/join">회원가입</a></li>
					</ul>
					<div>
						<a href="/myInfo"> <img alt="내프로필" src="${user.uiFilePath}"
							style="border-radius: 20px" width="40px" height="40px"
							onerror="this.src='https://ifh.cc/g/cDROLZ.png';">
						</a> ${user.uiNickname}님
					</div>
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