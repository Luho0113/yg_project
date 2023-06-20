<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/common/msg.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>프로필 수정</title>
<!-- 스타일 -->
</head>
<body>
	<!-- header area -->
	<jsp:include page="../common/header.jsp"></jsp:include>

	<c:if test="${msg != null }">
		<script>
			alert("${msg}");
		</script>
	</c:if>

	<div class="content">
		<h3>프로필 수정</h3>

		<form method="POST" action="/myInfo-update" name="update_form"
			onsubmit="return formValidation()" enctype="multipart/form-data">
			<!-- 기존 프로필 사진 -->
			<div>
				<img src="${user.uiFilePath}" style="border-radius: 40px"
					width="80px" height="80px"
					onerror="this.src='https://ifh.cc/g/cDROLZ.png';" />
			</div>
			<!-- 선택한 프로필 사진 미리보기 -->
			<div id="imgPreview" style="display: none">
				<!-- 프로필 이미지 미리보기 -->
				<img src="" style="border-radius: 40px" width="80px" height="80px" />
			</div>
			<label for="uiFilePath">프로필 이미지 : </label> <input type="file"
				name="uiFile" id="uiFile" onchange="imgPreview(this)"
				value="${user.uiFile}" />

			<!-- 아이디 입력 -->
			<div>
				<label> <input type="text" name="uiId" id="uiId"
					value="${user.uiId}" onkeyup="return checkId(this)"
					readonly="readonly" />
				</label>
			</div>

			<!-- 비밀번호 입력 -->
			<div>
				<label> <input type="password" name="uiPassword"
					id="uiPassword" onkeyup="return checkPwd()" placeholder="비밀번호" />
				</label>
				<div id="error_checkPwd">
					<!-- 경고 텍스트 -->
				</div>
			</div>
			<!-- 비밀번호 확인 입력 -->
			<div>
				<label> <input type="password" name="uiPasswordSame"
					id="uiPasswordSame" value="${user.uiPassword}"
					onkeyup="return checkPwdSame()" placeholder="비밀번호 확인" />
				</label>
				<div id="error_checkPwdSame">
					<!-- 경고 텍스트 -->
				</div>
			</div>

			<!-- 닉네임 입력 -->
			<div>
				<label> <input type="text" name="uiNickname" id="uiNickname"
					value="${user.uiNickname}" onkeyup="return checkNickName()"
					placeholder="닉네임" />
				</label>
				<div id="error_checkNickName">
					<!-- 경고 텍스트 -->
				</div>
			</div>

			<!-- 이메일 입력 -->
			<div>
				<label> <input type="email" name="uiEmail" id="uiEmail"
					value="${user.uiEmail}" onkeyup="return checkEmail()" placeholder="이메일" />
				</label> <select id="uiEmail_sel" onchange="change_email();">
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
			<button>수정하기</button>
		</form>

		<button onclick="location.href='/user/delete'">탈퇴하기</button>
	</div>

	<!-- footer area -->
	<jsp:include page="../common/footer.jsp"></jsp:include>

	<!-- javascript -->
	<script src="${path}/resources/js/user/formCheck.js"></script>
	<script type="text/javascript">
		function imgPreview(obj) {
			let file = obj.files[0];
			let imgObj = document.querySelector("#imgPreview>img");
			imgObj.src = URL.createObjectURL(file); //이미지 src의 url 생성
			document.querySelector("#imgPreview").style.display = "";
		}
	</script>
</body>
</html>
