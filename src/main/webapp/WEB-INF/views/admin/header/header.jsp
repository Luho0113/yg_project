<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<link rel="stylesheet" href="${path}/resources/css/common/page.css" />
<link rel="stylesheet" href="${path}/resources/css/common/header.css" />
<link rel="stylesheet" href="${path}/resources/css/common/button.css" />
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@2.0/nanumsquare.css">

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
			<!-- 관리자 로그인 -->
            <c:if test="${admin.adminId != null && admin.adminId eq 'younggam_official'}">
               <ul>
                  <li><a href="/admin/home">영감 관리자 홈</a></li>
                  <li><a href="/admin/logout">영감 관리자 로그아웃</a></li>
                  <li>
                  <div class="admin-icon">
                         <a href="/admin/home">
                         <img id="admin-Img" src="${admin.adminFilePath}" alt="영감 관리자" />
                       	 </a>${admin.adminNickName} 님
                    </div>
                  </li>
               </ul>
            </c:if>	
            <!-- 관리자 로그아웃 -->
            <c:if test="${admin.adminId == null}">
            	<ul>
            	<li><a href="/admin/login">관리자 로그인</a></li>
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
		<a href="/">
			<img src="../../../resources/images/yg_logo_orange.png" />
		</a>
	</div>
</div>