<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 수정 페이지</title>
<link rel="stylesheet" href="${path}/resources/css/admin/header.css">
<link rel="stylesheet" href="${path}/resources/css/common/footer.css">
<link rel="stylesheet" href="${path}/resources/css/common/page.css">
<link rel="stylesheet" href="${path}/resources/css/admin/user-update.css">
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
<div class="content updateUser-area">
<form method="POST" action="/admin/user-update" enctype="multipart/form-data">
	<h2>회원 정보 수정</h2>
	<label for="uiId">아이디</label>
	<input type="text" id="uiId" name="uiId" value="${user.uiId}" readonly><br>

	<label for="uiNickname">닉네임</label> 
	<input type="text" id="uiNickname" name="uiNickname" value="${user.uiNickname}"><br>

	<label for="uiPassword">비밀번호</label> 
	<input type="text" id="uiPassword" name="uiPassword" value="${user.uiPassword}"><br>

	<div id="img_div" style="display: none">
			<img src="${user.uiFilePath}" width="200">
	</div>
	<label for="uiFile">프로필 이미지</label> 
	<input type="file" id="uiFilePath" name="uiFile" onchange="uploadImg(this)"><br>
	
	<label for="uiEmail">이메일</label> 
	<input type="text" id="uiEmail" name="uiEmail" value="${user.uiEmail}"><br>
	
	<label for="uiReviewPoint">포인트</label> 
	<input type="text" id="uiReviewPoint" name="uiReviewPoint" value="${user.uiReviewPoint}"><br>
	
	<label for="uiActive">상태</label>
	<input type="text" id="uiActive" name="uiActive" value="${user.uiActive}">* 1: 활성 0: 비활성<br>
	
	<label for="uiReportCnt">신고 횟수</label>
	<input type="text" id="uiReportCnt" name="uiReportCnt" value="${user.uiReportCnt}"><br>
	
	<button class="updateBtn">회원 정보 수정</button>
	<input type="reset" class="resetBtn" value="다시 작성">
	</form>
</div>
	<!-- footer area -->
	<jsp:include page="../../common/footer.jsp"></jsp:include>
</body>
</html>