<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
      integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
/>
<link rel="stylesheet" href="${path}/resources/css/admin/login.css">
<title>영감 관리자 로그인 페이지</title>
</head>
<body>
<script>
<c:if test="${msg != null}">
	alert('${msg}');
</c:if>
/* 관리자 아이디, 비번 체크 */
function frmCheck(){
	const adminId = document.querySelector('#adminId');
	if(adminId.value==''){
		alert('관리자 아이디를 입력해주세요.');
		adminId.focus();
		return false;
	}
	const adminPwd = document.querySelector('#adminPwd');
	if(adminPwd.value==''){
		alert('관리자 비밀번호를 입력해주세요.');
		adminPwd.focus();
		return false;
	}
	return true;
}

/* 관리자 로그인 input 효과 */
$("#adminId").focusin(function(){
    $(".admin-icon").css("color", "#FF7C00");
  }).focusout(function(){
    $(".admin-icon").css("color", "#FF7C00");
  });

$("#adminPwd").focusin(function(){
    $(".keyPass-icon").css("color", "#FF7C00");
  }).focusout(function(){
    $(".keyPass-icon").css("color", "FFFAF6");
  });
</script>
	<form method="POST" action="/admin/login" onsubmit="return frmCheck()">
		<h2><span class="adminLogin"><i class="fa-solid fa-right-to-bracket"></i></span> 영감 관리자 로그인</h2>
		<button class="submit"><span class="lock"><i class="fa-solid fa-lock"></i></span></button>
		<span class="admin-icon">
			<i class="fa-solid fa-user"></i>
		</span>
			<input type="text" name="adminId" id="adminId" placeholder="아이디">
		<span class="keyPass-icon">
			<i class="fa-solid fa-key"></i>
		</span>
			<input type="password" name="adminPwd" id="adminPwd" placeholder="비밀번호">
	</form>
</body>
</html>