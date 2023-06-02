<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>네이버 로그인</title>
  <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
  <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>

</body>
<script type="text/javascript">
  var naver_id_login = new naver_id_login("CRz3Kl8XEo2sC3HfnmWx", "http://localhost/naver-login"); //YOUR_CLIENT_ID, YOUR_CALLBACK_URL
  // 접근 토큰 값 출력
  // alert(naver_id_login.oauthParams.access_token);
  // 네이버 사용자 프로필 조회
  naver_id_login.get_naver_userprofile("naverSignInCallback()");
  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
  function naverSignInCallback() {
    alert(naver_id_login.getProfileData('email'));
    alert(naver_id_login.getProfileData('nickname'));
    alert(naver_id_login.getProfileData('age'));
  }
  window.addEventListener('load', function () {
      naverLogin.getLoginStatus(function (status) {
          if (status) {
              /* (5) 필수적으로 받아야하는 프로필 정보가 있다면 callback처리 시점에 체크 */

              // 유저 아이디, 이메일 주소, 이름을 Session에 저장
              sessionStorage.setItem("user_info",naverLogin.user.id);
              sessionStorage.setItem("naver_email", naverLogin.user.getEmail());
              sessionStorage.setItem("naver_name", naverLogin.user.getName());

              // 네이버 로그인과 카카오 로그인을 구분하기 위해 별도의 세션을 저장합니다.
              sessionStorage.setItem("naver");

              // 회원가입 혹은 로그인 시 처리하기 위한 페이지 입니다. 예를 들어 DB
              /* 인증이 완료된후 /sample/main.html 페이지로 이동하라는것이다. 본인 페이로 수정해야한다. */
              location.href = "/naver-login";
              } else {
              console.log("callback 처리에 실패하였습니다.");
          }
      });
  });
</script>
</html>