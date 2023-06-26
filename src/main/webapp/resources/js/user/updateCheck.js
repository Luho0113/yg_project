/* 페이지 로딩을 막아줌 */
function onUpdateSubmit(event) {
  event.preventDefault();
}

//정규 표현식
//^[a-zA-Z0-9] : 또는
//(?=.*?[a-zA-Z0-9]) : 반드시 조건에 포함
const REG_ID = /^[a-zA-Z0-9_].{6,20}$/; //6~20자 이내의 영문자, 숫자, 특수기호(_)
const REG_NICKNAME = /^[가-힣a-zA-Z0-9].{1,16}$/; //영문대소, 한글, 숫자 허용
const REG_PASSWORD = /^(?=.*?[a-zA-Z])(?=.*?[0-9])(?=.*?[!@#*%_]).{8,20}$/; //8~20자 이내의 영문자, 숫자, 특수기호(!@#*%_)
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
    document.getElementById("error-checkNickName").innerHTML =
      '<span"> 닉네임을 입력해주세요.</span>';
    update_form.addEventListener("submit", onUpdateSubmit);
    return false;
  } else if (!checkNickName()) {
    uiNickname.focus();
    join_form.addEventListener("submit", onJoinSubmit);
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
      '<span"> 새 비밀번호를 입력해주세요.</span>';
    update_form.addEventListener("submit", onUpdateSubmit);
    return false;
  } else if (!checkPwd()) {
    uiPassword.focus();
    update_form.addEventListener("submit", onUpdateSubmit);
    return false;
  }

  //비밀번호 확인
  if (uiPasswordSame.value.trim() == "") {
    uiPasswordSame.focus();
    document.getElementById("error-checkPwdSame").innerHTML =
      "<span> 비밀번호를 한 번 더 확인해주세요.</span>";
    update_form.addEventListener("submit", onUpdateSubmit);
    return false;
  } else if (!checkPwdSame()) {
    uiPasswordSame.focus();
    update_form.addEventListener("submit", onUpdateSubmit);
    return false;
  }
  return true;
}

//이메일 변경
function updateEmail() {
  //이메일 확인
  if (uiEmail.value.trim() == "") {
    uiEmail.focus();
    document.getElementById("error-checkEmail").innerHTML =
      "<span> 이메일을 입력해주세요.</span>";
    update_form.addEventListener("submit", onUpdateSubmit);
    return false;
  } else if (!checkEmail) {
    uiEmail.focus();
    update_form.addEventListener("submit", onUpdateSubmit);
    return false;
  }
  return true;
}

//메소드 목록
//비밀번호 유효성 검사
function checkPwd() {
  if (!REG_ID.test(uiPassword.value)) {
    document.getElementById("error-checkPwd").innerHTML =
      "<span> 8글자 이상의 영문자, 숫자, 특수기호(!@#*%_)를 포함해주세요.</span>";
    uiPassword.focus();
    return false;
  } else if (uiPassword.value.length > 20) {
    uiPassword.focus();
    document.getElementById("error-checkPwd").innerHTML =
      "<span> 20자 이내로 입력해주세요.</span>";
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
function checkNickName() {
  if (uiNickname.value.length > 16) {
    uiNickname.focus();
    document.getElementById("error-checkNickName").innerHTML =
      "<span> 16자 이내로 입력해주세요.</span>";
    return false;
  }
  if (!REG_NICKNAME.test(uiNickname.value)) {
    uiNickname.focus();
    document.getElementById("error-checkNickName").innerHTML =
      "<span>2글자 이상의 한글, 영문자, 숫자만 사용가능합니다.</span>";
    return false;
  } else {
    document.getElementById("error-checkNickName").innerHTML = "";
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
