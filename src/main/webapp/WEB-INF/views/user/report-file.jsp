<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고 등록</title>
</head>
<body>
<script>
function uploadImg(obj){
	   let file = obj.files[0];
	   document.querySelector('#img_div>img').src = URL.createObjectURL(file);
	   document.querySelector('#img_div').style.display='';
	}
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
	if(document.data.piCategory[0].checked==false&&
	   document.data.piCategory[1].checked==false&&
	   document.data.piCategory[2].checked==false&&
	   document.data.piCategory[3].checked==false){
	   alert("분류를 체크해주세요.");
	   return false;	
}
</script>
	<form method="POST" action="/report-file" enctype="multipart/form-data">
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
	
	<label for="piFilePath">첨부</label>
	<input type="file" id="piFilePath" name="piFile" onchange="uploadImg(this)"><br>
	
	<label for="piContent">내용</label>
	<textarea rows="10" cols="80" id="piContent" name="piContent"></textarea><br>

	<button>신고 등록</button>
	<input type="reset" value="다시 작성">
	</form>
</body>
</html>