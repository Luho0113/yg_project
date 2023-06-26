<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file = "/WEB-INF/views/common/error-admin.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록 페이지</title>
<link rel="stylesheet" href="${path}/resources/css/admin/header.css">
<link rel="stylesheet" href="${path}/resources/css/common/footer.css">
<link rel="stylesheet" href="${path}/resources/css/common/page.css">
<link rel="stylesheet" href="${path}/resources/css/admin/user-list.css">
</head>
<body>
	<!-- header area -->
	<jsp:include page="../header/header.jsp"></jsp:include>

	<div class="content userArea">
	<h2>회원 관리</h2>
	<form action="/admin/users" method="GET">
		<input class="input" type="text" id="uiId" name="uiId" placeholder=" 유저 아이디" value="${param.uiId}">
		<input class="input" type="text" id="uiNickname" name="uiNickname" placeholder=" 유저 닉네임" value="${param.uiNickname}">
		<button class="userSearch">회원 검색</button>
	</form>
	<button class="inactiveList" onclick="location.href='/admin/inactive-users'">비활성 계정 회원 관리</button>
	<table class="userTable">
		<thead>
			<tr>
				<th><h4>아이디</h4></th>
				<th><h4>닉네임</h4></th>
				<th><h4>프로필 이미지</h4></th>
				<th><h4>이메일</h4></th>
				<th><h4>포인트</h4></th>
				<th><h4>상태</h4></th>
				<th><h4>신고 횟수</h4></th>
				<th><h4>수정 / 삭제</h4></th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${empty page.list}">
				<th colspan="12">등록된 회원이 없습니다.</th>
			</c:if>
			<c:forEach items="${page.list}" var="user">
				<tr>
					<td>${user.uiId}</td>
					<td><a href="/admin/user?uiId=${user.uiId}">${user.uiNickname}</a></td>
					<td><img class="profile-img" src="${user.uiFilePath}" onerror="this.src='https://ifh.cc/g/cDROLZ.png';"></td>
					<td>${user.uiEmail}</td>
					<td>${user.uiReviewPoint}</td>
					<td>
						<button class="acInactiveBtn" onclick="location.href='/admin/user-update?uiId=${user.uiId}'">
		                     <c:if test="${user.uiActive==1}">활성</c:if>
		                     <c:if test="${user.uiActive==0}">비활성</c:if>
		               </button>
		            </td>
		            <td>${user.uiReportCnt}</td>
					<td>
					<button class="userUpdate" onclick="location.href='/admin/user-update?uiId=${user.uiId}'">수정</button>
					<button class="userDelete" onclick="location.href='/admin/user-delete?uiId=${user.uiId}'; deleteCheck()">탈퇴</button>
					</td>
				</tr>
			</c:forEach>
		</tbody>
		
	</table>
<div id="pageDiv"></div>
<c:if test="${!(empty page.list)}">
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
	const pages = ${page.pages};
	const page = ${page.pageNum}; //현재 페이지
	const start = Math.floor((page-1)/10)*10+1;
	const end = (start + 9) > pages ? pages : (start + 9)
	let html = '';
	if(start!=1){
		html += '<a href="/admin/users?page=' + (start-1);
		if('${param.uiId}'){
			html += '&uiId=${param.uiId}';	
		}
		html += '"></a>';
	}
	
	for(let i = start; i<=end; i++){
		if(i==page){
			html += ' [' + i + '] ';
		}else{
			if(i==1){
				html += '<a href="/admin/users?&uiId=${param.uiId}">[' + i + ']</a>';	
			}else{
				html += '<a href="/admin/users?page=' + i + '&uiId=${param.uiId}&uiNickname=${param.uiNickname}">[' + i + ']</a>';
			}
		}
	}
		if(end!=pages){
			html += '<a href="/admin/users?page=' + (end + 1) + '&uiId=${param.uiId}&uiNickname=${param.uiNickname}"></a>';
		}
		document.querySelector('#pageDiv').innerHTML = html;	
		</script>
	</c:if>
</div>
	<!-- footer area -->
	<jsp:include page="../../common/footer.jsp"></jsp:include>
</body>
</html>