<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/common/msg.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
</head>
<body>

	<h3>회원가입</h3>

	<form method="POST" action="/join" onsubmit="return checkValue()"
		enctype="multipart/form-data">
		
		<div id="imgDiv" style="display: none">
			<!-- 프로필 이미지 미리보기 -->
			<img src="" style="border-radius: 40px" width="80px" height="80px">  
		</div>
		<label for="uiFilePath">프로필 이미지 : </label>
		<input type="file" name="uiFile" id="uiFile" onchange="loadImg(this)">
		<div>
			<label> 이름 : <input type="text" name="uiName" id="uiName">
			</label>
		</div>
		<div>
			<label> 아이디 : <input type="text" name="uiId" id="uiId" onkeyup="checkId(this)">
			</label>
			<span class="uiId_ok" style="display: none">사용 가능한 아이디입니다.</span>
			<span class="uiId_already" style="display: none">이미 사용 중인 아이디입니다.</span>
		</div>
		<div>
			<label> 닉네임 : <input type="text" name="uiNickname" id="uiNickname" > </label>
		</div>
		<div>
			<label> 비밀번호 : <input type="password" name="uiPassword"
				id="uiPassword">
			</label>
		</div>
		<div>
			<label> 비밀번호 확인 : <input type="password" name="uiPasswordCheck" id="uiPasswordCheck">
			</label>
		</div>

		<div>
			<label> 이메일 <input type="email" name="uiEmail" id="uiEmail"> </label>
			<select id="uiEmail_sel" onchange="change_email();">
			<!--onchage: select안에 있는 옵션들의 값이 바뀌면 명령이 실행-->
				<option value="1">직접입력</option>
				<option value="@naver.com">네이버</option>
				<option value="@gmail.com">지메일</option>
				<option value="@nate.com">네이트</option>
				<option value="@daum.net">다음</option>
			</select>
		</div>

		<button type="button" onclick="history.back();">이전페이지로</button>
		<button>가입하기</button>
	</form>

	<script>
		
		function checkId(obj){
			if(obj.value.length<6){
				return;
			}
			$.get({
				url:'/check-id',
				data:{uiId:obj.value},
				success:function(res){
					if(res){
						$('.uiId_already').css('display','');
						$('.uiId_ok').css('display','none');
					}else{
						$('.uiId_already').css('display','none');
						$('.uiId_ok').css('display','');
					}
					console.log(res);
				}
			})
	    };
	        
		//이메일 옵션 선택후 주소 자동 완성
		function change_email() {
			var uiEmail = document.getElementById("uiEmail");
			var uiEmail_sel = document.getElementById("uiEmail_sel"); //도메인 선택

			//지금 골라진 옵션의 순서와 value 구하기
			var idx = uiEmail_sel.options.selectedIndex;
			var val = uiEmail_sel.options[idx].value;
				
			if(val=='1'){
				uiEmail.value = ''; //초기화
			} else {
				uiEmail.value = '';
				uiEmail.value = uiEmail.value + val;
			} 
		}

		//회원가입 유효성 검사
		function checkValue() {

			//변수 설정
			const uiName = document.querySelector('#uiName');
			const uiId = document.querySelector('#uiId');
			const uiNickname = document.querySelector('#uiNickname');
			const uiPassword = document.querySelector('#uiPassword');
			const uiPasswordCheck = document.querySelector('#uiPasswordCheck');
			const uiEmail = document.querySelector('#uiEmail');
			const REG_PASSWORD = /^(?=.*[a-zA-Z])(?=.*[!@#$&*%])(?=.*[0-9]).{8,20}$/;
			const RE_EMAIL = /^[_a-zA-Z0-9-]+(\.[_a-zA-Z0-9-]+)*@(?:\w+\.)+\w+$/;

			if (uiName.value == "") { // if(!uiName.value)
				alert('이름을 입력해주세요.');
				uiName.value = '';
				uiName.focus(); //커서가 깜빡이는 기능
				return false;
			}
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
			if (uiPasswordCheck.value == "") {
				alert('비밀번호 확인을 입력해주세요.');
				uiPasswordCheck.value = '';
				uiPasswordCheck.focus();
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

			if (!REG_PASSSWORD.test(uiPassword.value)) {
				alert('비밀번호는 영어 대소문자, 숫자, 특수문자(!@#$&*%)조합으로 8~20자리만 사용해야 합니다.');
				uiPassword.value = '';
				uiPassword.focus() = '';
				return false;
			}

			if (uiPasswordCheck.value !== uiPassword.value) {
				alert('비밀번호가 일치하지 않습니다.');
				uiPasswordCheck.value = '';
				uiPasswordCheck.focus();
				return false;
			}

			if (!RE_EMAIL.test(uiEmail.value)) {
				alert("이메일 형식이 올바르지 않습니다.");
				return false;
			}

			return true;
		}

		function loadImg(obj) {
			let file = obj.files[0];
			let imgObj = document.querySelector('#imgDiv>img');
			imgObj.src = URL.createObjectURL(file); //이미지 src의 url 생성
			document.querySelector('#imgDiv').style.display = '';
		}

		//<c:if test = "${msg != null}">
		//	alert('${msg}');
		//</c:if>
	</script>

</body>
</html>