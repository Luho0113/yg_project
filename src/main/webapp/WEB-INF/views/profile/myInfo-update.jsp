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

		<form method="POST" action="/myInfo-update" name="join_form"
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
			<label for="uiFilePath">프로필 이미지 : </label> 
			<input type="file"
				name="uiFile" id="uiFile" onchange="imgPreview(this)"
				value="${user.uiFile}" />

			<!-- 아이디 입력 -->
			<div>
				<label> <input type="text" name="uiId" id="uiId"
					value="${user.uiId}" onkeyup="return checkId(this)"
					readonly="readonly" />
				</label>
			</div>
			
			<!-- 닉네임 입력 -->
			<div>
				<label> <input type="text" name="uiNickname" id="uiNickname"
					value="${user.uiNickname}" onkeyup="return checkNickName()"
					placeholder="닉네임" />
				</label>
				<c:if test="${msg == 'uiNickname exist'}">
            		<span class="error_fail"> 이미 사용 중인 닉네임입니다. </span>
          		</c:if>
				<div id="error_checkNickName">
					<!-- 경고 텍스트 -->
				</div>
			</div>
			
			<!-- 기존비밀번호 -->
			<div>
				<label> 
					<input type="password" value="${user.uiPassword}" disabled/>
				</label>
			</div>
			<!-- 비밀번호 입력 -->
			<div>
				<label> <input type="password" name="uiPassword"
					id="uiPassword" onkeyup="return checkPwd()" placeholder="새 비밀번호" />
				</label>
				<div id="error_checkPwd">
					<!-- 경고 텍스트 -->
				</div>
			</div>
			<!-- 비밀번호 확인 입력 -->
			<div>
				<label> <input type="password" name="uiPasswordSame"
					id="uiPasswordSame" 
					onkeyup="return checkPwdSame()" placeholder="비밀번호 확인" />
				</label>
				<div id="error_checkPwdSame">
					<!-- 경고 텍스트 -->
				</div>
			</div>

			

			<!-- 이메일 입력 -->
			<div>
				<label> <input type="email" name="uiEmail" id="uiEmail"
					value="${user.uiEmail}" onkeyup="return checkEmail()" placeholder="이메일" />
				</label>
				<div id="error_checkEmail">
					<!-- 경고 텍스트 -->
				</div>
			</div>

			<button type="button" onclick="history.back();">취소</button>
			<button>수정하기</button>
		</form>

		<button onclick="deleteCheck()">탈퇴하기</button>
	</div>

	<!-- footer area -->
	<jsp:include page="../common/footer.jsp"></jsp:include>


	<!-- javascript -->
    <script src="${path}/resources/js/user/formCheck.js"></script>
	<script>
		function imgPreview(obj) {
			let file = obj.files[0];
			let imgObj = document.querySelector("#imgPreview>img");
			imgObj.src = URL.createObjectURL(file); //이미지 src의 url 생성
			document.querySelector("#imgPreview").style.display = "";
		}
		
		function deleteCheck(){
			if(!confirm("정말 탈퇴하시겠습니까?")){
				return false;
			} else {
				location.href='/user/delete';
			}
		}
	</script>
</body>
</html>
