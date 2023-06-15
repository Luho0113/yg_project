<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록 페이지</title>
</head>
<form action="/admin/users" method="GET">
	<input type="text" name="uiId" placeholder="유저 아이디" value="${param.uiId}">
	<input type="text" name="uiName" placeholder="유저 이름" value="${param.uiName}">
	<button>회원 검색</button>
</form>
	<table class="userTable" border="1">
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>닉네임</th>
			<th>프로필 이미지</th>
			<th>이메일</th>
			<th>휴면 여부</th>
			<th>수정 / 삭제</th>
		</tr>
		<c:if test="${empty page.list}">
			<th colspan="7">등록된 회원이 없습니다.</th>
		</c:if>
		<c:forEach items="${page.list}" var="user">
		<tr>
			<td>${user.uiId}</td>
			<td><a href="/admin/user?uiId=${user.uiId}">${user.uiName}</a></td>
			<td>${user.uiNickname}</td>
			<td><img src="${user.uiFilePath}" width="150"></td>
			<td>${user.uiEmail}</td>
			<td>
				<div>
				<button onclick="location.href='/admin/user-update?uiId=${user.uiId}'">
					<c:if test="${user.uiActive==1}">활성</c:if>
					<c:if test="${user.uiActive==0}">비활성</c:if>
				</button>
				</div>
			</td>
			<td><a href="/admin/user-update?uiId=${user.uiId}">수정</a>
			<a href="/admin/user-delete?uiId=${user.uiId}">삭제</a></td>
		</tr>
		</c:forEach>
	</table>
<div id="pageDiv"></div>
<c:if test="${!(empty page.list)}">
<script>
	const pages = ${page.pages};
	const page = ${page.pageNum}; //현재 페이지
	const start = Math.floor((page-1)/10)*10+1;
	const end = (start + 9) > pages ? pages : (start + 9)
	let html = '';
	if(start!=1){
		html += '<a href="/admin/users?page=' + (start-1);
		if('${param.uiId}'){
			htl += '&uiId=${param.uiId}';	
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
				html += '<a href="/admin/users?page=' + i + '&uiId=${param.uiId}">[' + i + ']</a>';
			}
		}
	}
		if(end!=pages){
			html += '<a href="/admin/users?page=' + (end + 1) + '&uiId=${param.uiId}"></a>';
		}
	document.querySelector('#pageDiv').innerHTML = html;
</script>
</c:if>
</body>
</html>