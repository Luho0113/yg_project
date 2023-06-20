/*
	회원가입 유효성 검사
	맞으면 경고 텍스트가 생기지 않음, 틀리면 경고 텍스트가 생김
*/

//정규 표현식
//^[a-zA-Z0-9] : 또는
//(?=.*?[a-zA-Z0-9]) : 반드시 조건에 포함
const REG_ID = /^[a-zA-Z0-9_].{6,20}$/; //6~20자 이내의 영문자, 숫자, 특수기호(_)
const REG_NICKNAME = /^[가-힣a-zA-Z0-9].{1,16}$/; //영문대소, 한글, 숫자 허용
const REG_PASSWORD = /^(?=.*?[a-zA-Z])(?=.*?[0-9])(?=.*?[!@#*%_]).{8,20}$/; //8~20자 이내의 영문자, 숫자, 특수기호(!@#*%_)
const RE_EMAIL = /^[_a-zA-Z0-9-]+(\.[_a-zA-Z0-9-]+)*@(?:\w+\.)+\w+$/;


//변수 설정
const uiId = document.querySelector('#uiId');
const uiNickname = document.querySelector('#uiNickname');
const uiPassword = document.querySelector('#uiPassword');
const uiPasswordSame = document.querySelector('#uiPasswordSame');
const uiEmail = document.querySelector('#uiEmail');


//아이디 유효성 검사
function checkId() {
	
	if (!REG_ID.test(uiId.value)) {
		uiId.focus();
		document.getElementById("error_checkId").innerHTML = ('<span style="color:red;"> 6글자 이상의 영문자, 숫자, 특수기호(_)만 사용가능합니다.</span>');
		return false;
	} else if (uiId.value.length > 20) {
		uiId.focus();
		document.getElementById("error_checkId").innerHTML = ('<span style="color:red;"> 20자 이내로 입력해주세요.</span>');
		return false;
	} else {
		document.getElementById("error_checkId").innerHTML = ('');
	}
	return true;

}


//비밀번호 유효성 검사
function checkPwd() {

	if (!REG_ID.test(uiPassword.value)) {
		uiPassword.focus();
		document.getElementById("error_checkPwd").innerHTML = ('<span style="color:red;"> 8글자 이상의 영문자, 숫자, 특수기호(!@#*%_)를 포함해주세요.</span>');
		return false;
	} else if (uiPassword.value.length > 20) {
		uiPassword.focus();
		document.getElementById("error_checkPwd").innerHTML = ('<span style="color:red;"> 20자 이내로 입력해주세요.</span>');
		return false;
	} else {
		document.getElementById("error_checkPwd").innerHTML = ('');
	}
	return true;
}

function checkPwdSame() {
	
	if (uiPassword.value != uiPasswordSame.value) {
		uiPasswordSame.focus();
		document.getElementById("error_checkPwdSame").innerHTML = ('<span style="color:red;"> 동일한 비밀번호를 입력해주세요. </span>');
		return false;
	} else {
		document.getElementById("error_checkPwdSame").innerHTML = ('');
	}
	return true;
}


//닉네임 유효성 검사
function checkNickName() {
	
	if (uiNickname.value.length > 16) {
		uiNickname.focus();
		document.getElementById("error_checkNickName").innerHTML = ('<span style="color:red;"> 16자 이내로 입력해주세요.</span>');
		return false;
	} if (!REG_NICKNAME.test(uiNickname.value)) {
		uiNickname.focus();
		document.getElementById("error_checkNickName").innerHTML = ('<span style="color:red;">2글자 이상의 한글, 영문자, 숫자만 사용가능합니다.</span>');
		return false;
	} else {
		document.getElementById("error_checkNickName").innerHTML = ('');
	}

	return true;
}



//이메일 옵션 선택후 주소 자동 완성
function change_email() {
	
	var uiEmail = document.getElementById("uiEmail");
	var uiEmail_sel = document.getElementById("uiEmail_sel"); //도메인 선택

	//지금 골라진 옵션의 순서와 value 구하기
	var idx = uiEmail_sel.options.selectedIndex;
	var val = uiEmail_sel.options[idx].value;

	if (val == '1') {
		uiEmail.value = ''; //초기화
	} else {
		uiEmail.value = '';
		uiEmail.value = uiEmail.value + val;
	}
}

//아이디 중복 체크 메세지 표시
function checkId(obj) {

	if (obj.value.length < 6) {
		if (!REG_ID.test(uiId.value)) {
				uiId.focus();
				document.getElementById("error_checkId").innerHTML = ('<span style="color:red;"> 6글자 이상의 영문자, 숫자, 특수기호(_)만 사용가능합니다.</span>');
				return false;
		}else {
			document.getElementById("error_checkId").innerHTML = ('');
		}
		return;
	}
	$.get({
		url: '/check-id',
		data: { uiId: obj.value },
		success: function(res) {

			if (!REG_ID.test(uiId.value)) {
				uiId.focus();
				document.getElementById("error_checkId").innerHTML = ('<span style="color:red;"> 6글자 이상의 영문자, 숫자, 특수기호(_)만 사용가능합니다.</span>');
				return false;
			} else if (uiId.value.length > 20) {
				uiId.focus();
				document.getElementById("error_checkId").innerHTML = ('<span style="color:red;"> 20자 이내로 입력해주세요.</span>');
				return false;
			} else {
				document.getElementById("error_checkId").innerHTML = ('');
			}
			
			if (res) {
				$('.uiId_already').css('display', '');
				$('.uiId_ok').css('display', 'none');
				document.getElementById("error_checkId").innerHTML = ('');
			} else {
				$('.uiId_already').css('display', 'none');
				$('.uiId_ok').css('display', '');
				document.getElementById("error_checkId").innerHTML = ('');
			}
			
			return true;
		}
	})


};


//필수 입력값이 비어있으면 제출 X
function isThereValue() {

	if (uiId.value.trim() == '') {
		uiId.focus();
		document.getElementById("error_checkId").innerHTML = ('<span style="color:red;"> 아이디를 입력해주세요.</span>');
		return false;
	} 
	if (uiPassword.value.trim() == '') {
		uiPassword.focus();
		document.getElementById("error_checkPwd").innerHTML = ('<span style="color:red;"> 비밀번호를 입력해주세요.</span>');
		return false;
	}
	if (uiPasswordSame.value.trim() == '') {
		uiPasswordSame.focus();
		document.getElementById("error_checkPwdSame").innerHTML = ('<span style="color:red;"> 비밀번호를 한 번 더 확인해주세요.</span>');
		return false;
	}
	if (uiNickname.value.trim() == '') {
		uiNickname.focus();
		document.getElementById("error_checkNickName").innerHTML = ('<span style="color:red;"> 닉네임을 입력해주세요.</span>');
		return false;
	}
	if(uiEmail.value.trim() == ''){
		uiEmail.focus();
		document.getElementById("error_checkEmail").innerHTML = ('<span style="color:red;"> 이메일을 입력해주세요.</span>');
	}
	return true;
}
