<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/common/error-user.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고 등록</title>
<link rel="stylesheet" href="${path}/resources/css/common/header.css">
<link rel="stylesheet" href="${path}/resources/css/common/footer.css">
<link rel="stylesheet" href="${path}/resources/css/common/page.css">
<link rel="stylesheet" href="${path}/resources/css/admin/report-file.css">
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
/* 신고 작성 체크 */
function writeCheck(){
	const piTitle = document.getElementById('piTitle');
	const piCategory = document.getElementById('piCategory');
	const piContent = document.getElementById('piContent');
	
	if(piTitle.value==''){
		alert('제목을 입력해주세요.');
		piTitle.focus();
		return false;
	}
	if(piContent.value==''){
		alert('내용을 입력해주세요.');
		piContent.focus();
		return false;
	}
	flag=false;
	for(i=0; i<fileForm.piCategory.length; i++){
		if(fileForm.piCategory[i].checked){
			flag=true;
		}
	}
	if(flag==false){
		alert("분류를 1개 이상 선택해주세요.")
		return false;
	}
	  return true;
}
	
</script>
<div class="content reportFile-area">
	<form method="POST" action="/report-file" id="fileForm" enctype="multipart/form-data" onsubmit="return writeCheck()">
	<h2>신고 등록</h2>
	<h5>** 신고 게시판의 모든 글은 비밀글로 등록됩니다. **</h5>
	
	<label for="piTitle">제목</label>
	<input type="text" id="piTitle" name="piTitle"><br>
	
	<label for="piCategory">분류</label>
	<input type="checkbox" id="piCategory" name="piCategory" value="욕설">욕설
	<input type="checkbox" id="piCategory" name="piCategory" value="광고/홍보">광고/홍보
	<input type="checkbox" id="piCategory" name="piCategory" value="음란">음란
	<input type="checkbox" id="piCategory" name="piCategory" value="기타">기타
	<br>
	
	<label for="piFilePath">첨부
		<div class="btn-upload">증거 파일</div>
	</label>
	<input type="file" id="piFilePath" name="piFile" onchange="uploadImg(this)"><br>
	
	<label for="piContent">내용</label>
	<textarea rows="10" cols="80" id="piContent" name="piContent" placeholder="신고할 해당 유저의 아이디를 내용에 함께 적어주세요."></textarea><br>

	<button class="fileBtn">신고 등록</button>
	<input type="reset" class="resetBtn" value="다시 작성">
	</form>
	</div>
<!-- footer area -->
<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>