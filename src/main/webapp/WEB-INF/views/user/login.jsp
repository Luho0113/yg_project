<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"
%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>로그인</title>
    <!-- 스타일 -->
  </head>
  <body>
    <!-- header area -->
    <jsp:include page="../common/header.jsp"></jsp:include>

    <!-- content area -->
    <div class="content">
      <!-- 로그인 -->
      <form method="POST" action="/login" name="login_form">
        <!-- 아이디 입력 -->
        <div>
          <label> <input type="text" name="uiId" id="uiId" placeholder="아이디" /> <br /> </label>
        </div>

        <!-- 비밀번호 입력 -->
        <div>
          <label> <input type="password" name="uiPassword" id="uiPassword" placeholder="비밀번호" /> <br /> </label>
        </div>

        <!-- 경고 메세지 -->
        <div>
          <span class="error_message" style="display: none"> 아이디와 비밀번호를 입력해주세요. </span>
          <c:if test="${param.msg == 'error'}">
            <span class="error_fail"> 아이디나 비밀번호가 틀렸습니다. </span>
          </c:if>
        </div>

        <button onclick="loginCheck()">로그인</button> <br />
        <button onclick="location.href='/join'" type="button">가입하기</button>
      </form>
    </div>

    <!-- footer area -->
    <jsp:include page="../common/footer.jsp"></jsp:include>

    <!-- javascript -->
    <script src="${path}/resources/js/user/loginCheck.js"></script>
  </body>
</html>
