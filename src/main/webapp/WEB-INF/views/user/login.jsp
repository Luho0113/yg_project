<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>로그인</title>
<!-- 스타일 -->
<link rel="stylesheet" href="${path}/resources/css/common/button.css" />
<link rel="stylesheet" href="${path}/resources/css/user/login.css" />
</head>
<body>
	<!-- header area -->
	<jsp:include page="../common/header.jsp"></jsp:include>

	<!-- content area -->
	<div class="content">
		<h3>로그인</h3>
		<!-- 로그인 -->
		<form method="POST" action="/login" name="login_form">
			<!-- 아이디 입력 -->
			<div class="input-wrap">
				<label> <input class="input" type="text" name="uiId"
					id="uiId" placeholder=" 아이디" />
				</label>
			</div>

			<!-- 비밀번호 입력 -->
			<div class="input-wrap">
				<label> <input class="input" type="password"
					name="uiPassword" id="uiPassword" placeholder=" 비밀번호" />
				</label>
			</div>

			<!-- 경고 메세지 -->
			<div class="error_message-wrap">
				<span class="error-message" style="display: none"> 아이디와 비밀번호를
					입력해주세요. </span>
				<c:if test="${msg != null}">
					<span class="error-fail"> 아이디나 비밀번호가 틀렸습니다. </span>
				</c:if>
			</div>
			
			

			<!-- 로그인 버튼 -->
			<div class="button-login">
				<button class="button-custom btnOrange" onclick="loginCheck()">
					<span>로그인</span>
				</button>
			</div>
			
			<!-- 아이디 저장하기 -->
			<div class="check-id">
				<input type="checkbox" id="checkId" name="checkId"> 
				<label for="checkId"></label> 아이디 저장
			</div>
			
			<!-- 회원가입 링크 -->
			<div class="to-join">
				<a href="/join">아직 영감이 아니신가요? 가입하기</a>
			</div>
		</form>
	</div>

	<!-- footer area -->
	<jsp:include page="../common/footer.jsp"></jsp:include>

	<!-- javascript -->
	<script src="${path}/resources/js/user/loginCheck.js"></script>
	<script>
		window.onload = function() {

			// 저장된 쿠키값을 가져와서 uiId input에 넣어줌 (쿠키값 없으면 공백)
			var userLoginId = getCookie("userLoginId");
			document.getElementById("uiId").value = userLoginId;

			// uiId가 있는경우 아이디 저장 체크박스 체크
			if (document.getElementById("uiId").value != "") {
				document.getElementById("checkId").checked = true;
			}

			// 아이디 저장하기 체크박스 onchange
			var checkId = document.getElementById("checkId");

			checkId.onchange = function(event) {
				if (checkId.checked) { //checked true
					var userLoginId = document.getElementById("uiId").value;
					setCookie("userLoginId", userLoginId, 30); // 30일 동안 쿠키 보관
				} else { //checked false
					deleteCookie("userLoginId");
				}
			};

			// 아이디 저장하기가  눌린상태에서, uiId를 입력한 경우
			var idInput = document.getElementById("uiId");

			idInput.addEventListener("keyup", function(e) {
				if (checkId.checked) { //checked true
					var userLoginId = document.getElementById("uiId").value;
					setCookie("userLoginId", userLoginId, 30); // 30일 동안 쿠키 보관
				}
			})
		}
		
		//쿠키 생성, 삭제, 가져오기
		function setCookie(cookieName, value, exdays) {
			var exdate = new Date();
			exdate.setDate(exdate.getDate() + exdays);
			var cookieValue = escape(value)
					+ ((exdays == null) ? "" : "; expires="
							+ exdate.toGMTString());
			document.cookie = cookieName + "=" + cookieValue;
		}

		function deleteCookie(cookieName) {
			var expireDate = new Date();
			expireDate.setDate(expireDate.getDate() - 1);
			document.cookie = cookieName + "= " + "; expires="
					+ expireDate.toGMTString();
		}

		function getCookie(cookieName) {
			cookieName = cookieName + '=';
			var cookieData = document.cookie;
			var start = cookieData.indexOf(cookieName);
			var cookieValue = '';
			if (start != -1) {
				start += cookieName.length;
				var end = cookieData.indexOf(';', start);
				if (end == -1)
					end = cookieData.length;
				cookieValue = cookieData.substring(start, end);
			}
			return unescape(cookieValue);
		}
	</script>
</body>
</html>
