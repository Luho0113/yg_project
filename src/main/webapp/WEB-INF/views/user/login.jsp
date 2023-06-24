<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>로그인</title>
    <!-- 스타일 -->
    <link rel="stylesheet" href="${path}/resources/css/common/button.css" />
    <link rel="stylesheet" href="${path}/resources/css/user/login.css" />
  </head>
  <body>
    <!-- header area -->
    <jsp:include page="../common/header.jsp"></jsp:include>

    <!-- content area -->
    <div class="content">
      <h3>로그인</h3>
      <!-- 로그인 -->
      <form method="POST" action="/login" name="login_form">
        <!-- 아이디 입력 -->
        <div class="input-wrap">
          <label>
            <input
              class="input"
              type="text"
              name="uiId"
              id="uiId"
              placeholder=" 아이디"
            />
            <br />
          </label>
        </div>

        <!-- 비밀번호 입력 -->
        <div class="input-wrap">
          <label>
            <input
              class="input"
              type="password"
              name="uiPassword"
              id="uiPassword"
              placeholder=" 비밀번호"
            />
            <br />
          </label>
        </div>

        <!-- 경고 메세지 -->
        <div class="error_message-wrap">
          <span class="error-message" style="display: none">
            아이디와 비밀번호를 입력해주세요.
          </span>
          <c:if test="${msg != null}">
            <span class="error-fail"> 아이디나 비밀번호가 틀렸습니다. </span>
          </c:if>
        </div>

        <!-- 로그인 버튼 -->
        <div class="button-login">
          <button class="button-custom btnOrange" onclick="loginCheck()">
            <span>로그인</span>
          </button>
        </div>

        <!-- 회원가입 링크 -->
        <div class="to-join">
          <a href="/join">아직 영감이 아니신가요? 가입하기</a>
        </div>
      </form>
    </div>

    <!-- footer area -->
    <jsp:include page="../common/footer.jsp"></jsp:include>

    <!-- javascript -->
    <script src="${path}/resources/js/user/loginCheck.js"></script>
  </body>
</html>
