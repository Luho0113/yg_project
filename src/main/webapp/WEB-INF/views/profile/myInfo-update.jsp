<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

	<div class="content">
		<h3>프로필 수정</h3>

		<!-- 아이디 입력 -->
		<div>
				<p> 아이디 : ${user.uiId} </p>
		</div>

		<form method="POST" action="/myInfo-update" name="update_form"
			onsubmit="return updateValidation()" enctype="multipart/form-data">
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


			<button>수정하기</button>
		</form>
		<div>
			<button type="button" onclick="history.back();">취소</button>
			<button onclick="deleteCheck()">탈퇴하기</button>
		</div>


		<!-- 수정 변경중~~~~~~~~ -->

		<form method="POST" action="/myInfo-updateN" name="update_form"
			onsubmit="return updateNickname()">
			<!-- 닉네임 입력 -->
			<div>
				<!-- 기존 닉네임 -->
				<p>닉네임 : ${user.uiNickname} </p>
				<label> <input type="text" name="uiNickname"
					id="uiNickname" onkeyup="return checkNickName()"
					placeholder="새 닉네임" />
				</label>
				<c:if test="${msg == 'uiNickname exist'}">
					<span class="error_fail"> 이미 사용 중인 닉네임입니다. </span>
				</c:if>
				<div id="error-checkNickName">
					<!-- 경고 텍스트 -->
				</div>
			</div>
			<button>수정하기</button>
		</form>

		<form method="POST" action="/myInfo-updateP" name="update_form"
			onsubmit="return updatePassword()">
			<!-- 기존비밀번호 -->
			<div>
				<p>기존 비밀번호 : ${user.uiPassword}</p>
			</div>
			<!-- 비밀번호 입력 -->
			<div>
				<label> <input type="password" name="uiPassword"
					id="uiPassword" onkeyup="return checkPwd()" placeholder="새 비밀번호" />
				</label>
				<div id="error-checkPwd">
					<!-- 경고 텍스트 -->
				</div>
			</div>
			<!-- 비밀번호 확인 입력 -->
			<div>
				<label> <input type="password" name="uiPasswordSame"
					id="uiPasswordSame" onkeyup="return checkPwdSame()"
					placeholder="비밀번호 확인" />
				</label>
				<div id="error-checkPwdSame">
					<!-- 경고 텍스트 -->
				</div>
			</div>
			<button>수정하기</button>
		</form>


		<form method="POST" action="/myInfo-updateE" name="update_form"
			onsubmit="return updateEmail()">
			<!-- 이메일 입력 -->
			<div>
				<label> <input type="email" name="uiEmail" id="uiEmail"
					value="${user.uiEmail}" onkeyup="return checkEmail()"
					placeholder="이메일" />
				</label>
				<div id="error-checkEmail">
					<!-- 경고 텍스트 -->
				</div>
			</div>
			<button>수정하기</button>
		</form>

	</div>






	<!-- footer area -->
	<jsp:include page="../common/footer.jsp"></jsp:include>

	<!-- javascript -->
	<script src="${path}/resources/js/user/updateCheck.js"></script>
	<script>
		function imgPreview(obj) {
			let file = obj.files[0];
			let imgObj = document.querySelector("#imgPreview>img");
			imgObj.src = URL.createObjectURL(file); //이미지 src의 url 생성
			document.querySelector("#imgPreview").style.display = "";
		}

		function deleteCheck() {
			if (!confirm("정말 탈퇴하시겠습니까?")) {
				return false;
			} else {
				location.href = "/user/delete";
			}
		}
	</script>
</body>
</html>
