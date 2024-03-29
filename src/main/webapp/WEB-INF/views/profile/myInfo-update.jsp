<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/common/error-user.jsp" %>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>프로필 수정</title>
<!-- 스타일 -->
<link rel="stylesheet" href="${path}/resources/css/common/button.css" />
<link rel="stylesheet" href="${path}/resources/css/common/header.css" />
<link rel="stylesheet"
	href="${path}/resources/css/profile/myInfo-update.css" />
<link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
      integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
/>
</head>
<body>
	<!-- header area -->
	<jsp:include page="../common/header.jsp"></jsp:include>

	<div class="content">
		<h3>프로필 관리</h3>
		<!-- 수정 영역 -->

		<!-- 프로필 사진 변경-->
		<div class="form-img-wrap">
			<div class="form-img">
				<form method="POST" action="/myInfo-update" name="update_form"
					enctype="multipart/form-data">
					<div class="img-choose">
						<label for="uiFile"> 
							<!-- 기존 프로필 이미지  --> 
							<img id="profileImg" src="${user.uiFilePath}" class="profile-image" onerror="this.src='${path}/resources/images/yg_profile.png';">
							<div class="hover-text">
								사진 선택
							</div> 
							<!-- 선택한 프로필 사진 미리보기 -->
							<div id="imgPreview" style="display: none">
								<!-- 프로필 이미지 미리보기 -->
								<img src="" class="profile-image" />
								<div class="hover-text">
									사진 선택
								</div>  
							</div>
							
						</label>
					</div>
					<div class="img-input">
						<input type="file" name="uiFile" id="uiFile"
						onchange="imgPreview(this)" value="${user.uiFile}" />
					</div>
					<div class="button-img-update">
						<button class="button-custom btnToOrange">변경</button>
					</div>
				</form>
			</div>

		</div>
		
		

		<div class="form-all-wrap">
			<!-- 기존 닉네임과 이이디 -->
			<div class="myInfo">
				<h4>${user.uiNickname}</h4>
				<p>@${user.uiId}</p>
			</div>
			
			<!-- 닉네임 변경하기 -->
			<div class="form-nickname-wrap">
				<h5>
					별명 관리
				</h5>
				<div class="form-nickname">
					<form method="POST" action="/myInfo-updateN" name="update_form"
						onsubmit="return updateNickname()">
						<!-- 닉네임 입력 -->
						<label> <input class="input" type="text" name="uiNickname"
							id="uiNickname" onkeyup="return checkNickname()"
							placeholder=" 새 닉네임" maxlength="16"/>
						</label>
						<div class="button-nickname-update">
							<button class="button-custom btnToOrange ">수정</button>
						</div>
					</form>
				</div>
				<c:if test="${msg == 'uiNickname exist'}">
					<span class="error_fail"> 이미 사용 중인 닉네임입니다. </span>
				</c:if>
				<div class="update-error-text" id="error-checkNickname">
					<!-- 경고 텍스트 -->
				</div>
			</div>

			<!-- 비밀번호 변경하기 -->
			<div class="form-password-wrap">
				<!-- 기존비밀번호 -->
				<h5>
					비밀번호 관리
				</h5>
				<!-- 기존 비밀번호 : ${user.uiPassword} -->
				<div class="form-password">
					<form method="POST" action="/myInfo-updateP" name="update_form"
						onsubmit="return updatePassword()">
						<!-- 비밀번호 입력 -->

						<label> <input class="input" type="password"
							name="uiPassword" id="uiPassword" onkeyup="return checkPwd()"
							placeholder=" 새 비밀번호" maxlength="20"/>
						</label>

						<!-- 비밀번호 확인 입력 -->

						<label> <input class="input" type="password"
							name="uiPasswordSame" id="uiPasswordSame"
							onkeyup="return checkPwdSame()" placeholder=" 비밀번호 확인" maxlength="20"/>
						</label>

						<div class="button-pwd-update">
							<button class="button-custom btnToOrange">수정</button>
						</div>
					</form>
					<div class="update-error-text" id="error-checkPwd">
						<!-- 경고 텍스트 -->
					</div>
					<div class="update-error-text" id="error-checkPwdSame">
						<!-- 경고 텍스트 -->
					</div>
				</div>
			</div>

			<!-- 이메일 변경하기 -->
			<div class="form-email-wrap">
				<h5>
					이메일 관리
				</h5>
				<div class="form-email">
					<form method="POST" action="/myInfo-updateE" name="update_form"
						onsubmit="return updateEmail()">
						<!-- 이메일 입력 -->

						<label> <input class="input" type="email" name="uiEmail"
							id="uiEmail" value="${user.uiEmail}"
							onkeyup="return checkEmail()" placeholder=" 이메일" />
						</label>

						<div class="button-email-update">
							<button class="button-custom btnToOrange">수정</button>
						</div>
					</form>
				</div>
				<div class="update-error-text" id="error-checkEmail">
					<!-- 경고 텍스트 -->
				</div>
			</div>
		</div>

		<div class="button-etc-wrap">
			<div class="button-back">
				<button class="button-custom btnFromBlack" type="button"
					onclick="history.back();">취소</button>
			</div>
			<div class="button-delete">
				<button class="button-custom btnFromBlack" onclick="deleteCheck()">
					탈퇴하기</button>
			</div>
		</div>


	</div>
	<!-- end content -->

	<!-- footer area -->
	<jsp:include page="../common/footer.jsp"></jsp:include>

	<!-- javascript -->
	<script src="${path}/resources/js/user/updateCheck.js"></script>

</body>
</html>
