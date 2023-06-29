<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/common/error-admin.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 정보 페이지</title>
<link rel="stylesheet" href="${path}/resources/css/admin/profile.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="${path}/resources/css/admin/home.css" />
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@2.0/nanumsquare.css">

<script src="${path}/resources/js/admin/home.js"></script>
</head>
<body>
	<!-- header area -->
	<jsp:include page="./header/header.jsp"></jsp:include>

	<section class="dashboard">
		
		<div class="content adminView-area">
			<h2>영감 관리자 정보</h2>
			<table class="adminView-table">
				<tr>
					<th><h5>아이디</h5></th>
					<td>${admin.adminId}</td>
				</tr>
				<tr>
					<th><h5>닉네임</h5></th>
					<td>${admin.adminNickName}</td>
				</tr>
				<tr>
					<th><h5>
							프로필<br>이미지
						</h5></th>
					<td><c:if test="${admin.adminFilePath == null}">
						</c:if> <c:if test="${admin.adminFilePath != null}">
							<img class="profile-img" src="${admin.adminFilePath}" width="150">
						</c:if></td>
				</tr>
				<tr>
					<th><h5>이메일</h5></th>
					<td>${admin.adminEmail}</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button class="adminUpdate"
							onclick="location.href='/admin/update?adminId=${admin.adminId}'">수정</button>
					</td>
				</tr>
			</table>
		</div>
</body>
</html>