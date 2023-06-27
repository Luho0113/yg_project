<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>회원가입</title>

    <!-- 스타일 -->
    <link rel="stylesheet" href="${path}/resources/css/common/button.css" />
    <link rel="stylesheet" href="${path}/resources/css/user/join.css" />

    <script
      src="https://code.jquery.com/jquery-3.7.0.js"
      integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
      crossorigin="anonymous"
    ></script>
  </head>
  <body>
    <!-- header area -->
    <jsp:include page="../common/header.jsp"></jsp:include>

    <!-- content area -->
    <div class="content">
      <h3>회원가입</h3>

      <div class="login-form">
        <form
          method="POST"
          action="/join"
          onsubmit="return formValidation()"
          name="join_form"
        >

          <!-- 아이디 입력 -->
          <div>
            <label>
              <input
                class="input"
                type="text"
                name="uiId"
                id="uiId"
                onkeyup="return checkId()"
                placeholder=" 아이디"
                maxlength="20"
              />
            </label>
            <div>
              <c:if test="${msg == 'uiId exist'}">
                <span class="error-fail"> 이미 사용 중인 아이디입니다. </span>
              </c:if>
            </div>

            <div id="error-checkId">
              <!-- 경고 텍스트 -->
            </div>
          </div>

          <!-- 닉네임 입력 -->
          <div>
            <label>
              <input
                class="input"
                type="text"
                name="uiNickname"
                id="uiNickname"
                onkeyup="return checkNickname()"
                placeholder=" 닉네임"
                maxlength="16"
              />
            </label>
            <div>
              <c:if test="${msg == 'uiNickname exist'}">
                <span class="error-fail"> 이미 사용 중인 닉네임입니다. </span>
              </c:if>
            </div>
            <div id="error-checkNickname">
              <!-- 경고 텍스트 -->
            </div>
          </div>

          <!-- 비밀번호 입력 -->
          <div>
            <label>
              <input
                class="input"
                type="password"
                name="uiPassword"
                id="uiPassword"
                onkeyup="return checkPwd()"
                placeholder=" 비밀번호"
                maxlength="20"
              />
            </label>
            <div id="error-checkPwd">
              <!-- 경고 텍스트 -->
            </div>
          </div>
          <!-- 비밀번호 확인 입력 -->
          <div>
            <label>
              <input
                class="input"
                type="password"
                name="uiPasswordSame"
                id="uiPasswordSame"
                onkeyup="return checkPwdSame()"
                placeholder=" 비밀번호 확인"
                maxlength="20"
              />
            </label>
            <div id="error-checkPwdSame">
              <!-- 경고 텍스트 -->
            </div>
          </div>

          <!-- 이메일 입력 -->
          <div>
            <label>
              <input
                class="input"
                type="email"
                name="uiEmail"
                id="uiEmail"
                onkeyup="return checkEmail()"
                placeholder=" 이메일"
              />
            </label>
            <div id="error-checkEmail">
              <!-- 경고 텍스트 -->
            </div>
          </div>
          <div class="button-join">
            <button class="button-custom btnOrange">가입하기</button>
          </div>
        </form>
      </div>
    </div>

    <!-- footer area -->
    <jsp:include page="../common/footer.jsp"></jsp:include>

    <!-- javascript -->
    <script src="${path}/resources/js/user/formCheck.js"></script>
    
  </body>
</html>
