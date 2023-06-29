/* 로그인 유효성 검사 */

/* 페이지 로딩을 막아줌 */
function onloginSubmit(event) {
	event.preventDefault();
}

function loginCheck() {
	var login_form = document.login_form;

	const uiId = document.querySelector("#uiId");
	const uiPassword = document.querySelector("#uiPassword");
	const error_message = document.querySelector(".error-message");

	/*아이디나 비밀번호가 비어있는 경우*/
	if (uiId.value == "" || uiPassword.value == "") {
		error_message.style.display = "block";
		uiId.focus();
		login_form.addEventListener("submit", onloginSubmit);
		return false;
	} else {
		error_message.style.display = "none";
	}
	login_form.submit(); /* 로그인이 성공하면 submit 실행 */
	return true;
}


//아이디 저장하기
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