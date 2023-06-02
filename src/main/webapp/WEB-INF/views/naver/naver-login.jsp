<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.security.SecureRandom"%>
<%@ page import="java.math.BigInteger"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>네이버 로그인</title>
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>

	<!-- 네이버 로그인 버튼 노출 영역 -->
	<div class="login-area">
		<div id="button_area">
			<div id="naver_id_login"></div>
		</div>
	</div>

	<script type="text/javascript">
  	var naver_id_login = new naver_id_login("CRz3Kl8XEo2sC3HfnmWx", "http://localhost/naver-login");
  	var state = naver_id_login.getUniqState();
  	naver_id_login.setButton("white", 2,40); //로그인의 버튼 타입
  	naver_id_login.setDomain("http://localhost");
  	naver_id_login.setState(state);
  	naver_id_login.setPopup();
  	naver_id_login.init_naver_id_login();
  	naverLogin.init();
  	
  </script>


</body>

</html>