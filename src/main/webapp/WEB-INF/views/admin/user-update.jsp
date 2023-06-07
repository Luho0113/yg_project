<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 수정 페이지</title>
</head>
<body>
<script>
function uploadImg(obj){
	   let file = obj.files[0];
	   document.querySelector('#img_div>img').src = URL.createObjectURL(file);
	   document.querySelector('#img_div').style.display='';
	}
</script>
<form method="POST" action="/admin/user-update" enctype="multipart/form-data">
	<h2>회원 정보 수정</h2>
	<label for="uiId">아이디</label>
	<input type="text" name="uiId" value="${user.uiId}" readonly><br>
	<label for="uiName">이름</label> 
	<input type="text" id="uiName" name="uiName" value="${user.uiName}"><br>

	<label for="uiNickname">닉네임</label> 
	<input type="text" id="uiNickname" name="uiNickname" value="${user.uiNickname}"><br>

	<label for="uiPwd">비밀번호</label> 
	<input type="text" id="uiPwd" name="uiPwd" value="${user.uiPwd}"><br>

	<div id="img_div" style="display: none">
			<img src="${user.uiFilePath}" width="200">
	</div>
	<label for="uiFile">프로필 이미지</label> 
	<input type="file" id="uiFilePath" name="uiFile" onchange="uploadImg(this)"><br>
	
	<label for="uiEmail">이메일</label> 
	<input type="text" id="uiEmail" name="uiEmail" value="${user.uiEmail}"><br>
	
	<label for="uiActive">상태</label>
	<input type="text" id="uiActive" name="uiActive" value="${user.uiActive}"><br>
	
	<button>회원 정보 수정</button>
	<input type="reset" value="다시 작성">
	</form>
</body>
</html>