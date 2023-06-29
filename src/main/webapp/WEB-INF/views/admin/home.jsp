<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/common/error-admin.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="${path}/resources/css/admin/home.css" />
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@2.0/nanumsquare.css">
<script src="${path}/resources/js/admin/home.js"></script>

<title>영감 관리자 페이지</title>
</head>
<body>
	<!-- header area -->
	<jsp:include page="./header/header.jsp"></jsp:include>

	<section class="dashboard">
		<div class="admin-profile-wrap">
			<h3>영감 관리자 프로필</h3>
			<div class="admin-profile">
				<div class="admin-profile-img">
					<a href="/admin/profile"> <img src="${admin.adminFilePath}"
						alt="영감 관리자"
						onerror="this.src='${path}/resources/images/admin_default_img.png';">
					</a>
				</div>
				<div class="admin-profile-info">
					<h4>아이디&nbsp; &nbsp; &nbsp; ${admin.adminId}</h4>
					<h4>닉네임&nbsp; &nbsp; &nbsp; ${admin.adminNickName}</h4>
					<h4>이메일&nbsp; &nbsp; &nbsp; ${admin.adminEmail}</h4>
				</div>
			</div>

		</div>
		<div class="dash-content">
			<div class="overview">
				<div class="boxes">
					<div class="box box1">
						<a href="/admin/users/"> <i class="fa-solid fa-user"></i>
							<div class="box-text">
								<span>회원 관리</span>
							</div>
						</a>
					</div>
					<div class="box box2">
						<a href="/admin/notices/"> <i class="fa-solid fa-flag"></i>
							<div class="box-text">
								<span>공지사항</span>
							</div>
						</a>
					</div>
					<div class="box box3">
						<a href="/admin/reports"> <i class="fa-solid fa-clipboard"></i>
							<div class="box-text">
								<span>신고</span> 게시판 관리
							</div>
						</a>
					</div>
				</div>
			</div>
		</div>
	</section>

</body>
</html>
