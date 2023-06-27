/* 페이지 로딩을 막아줌 */
function onUpdateSubmit(event) {
  event.preventDefault();
}

//정규 표현식
//아이디 : 6~20자 이내의 영문자, 숫자 조합, 특수기호(_) 허용
const REG_ID = /^(?=.*[a-zA-Z])(?=.*[a-zA-Z\d]).{6,20}$/; 
//닉네임 : 영문대소, 한글, 숫자 허용
const REG_NICKNAME = /^[가-힣a-zA-Z0-9]{1,16}$/; 
//비밀번호 : 8~20자 이내의 영문자, 숫자, 특수기호(!@#*%_) 모두 조합
const REG_PASSWORD = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z])(?=.*[\!\@\#\*\%\_]).{8,20}$/; 
const REG_EMAIL = /^[_a-zA-Z0-9-]+(\.[_a-zA-Z0-9-]+)*@(?:\w+\.)+\w+$/;

//변수 설정
const uiId = document.querySelector("#uiId");
const uiNickname = document.querySelector("#uiNickname");
const uiPassword = document.querySelector("#uiPassword");
const uiPasswordSame = document.querySelector("#uiPasswordSame");
const uiEmail = document.querySelector("#uiEmail");

const uiNicknameSame = document.querySelector("#uiNicknameSame");

//수정 유효성 검사
//필수 입력값이 비어있으면 제출 X
function updateValidation() {
  update_form.submit(); /* 수정이 성공하면 submit 실행 */

  /* location.href = '/myInfo'; */
  return true;
}

//수정하기
//닉네임 변경
function updateNickname() {
  //닉네임 확인
  if (uiNickname.value.trim() == "") {
    uiNickname.focus();
    document.getElementById("error-checkNickname").innerHTML =
      "<span> 닉네임을 입력해주세요.</span>";
    return false;
  } else if (!checkNickname()) {
    uiNickname.focus();
    return false;
  }
  return true;
}

//비밀번호 변경
function updatePassword() {
  //비밀번호
   if (uiPassword.value.trim() == "") {
    uiPassword.focus();
    document.getElementById("error-checkPwd").innerHTML =
      "<span> 새 비밀번호를 입력해주세요.</span>";
    return false;
  } else if (!checkPwd()) {
    uiPassword.focus();
    return false;
  }

  //비밀번호 확인
  if (uiPasswordSame.value.trim() == "") {
    uiPasswordSame.focus();
    document.getElementById("error-checkPwdSame").innerHTML =
      "<span> 비밀번호를 한 번 더 확인해주세요.</span>";
    return false;
  } else if (!checkPwdSame()) {
    uiPasswordSame.focus();
    
    return false;
  }
  return true;
}

//이메일 변경
function updateEmail() {
  if (uiEmail.value.trim() == "") {
    uiEmail.focus();
    document.getElementById("error-checkEmail").innerHTML =
      "<span> 이메일을 입력해주세요.</span>";
    return false;
  } else if (!checkEmail) {
    uiEmail.focus();
    return false;
  }
  return true;
}

//메소드 목록
//비밀번호 유효성 검사
function checkPwd() {
  if (!REG_PASSWORD.test(uiPassword.value)) {
    document.getElementById("error-checkPwd").innerHTML =
      "<span> 8글자 이상의 영문자, 숫자, 특수기호(!@#*%_)를 모두 포함해주세요.</span>";
    uiPassword.focus();
    return false;
  } else {
    document.getElementById("error-checkPwd").innerHTML = "";
  }
  return true;
}

function checkPwdSame() {
  if (uiPassword.value != uiPasswordSame.value) {
    uiPasswordSame.focus();
    document.getElementById("error-checkPwdSame").innerHTML =
      "<span> 비밀번호 확인이 올바르지 않습니다. </span>";
    return false;
  } else {
    document.getElementById("error-checkPwdSame").innerHTML = "";
  }
  return true;
}

//닉네임 유효성 검사
function checkNickname() {
	if (!REG_NICKNAME.test(uiNickname.value)) {
    uiNickname.focus();
    document.getElementById("error-checkNickname").innerHTML =
      "<span>2글자 이상의 한글, 영문자, 숫자를 사용해주세요.</span>";
    return false;
  } else {
    document.getElementById("error-checkNickname").innerHTML = "";
  }

  return true;
}

//이메일 유효성 검사
function checkEmail() {
  if (!REG_EMAIL.test(uiEmail.value)) {
    uiEmail.focus();
    document.getElementById("error-checkEmail").innerHTML =
      "<span>이메일이 올바르지 않습니다.</span>";
    return false;
  } else {
    document.getElementById("error-checkEmail").innerHTML = "";
  }
  return true;
}
