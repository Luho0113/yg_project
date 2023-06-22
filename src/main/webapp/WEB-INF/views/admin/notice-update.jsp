<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 수정</title>
<link rel="stylesheet" href="${path}/resources/css/common/header.css">
<link rel="stylesheet" href="${path}/resources/css/common/footer.css">
<link rel="stylesheet" href="${path}/resources/css/common/page.css">
<link rel="stylesheet" href="${path}/resources/css/admin/notice-update.css">
</head>
<body>
<!-- header area -->
	<jsp:include page="../common/header.jsp"></jsp:include>
<script>
function uploadImg(obj){
	   let file = obj.files[0];
	   document.querySelector('#img_div>img').src = URL.createObjectURL(file);
	   document.querySelector('#img_div').style.display='';
	}
</script>
<div class="updateNoti-area">
	<form method="POST" action="/admin/notice-update" enctype="multipart/form-data">
	<h2>공지사항 수정</h2>
	<label for="niNum">번호</label>
	<input type="text" id="niNum" name="niNum" value="${notice.niNum}" readonly><br>
	
	<label for="niCredat">작성일</label>
	<input type="text" id="niCredat" name="niCredat" value="${notice.niCredat}" readonly><br>
	
	<label for="niCnt">조회수</label>
	<input type="text" id="niCnt" name="niCnt" value="${notice.niCnt}" readonly><br>
	
	<label for="niTitle">제목</label>
	<input type="text" id="niTitle" name="niTitle" value="${notice.niTitle}" maxlength="8"><br>
	
	<div id="img_div" style="display: none">
			<img src="${notice.niFilePath}" width="200">
	</div>
	<label for="niFilePath">첨부</label>
	<input type="file" id="niFilePath" name="niFile" onchange="uploadImg(this)"><br>
	
	<label for="niContent">내용</label>
	<textarea rows="10" cols="80" id="niContent" name="niContent">${notice.niContent}</textarea><br>

	<button class="updateBtn">공지사항 수정</button>
	<input type="reset" class="resetBtn"value="다시 작성">
	</form>
</div>
<!-- footer area -->
<!-- <jsp:include page="../common/footer.jsp"></jsp:include> -->
</body>
</html>