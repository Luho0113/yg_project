<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 상세 정보 페이지</title>
<link rel="stylesheet" href="${path}/resources/css/admin/header.css">
<link rel="stylesheet" href="${path}/resources/css/common/footer.css">
<link rel="stylesheet" href="${path}/resources/css/common/page.css">
<link rel="stylesheet" href="${path}/resources/css/admin/user-view.css">
</head>
<script>
<!-- 탈퇴 버튼 -->
	function deleteCheck() {
		if(!confirm('해당 회원을 탈퇴시키면 복구할 수 없습니다. \n정말로 탈퇴시키시겠습니까?')){
			alert("탈퇴가 취소되었습니다.");
			return false;
		}else{
			location.href="/admin/user-delete?uiId=${user.uiId}";
		}
	}
</script>
<body>
	<!-- header area -->
	<jsp:include page="../header/header.jsp"></jsp:include>

<div class="content userView-area">
	<h2>회원 상세 정보</h2>
	<table class="userView-table">
		<tr>
			<th><h4>아이디</h4></th>
			<td>${user.uiId}</td>
		</tr>
		<tr>
			<th><h4>닉네임</h4></th>
			<td>${user.uiNickname}</td>
		</tr>
		<tr>
			<th><h4>프로필 이미지</h4></th>
			<td>
			<c:if test="${user.uiFilePath == null}">
			</c:if>
			<c:if test="${user.uiFilePath != null}">
			<img src="${user.uiFilePath}" width="150">
			</c:if>
			</td>
		</tr>
		<tr>
			<th><h4>이메일</h4></th>
			<td>${user.uiEmail}</td>
		</tr>
		<tr>
			<th><h4>포인트</h4></th>
			<td>${user.uiReviewPoint}</td>
		</tr>
		<tr>
			<th><h4>상태</h4></th>
			<td>${user.uiActive}</td>
		</tr>
		<tr>
			<th><h4>신고 횟수</h4></th>
			<td>${user.uiReportCnt}</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<button class="userUpdate" onclick="location.href='/admin/user-update?uiId=${user.uiId}'">수정</button>
				<button class="userDelete" onclick="deleteCheck()">탈퇴</button>
			</td>
		</tr>
	</table>
</div>
	<!-- footer area -->
	<jsp:include page="../../common/footer.jsp"></jsp:include>
</body>
</html>