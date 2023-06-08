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
		<img src="" width="300" onerror="noImage()">
	</div>
	<label for="uiFilePath">프로필 이미지 : </label>
	<input type="file" name="uiFile" id="uiFile" onchange="loadImg(this)"> <br>
	이름 : <input type="text" name="uiName" id="uiName"> <br>
	아이디 : <input type="text" name="uiId" id="uiId"> <br>
	닉네임 : <input type="text" name="uiNickname" id="uiNickname"> <br>
	비밀번호 : <input type="password" name="uiPassword" id="uiPassword"> <br>
	비밀번호 확인 : <input type="password" name="uiPasswordCheck" id="uiPasswordCheck"> <br>
	이메일 : <input type="email" name="uiEmail" id="uiEmail"> <br>
	<button>가입하기</button>
</form>

<script>

	function noImage(){
		$("img").attr("src", "https://ifh.cc/g/cDROLZ.png"); //대체 이미지
	}
	
	function checkValue(){
		
		const uiName = document.querySelector('#uiName');
		const uiId = document.querySelector('#uiId');
		const uiNickname = document.querySelector('#uiNickname');
		const uiPassword = document.querySelector('#uiPassword');
		const uiPasswordCheck = document.querySelector('#uiPasswordCheck');
		const uiEmail = document.querySelector('#uiEmail');
		const REG_PASSWORD = /(?=.*\d{1,50})(?=.*[!@#$&*%]{1,50})(?=.*[a-zA-Z]{2,50}).{8,20}$/;
		const RE_EMAIL = /^[_a-zA-Z0-9-]+(\.[_a-zA-Z0-9-]+)*@(?:\w+\.)+\w+$/;
		
		if (uiName.value.trim().length < 0) {
			alert('이름을 입력해주세요.');
			uiName.value = '';
			uiName.focus();
			return false;
		} else if (uiId.value.trim().length < 0) {
			alert('아이디를 입력해주세요.');
			uiId.value = '';
			uiId.focus();
			return false;
		} else if (uiPassword.value.trim().length < 0) {
			alert('비밀번호를 입력해주세요.');
			uiPassword.value = '';
			uiPassword.focus();
			return false;
		} else if (uiPasswordCheck.value.trim().length < 0) {
			alert('비밀번호 확인을 입력해주세요.');
			uiPasswordCheck.value = '';
			uiPasswordCheck.focus();
			return false;
		} else if (uiNickname.value.trim().length < 0) {
			alert('닉네임을 입력해주세요.');
			uiNickname.value = '';
			uiNickname.focus();
			return false;
		} else if (uiEmail.value.trim().length < 0) {
			alert('이메일을 적어주세요.');
			uiEmail.value = '';
			uiEmail.focus();
			return false;
		} else if (uiFilePath==null){
			alert('프로필 사진을 저장해주세요.');
			return false;
		}
		
		
		if(uiPassword.value.trim().length < 8 || uiPassword.value.trim().length >20){
			alert('비밀번호를 8이상 20자 이내로 입력해주세요.');
			uiPassword.value = '';
			uiPassword.focus() = '';
			return false;
		} else if(!REG_PASSSWORD.test(uiPassword.value)){
			alert('특수문자는 !@#$&*%만 사용가능합니다.');
			uiPassword.value = '';
			uiPassword.focus() = '';
			return false;
		}
		
		if (uiPasswordCheck.value != uiPassword.value) {
			alert('비밀번호가 일치하지 않습니다.');
			uiPasswordCheck.value = '';
			uiPasswordCheck.focus();
			return false;
		}
		
		
		
		if(!RE_EMAIL.test(uiEmail.value)){
			alert("이메일 형식이 올바르지 않습니다.");
			return false;
		}
		
		return true;
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