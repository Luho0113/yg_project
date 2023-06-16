<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/common/msg.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로필 수정</title>
<!-- 스타일 -->
<link rel="stylesheet" href="${path}/resources/css/common/page.css">
<link rel="stylesheet" href="${path}/resources/css/common/header.css">
</head>
<body>
	<!-- header area -->
	<jsp:include page="../common/header.jsp"></jsp:include>
	<h3>프로필 수정</h3>

	<c:if test="${msg != null }">
		<script>
			alert('${msg}');
		</script>
	</c:if>

	<h3>회원정보수정</h3>
	<form method="POST" action="/myInfo-update" onsubmit="return checkValue()" enctype="multipart/form-data">
		
		<!-- 기존 프로필 사진 -->
		<div>
			<img src="${user.uiFilePath}" style="border-radius: 40px" width="80px" height="80px" 
			onerror="this.src='https://ifh.cc/g/cDROLZ.png';">
		</div>
		<!-- 선택한 프로필 사진 미리보기 -->
		<div id="imgPreview" style="display: none">
			<img src="" width="300" onerror="this.src='https://ifh.cc/g/cDROLZ.png';">  
		</div>
		<label for="uiFilePath">프로필 이미지 : </label>
		<input type="file" name="uiFile" id="uiFile" onchange="imgPreview(this)" value="${user.uiFilePath}">
		
		<div>
			<label> 닉네임 : <input type="text" name="uiNickname" id="uiNickname" value="${user.uiNickname}"> </label>
		</div>
		<div>
			<label> 비밀번호 : <input type="password" name="uiPassword" id="uiPassword" value="${user.uiPassword}">
			</label>
		</div>
		<div>
			<label> 비밀번호 확인 : <input type="password" name="uiPasswordCheck" id="uiPasswordCheck" >
			</label>
		</div>

		<div>
			<label> 이메일 <input type="email" name="uiEmail" id="uiEmail" value="${user.uiEmail}"> </label>
			<select id="uiEmail_sel" onchange="change_email();" >
			<!--onchage: select안에 있는 옵션들의 값이 바뀌면 명령이 실행-->
				<option value="1">직접입력</option>
				<option value="@naver.com">네이버</option>
				<option value="@gmail.com">지메일</option>
				<option value="@nate.com">네이트</option>
				<option value="@daum.net">다음</option>
			</select>
		</div>
		
		
		<button>수정하기</button>
	</form>
	<button onclick="location.href='/user/delete'">탈퇴하기</button>
	
	<!-- footer area -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
	
	<!-- javascript -->
	<script src="${path}/resources/js/user/formCheck.js"></script>
	<script type="text/javascript">
		
		function imgPreview(obj) {
			let file = obj.files[0];
			let imgObj = document.querySelector('#imgPreview>img');
			imgObj.src = URL.createObjectURL(file); //이미지 src의 url 생성
			document.querySelector('#imgPreview').style.display = '';
		}
		
	</script>
	
</body>
</html>