<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/common/msg.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
</head>
<body>

	<h3>회원가입</h3>

	<form method="POST" action="/join" name="join_form" onsubmit="return isThereValue()"
		enctype="multipart/form-data">
		
		<div id="imgDiv" style="display: none">
			<!-- 프로필 이미지 미리보기 -->
			<img src="" style="border-radius: 40px" width="80px" height="80px">  
		</div>
		<label for="uiFilePath">프로필 이미지 : </label>
		<input type="file" name="uiFile" id="uiFile" onchange="loadImg(this)">
		
		<!-- 아이디 입력 -->
		<div>
			<label> 
				<input type="text" name="uiId" id="uiId" onkeyup="checkId(this)" placeholder="아이디">
			</label>
			<span class="uiId_ok" style="display: none">사용 가능한 아이디입니다.</span>
			<span class="uiId_already" style="display: none">이미 사용 중인 아이디입니다.</span>
			<div id="error_checkId">
				<!-- 경고 텍스트 -->
				<div class="checkId_false" style="display: none">틀림요</div>
			</div>
		</div>
		
		
		<!-- 비밀번호 입력 -->
		<div>
			<label> <input type="password" name="uiPassword" id="uiPassword" onkeyup="checkPwd()" placeholder="비밀번호">
			</label>
			<div id="error_checkPwd">
				<!-- 경고 텍스트 -->
			</div>
			
		</div>
		<!-- 비밀번호 확인 입력 -->
		<div>
			<label> <input type="password" name="uiPasswordSame" id="uiPasswordSame" onkeyup="checkPwdSame()" placeholder="비밀번호 확인">
			</label>
			<div id="error_checkPwdSame">
				<!-- 경고 텍스트 -->
			</div>
		</div>
		
		<!-- 닉네임 입력 -->
		<div>
			<label> <input type="text" name="uiNickname" id="uiNickname" onkeyup="checkNickName()" placeholder="닉네임"> 
			</label>
			<div id="error_checkNickName">
				<!-- 경고 텍스트 -->
			</div>
		</div>
		
		
		<!-- 이메일 입력 -->
		<div>
			<label> <input type="email" name="uiEmail" id="uiEmail" onkeyup="checkEmail()" placeholder="이메일"> </label>
			<select id="uiEmail_sel" onchange="change_email();">
			<!--onchage: select안에 있는 옵션들의 값이 바뀌면 명령이 실행-->
				<option value="1">직접입력</option>
				<option value="@naver.com">네이버</option>
				<option value="@gmail.com">지메일</option>
				<option value="@nate.com">네이트</option>
				<option value="@daum.net">다음</option>
			</select>
			<div id="error_checkEmail">
				<!-- 경고 텍스트 -->
			</div>
		</div>

		<button type="button" onclick="history.back();">이전페이지로</button>
		<button>가입하기</button>
	</form>
	
	<script src="${path}/resources/js/user/formCheck.js"></script>
	<script>
		
		function loadImg(obj) {
			let file = obj.files[0];
			let imgObj = document.querySelector('#imgDiv>img');
			imgObj.src = URL.createObjectURL(file); //이미지 src의 url 생성
			document.querySelector('#imgDiv').style.display = '';
		}

	</script>

</body>
</html>