<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@2.0/nanumsquare.css">
<link rel="stylesheet" href="${path}/resources/css/common/page.css" />
<link rel="stylesheet" href="${path}/resources/css/admin/header.css" />
<link rel="stylesheet" href="${path}/resources/css/common/button.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

<div class="navbar">
	<!-- 로고 부분 -->
	<div class="nav-logo">
		<a href="/"> <img alt="navlogo"
			src="../../../resources/images/yg_logo_black.png">
		</a>
	</div>

	<!-- 관리자 메뉴 부분 -->
	<div class="navbar-menu-wrap">
		<div class="navbar-menu">
			<div class="navbar-left">
				<ul class="nav-links">
					<li><a href="/admin/home"> <i class="fa-solid fa-house"></i>
							<span>Home</span>
					</a></li>
					<li><a href="/admin/users"> <i class="fa-solid fa-user"></i>
							<span>회원 관리</span>
					</a></li>
					<li><a href="/admin/notices"> <i class="fa-solid fa-flag"></i>
							<span>공지사항</span>
					</a></li>
					<li><a href="/admin/reports"> <i
							class="fa-solid fa-clipboard"></i> <span>신고 게시판 관리</span>
					</a></li>
					<li><a href="/admin/profile"> <i class="fa-solid fa-pen"></i>
							<span>관리자 정보</span>
					</a></li>
				</ul>
			</div>

			<div class="navbar-right">
				<div class="navbar-userProfile">
					<!-- 관리자 로그인 -->
					<c:if
						test="${admin.adminId != null && admin.adminId eq 'younggam_official'}">
						<ul>
							<li>
								<div class="admin-icon">
									<a href="/admin/home"> <img id="admin-Img"
										src="${admin.adminFilePath}" alt="영감 관리자"
										onerror="this.src='${path}/resources/images/admin_default_img.png';" />
									</a><span>${admin.adminNickName} 님</span>
								</div>
							</li>
							<li><a href="/admin/logout"> <i
									class="fa-solid fa-right-from-bracket"></i> <span>로그아웃</span></a></li>
						</ul>
					</c:if>
					<!-- 관리자 로그아웃 -->
					<c:if test="${admin.adminId == null}">
						<ul>
							<li><a href="/admin/login"><span>관리자 로그인</span></a></li>
						</ul>
					</c:if>
				</div>
			</div>
			<!-- navbar-right -->
		</div>
		<!-- navbar-menu end -->
	</div>

</div>
<!-- navbar end -->


<div class="header">
	<div class="logo">
		<a href="/"> <img src="../../../resources/images/yg_logo_main.png" />
		</a>
	</div>
</div>