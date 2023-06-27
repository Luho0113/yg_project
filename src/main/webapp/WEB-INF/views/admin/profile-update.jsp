<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/common/error-admin.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 프로필 수정 페이지</title>
<link rel="stylesheet" href="${path}/resources/css/admin/profile-update.css">
<link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
      integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    />
<link rel="stylesheet" href="${path}/resources/css/admin/home.css" />
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@2.0/nanumsquare.css">
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
<script>
function uploadImg(obj){
	   let file = obj.files[0];
	   document.querySelector('#img_div>img').src = URL.createObjectURL(file);
	   document.querySelector('#img_div').style.display='';
	}
</script>
	<div class="content updateAdmin-area">
	<form method="POST" action="/admin/update" enctype="multipart/form-data">
	<h2>관리자 정보 수정</h2>
	<label for="adminId">아이디</label>
	<input type="text" id="adminId" name="adminId" value="${admin.adminId}" readonly><br>
	
	<label for="adminNickName">닉네임</label> 
	<input type="text" id="adminNickName" name="adminNickName" value="${admin.adminNickName}"><br>

	<label for="adminPwd">비밀번호</label> 
	<input type="password" id="adminPwd" name="adminPwd" value="${admin.adminPwd}"><br>

	<div id="img_div" style="display: none">
			<img src="${admin.adminFilePath}" width="200">
	</div>
	<label for="aiFile">프로필 이미지</label> 
	<input type="file" id="adminFilePath" name="aiFile" onchange="uploadImg(this)"><br>
	
	<label for="adminEmail">이메일</label> 
	<input type="text" id="adminEmail" name="adminEmail" value="${admin.adminEmail}"><br>
	
	<button class="updateBtn">관리자 정보 수정</button>
	<input type="reset" class="resetBtn" value="다시 작성">
	</form>
</div>
</body>
</html>