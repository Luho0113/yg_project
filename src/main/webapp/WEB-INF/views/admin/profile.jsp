<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 정보 페이지</title>
<link rel="stylesheet" href="${path}/resources/css/admin/profile.css">
<link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
      integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    />
<link rel="stylesheet" href="${path}/resources/css/admin/home.css" />
<script src="${path}/resources/js/admin/home.js"></script>
</head>
<body>
	<nav>
		<div class="younggam-logo">
		  <div class="younggam-img">
			<img src="${path}/resources/images/yg_logo_orange.png" alt="영감 관리자" />
		  </div>
		  <span class="younggam-logo">YoungGam</span>
		</div>
		<div class="menu-items">
		  <ul class="nav-links">
			<li>
			  <a href="/admin/home">
				<i class="fa-solid fa-house"></i>
				<span class="admin-home">Home</span>
			  </a>
			</li>
			<li>
			  <a href="/admin/users">
				<i class="fa-solid fa-user"></i>
				<span class="admin-user">회원 관리</span>
			  </a>
			</li>
			<li>
			  <a href="/admin/notices">
				<i class="fa-solid fa-flag"></i>
				<span class="admin-user">공지사항</span>
			  </a>
			</li>
			<li>
			  <a href="/admin/reports">
				<i class="fa-solid fa-clipboard"></i>
				<span class="admin-report">신고 게시판 관리</span>
			  </a>
			</li>
			<li>
			  <a href="/admin/profile">
				<i class="fa-solid fa-pen"></i>
				<span class="admin-profile">관리자 정보</span>
			  </a>
			</li>
		  </ul>
  
		  <ul class="logout">
			<li>
			  <a href="/admin/logout">
				<i class="fa-solid fa-right-from-bracket"></i>
				<span class="admin-logout">로그아웃</span>
			  </a>
			</li>
		  </ul>
		</div>
	  </nav>
  
	  <section class="dashboard">
		<div class="dash-top">
		  <a href="/admin/profile"><img src="${admin.adminFilePath}" alt="영감 관리자">
		  </a>&nbsp;<a class="admin-nickname" href="/admin/profile">${admin.adminNickName} 님</a>
		</div>
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
			<th><h5>프로필<br>이미지</h5></th>
			<td>
			<c:if test="${admin.adminFilePath == null}">
			</c:if>
			<c:if test="${admin.adminFilePath != null}">
			<img src="${admin.adminFilePath}" width="150">
			</c:if>
			</td>
		</tr>
		<tr>
			<th><h5>이메일</h5></th>
			<td>${admin.adminEmail}</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<button class="adminUpdate" onclick="location.href='/admin/update?adminId=${admin.adminId}'">수정</button>
			</td>
		</tr>
	</table>
</div>
</body>
</html>