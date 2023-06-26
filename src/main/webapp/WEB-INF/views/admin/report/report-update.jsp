<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고 글 수정</title>
<link rel="stylesheet" href="${path}/resources/css/admin/header.css">
<link rel="stylesheet" href="${path}/resources/css/common/footer.css">
<link rel="stylesheet" href="${path}/resources/css/common/page.css">
<link rel="stylesheet" href="${path}/resources/css/admin/report-update.css">
</head>
<body>
	<!-- header area -->
	<jsp:include page="../header/header.jsp"></jsp:include>
<script>
function uploadImg(obj){
	   let file = obj.files[0];
	   document.querySelector('#img_div>img').src = URL.createObjectURL(file);
	   document.querySelector('#img_div').style.display='';
	}
</script>
<div class="content updateReport-area">
	<form method="POST" action="/admin/report-update" enctype="multipart/form-data">
	<h2>신고 글 수정</h2>
	<label for="piNum">번호</label>
	<input type="number" id="piNum" name="piNum" value="${report.piNum}" readonly><br>
	
	<label for="piCredat">작성일</label>
	<input type="text" id="piCredat" name="piCredat" value="${report.piCredat}" readonly><br>
	
	<label for="piTitle">제목</label>
	<input type="text" id="piTitle" name="piTitle" value="${report.piTitle}"><br>
	
	<label for="piCategory">분류</label><br>
	<c:set value="${report.piCategory}" var="reports"/>
		<input type="checkbox" id="piCategory" name="piCategory" value="욕설"
		<c:if test="${fn:contains(reports, '욕설')}">checked
		</c:if>
		>욕설
		<input type="checkbox" id="piCategory" name="piCategory" value="광고/홍보"
		<c:if test="${fn:contains(reports, '광고/홍보')}">checked
		</c:if>
		>광고/홍보
		<input type="checkbox" id="piCategory" name="piCategory" value="음란"
		<c:if test="${fn:contains(reports, '음란')}">checked
		</c:if>
		>음란
		<input type="checkbox" id="piCategory" name="piCategory" value="기타"
		<c:if test="${fn:contains(reports, '기타')}">checked
		</c:if>
		>기타
		
	<div id="img_div" style="display: none">
			<img src="${report.piFilePath}" width="200">
	</div>
	<br><label for="piFilePath">첨부</label>
	<input type="file" id="piFilePath" name="piFile" onchange="uploadImg(this)"><br>
	
	<label for="piContent">내용</label>
	<textarea rows="10" cols="80" id="piContent" name="piContent">${report.piContent}</textarea><br>

	<button class="updateBtn">신고 글 수정</button>
	<input type="reset" class="resetBtn" value="다시 작성">
	</form>
</div>
	<!-- footer area -->
	<jsp:include page="../../common/footer.jsp"></jsp:include>
</body>
</html>