/* 회원가입 유효성 검사 */

//아이디 중복 체크 메세지 표시
function checkId(obj) {
	if (obj.value.length < 6) {
		return;
	}
	$.get({
		url: '/check-id',
		data: { uiId: obj.value },
		success: function(res) {
			if (res) {
				$('.uiId_already').css('display', '');
				$('.uiId_ok').css('display', 'none');
			} else {
				$('.uiId_already').css('display', 'none');
				$('.uiId_ok').css('display', '');
			}
			console.log(res);
		}
	})
};




//정규 표현식
const REG_ID = /^[a-zA-Z]{1}(?=.*?[A-Z])(?=.*?[0-9])(?=.*?[_]).{6,20}$/; //반드시 영어로 시작, 영문숫자 포함, _ 가능, 6~20자리
const REG_NICKNAME = /^[가-힣a-zA-Z0-9].{2,16}$/; //영문대소, 한글, 숫자 허용
const REG_PASSWORD = /^(?=.*?[a-zA-Z])(?=.*?[0-9])(?=.*?[!@#$&*%_]).{8,20}$/; //영문대소, 숫자, 특수문자 조합
const RE_EMAIL = /^[_a-zA-Z0-9-]+(\.[_a-zA-Z0-9-]+)*@(?:\w+\.)+\w+$/;


//변수 설정
const uiId = document.querySelector('#uiId');
const uiNickname = document.querySelector('#uiNickname');
const uiPassword = document.querySelector('#uiPassword');
const uiPasswordSame = document.querySelector('#uiPasswordSame');
const uiEmail = document.querySelector('#uiEmail');


//회원가입 유효성 검사
function checkValue() {

	if (uiId.value == "") {
		alert('아이디를 입력해주세요.');
		uiId.value = '';
		uiId.focus();
		return false;
	}
	if (uiPassword.value == "") {
		alert('비밀번호를 입력해주세요.');
		uiPassword.value = '';
		uiPassword.focus();
		return false;
	}
	if (uiPasswordSame.value == "") {
		alert('비밀번호 확인을 입력해주세요.');
		uiPasswordSame.value = '';
		uiPasswordSame.focus();
		return false;
	}
	if (uiNickname.value == "") {
		alert('닉네임을 입력해주세요.');
		uiNickname.value = '';
		uiNickname.focus();
		return false;
	}
	if (uiEmail.value == "") {
		alert('이메일 주소를 적어주세요.');
		uiEmail.value = '';
		uiEmail.focus();
		return false;
	}
	
	
	
	if (!REG_PASSWORD.test(uiPassword.value)) {
		alert('비밀번호는 영어 대소문자, 숫자, 특수문자(!@#$&*%)조합으로 8~20자리만 사용해야 합니다.');
		uiPassword.value = '';
		uiPassword.focus() = '';
		return false;
	}

	if (uiPasswordSame.value !== uiPassword.value) {
		alert('비밀번호가 일치하지 않습니다.');
		uiPasswordSame.value = '';
		uiPasswordSame.focus();
		return false;
	}

	if (!RE_EMAIL.test(uiEmail.value)) {
		alert("이메일 형식이 올바르지 않습니다.");
		return false;
	}

	return true;
}



//이름 유효성 검사
function checkNickName() {
	var obj = document.join_form;
	if (obj.uiNickname.value.length < 2 || obj.uiNickname.value.length > 16) {
		uiNickname.focus();
		document.getElementById("alert_checkNickName").innerHTML = ('<span style="color:red;"> 이름형식틀림</span>');
		return false;
	} else if (!REG_NICKNAME.test(uiNickname.value)) {
		uiNickname.focus();
		document.getElementById("alert_checkNickName").innerHTML = ('<span style="color:red;"> 이름형식틀림</span>');
		return false;
	} else {
		document.getElementById("alert_checkNickName").innerHTML = ('<span style="color:green;"> 이름형식맞음</span>');
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