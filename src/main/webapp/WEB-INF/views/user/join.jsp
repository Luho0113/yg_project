<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/common/msg.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>

<h3>회원가입</h3>

<form method="POST" action="/join" onsubmit="return checkValue()" enctype="multipart/form-data">
	<div id="imgDiv" style="display:none">
		<img src="" width="300">
	</div>
	<label for="uiFilePath">프로필 이미지 : </label>
	<input type="file" name="uiFile" id="uiFile" onchange="loadImg(this)"> <br>
	이름 : <input type="text" name="uiName" id="uiName"> <br>
	닉네임 : <input type="text" name="uiNickname" id="uiNickname"> <br>
	아이디 : <input type="text" name="uiId" id="uiId"> <br>
	비밀번호 : <input type="password" name="uiPassword" id="uiPassword"> <br>
	비밀번호 확인 : <input type="password" name="uiPasswordCheck" id="uiPasswordCheck"> <br>
	이메일 : <input type="email" name="uiEmail" id="uiEmail"> <br>
	<button>가입하기</button>
</form>

<script>
	
	function checkValue(){
		const uiName = docoument.querySelector('#uiName');
		if (uiName.value.trim().length < 2) {
			alert('이름을 2글자 이상 입력해주세요.');
			uiName.value = '';
			uiName.focus();
			return false;
		}
	
		const uiPasswordCheck = document.querySelector('#uiPasswordCheck');
		if (uiPasswordCheck.value != uiPassword.value) {
			alert('비밀번호 확인이 틀렸습니다.');
			uiPasswordCheck.value = '';
			uiPasswordCheck.focus();
			return false;
		}
	}
	
	function loadImg(obj){
		let file = obj.files[0];
		let imgObj = document.querySelector('#imgDiv>img');
		imgObj.src = URL.createObjectURL(file); //이미지 src의 url 생성
		document.querySelector('#imgDiv').style.display='';
	}
	
	//<c:if test = "${msg != null}">
	//	alert('${msg}');
	//</c:if>
</script>

</body>
</html>