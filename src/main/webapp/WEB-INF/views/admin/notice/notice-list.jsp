<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file = "/WEB-INF/views/common/error-admin.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 페이지</title>
<link rel="stylesheet" href="${path}/resources/css/admin/header.css">
<link rel="stylesheet" href="${path}/resources/css/common/footer.css">
<link rel="stylesheet" href="${path}/resources/css/common/page.css">
<link rel="stylesheet" href="${path}/resources/css/admin/notice-list.css">
<link rel="stylesheet" href="../../common/footer.jsp">
</head>

<body>
	<!-- header area -->
	<jsp:include page="../header/header.jsp"></jsp:include>
	
	<div class="content noticeArea">
		<h2>영감 공지사항</h2>
		<form action="/admin/notices" method="GET">
			<input type="text" id="niTitle" name="niTitle" placeholder="제목" value="${param.niTitle}"> 
			<input type="text" id="niContent" name="niContent" placeholder="내용" value="${param.niContent}">
			<button class="noticeSearch">공지 검색</button>
		</form>
		<button class="registerBtn"
			onclick="location.href='/admin/notice-register'">공지사항 등록</button>
		<table class="noticeTable">
			<tr>
				<th><h4>번호</h4></th>
				<th><h4>제목</h4></th>
				<th><h4>작성자</h4></th>
				<th><h4>작성일</h4></th>
				<th><h4>조회수</h4></th>
				<th><h4>수정 / 삭제</h4></th>
			</tr>
			<c:if test="${empty page.list}">
				<th colspan="12">공지사항 목록이 없습니다.</th>
			</c:if>
			<c:forEach items="${page.list}" var="notice">
				<tr>
					<td>${notice.niNum}</td>
					<td><a class="niTitle" href="/admin/notice?niNum=${notice.niNum}">${notice.niTitle}</a>
					</td>
					<td>${notice.adminNickName}</td>
					<td>${notice.niCredat}</td>
					<td>${notice.niCnt}</td>
					<td><button class="noticeUpdate"
							onclick="location.href='/admin/notice-update?niNum=${notice.niNum}'">수정</button>
						<button class="noticeDelete" onclick="location.href='/admin/notice-delete?niNum=${notice.niNum}'; deleteCheck()">삭제</button></td>	
				</tr>
			</c:forEach>
		</table>
		<div id="pageDiv"></div>
		<c:if test="${!(empty page.list)}">
			<script>
			<!-- 삭제 버튼 -->
			function deleteCheck() {
				if(!confirm('삭제하시면 복구할 수 없습니다. \n정말로 삭제하시겠습니까?')){
					alert("삭제가 취소되었습니다.");
					return false;
				}else{
					location.href="/admin/notice-delete?niNum=${notice.niNum}";
				}
			}
				const pages = ${page.pages};
				const page = ${page.pageNum}; //현재 페이지
				const start = Math.floor((page - 1) / 10) * 10 + 1;
				const end = (start + 9) > pages ? pages : (start + 9);
				let html = '';
				if (start != 1) {
					html += '<a href="/admin/notices?page=' + (start - 1);
					if ('${param.niTitle}') {
						html += '&niTitle=${param.niTitle}';
					}
					html += '"></a>';
				}

				for (let i = start; i <= end; i++) {
					if (i == page) {
						html += ' [' + i + '] ';
					} else {
						if (i == 1) {
							html += ' <a href="/admin/notices?&niTitle=${param.niTitle}&niContent=${param.niContent}">[' + i + ']</a> ';
						} else {
							html += ' <a href="/admin/notices?page=' + i + '&niTitle=${param.niTitle}&niContent=${param.niContent}">[' + i + ']</a> ';
						}
					}
				}
				if (end != pages) {
					html += '<a href="/admin/notices?page=' + (end + 1) + '&niTitle=${param.niTitle}&niContent=${param.niContent}"></a>';
				}
				document.querySelector('#pageDiv').innerHTML = html;
			</script>
		</c:if>
	</div>
	<!-- footer area -->
	<jsp:include page="../../common/footer.jsp"></jsp:include>
</body>
</html>