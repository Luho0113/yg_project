<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    
    <title>영감</title>
    <!-- 스타일 -->
    <link rel="stylesheet" href="${path}/resources/css/common/header.css" />
    <link
      rel="stylesheet"
      href="${path}/resources/css/admin/login-suspended.css"
    />
  </head>
  <body>
    <!-- 로그인 실패 안내 페이지 (정지된 계정 전용) -->

    <!-- header area -->
    <jsp:include page="../common/header.jsp"></jsp:include>

    <!-- content area -->
    <div class="content login-suspended">
     <h1>알림</h1>
     <h2>이용 제한 안내</h2>
     <div class="suspend-notice">
      귀하의 계정은 현재 영감 이용이 제한되었습니다.<br>
      영감 운영정책에 따라, 귀하의 계정이 리뷰 작성 시 욕설, 광고/홍보, 음란,
      기타(개인정보 유출) 등의 사유로 신고되어,<br>
      이에 영감 페이지 접속이 차단되었습니다.<br>
      영감 관리자 이메일(younggam@gmail.com)로 문의해 주세요.<br>
	  </div>
	  
      <button onclick="location.href='/'">
        영감 홈으로
      </button>
      </div>

    <!-- footer area -->
    <jsp:include page="../common/footer.jsp"></jsp:include>
  </body>
</html>
