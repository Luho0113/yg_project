/* 로그인 유효성 검사 */

/* 페이지 로딩을 막아줌 */
function onloginSubmit(event) {
	event.preventDefault();
}

function loginCheck() {
	var login_form = document.login_form;

	const uiId = document.querySelector('#uiId');
	const uiPassword = document.querySelector('#uiPassword');
	const error_message = document.querySelector('.error_message');


	if (uiId.value == "" || uiPassword.value == "") {
		error_message.style.display = 'block';
		uiId.focus();
		login_form.addEventListener('submit', onloginSubmit);
		return false;
	}
	login_form.submit(); /* 로그인이 성공하면 submit 실행 */
	return true;
}


