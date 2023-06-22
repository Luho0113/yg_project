<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 스타일 -->
    <link rel="stylesheet" href="${path}/resources/css/profile/myInfo.css" />
</head>
<body>
	

	
	<!-- header area -->
    <jsp:include page="../common/header.jsp"></jsp:include>

    <div class="content">
      <h3>내 프로필</h3>
      <img
        src="${myReviews[0].uiFilePath}"
        style="border-radius: 100px"
        width="200px"
        height="200px"
        onerror="this.src='https://ifh.cc/g/cDROLZ.png';"
      />
      <br />
      닉네임 : ${myReviews[0].uiNickname} <br />
      <button onclick="location.href='/myInfo-update'">수정하기</button>

      <div class="tap-wrap">
        <div class="tab-menu">
          <ul class="tab-list">
            <li class="tab-active">
              <a href="#tab1" class="tab-button">후기</a>
            </li>
            <li>
              <a href="#tab2" class="tab-button">댓글</a>
            </li>
            <li>
              <a href="#tab3" class="tab-button">좋아요</a>
            </li>
          </ul>

          <div class="cont_area">
            <div id="tab1" class="cont" style="display: block">
            		<c:if test="${empty myReviews}">
						리뷰없음
					</c:if>
					<c:forEach items="${myReviews}" var="myReview">
						<div>${myReview.riContent}</div>
					</c:forEach>
					
				
            </div>
            <div id="tab2" class="cont">Tab Content2</div>
            <div id="tab3" class="cont">Tab Content3</div>
          </div>
        </div>
      </div>
    </div>

    <!-- footer area -->
    <jsp:include page="../common/footer.jsp"></jsp:include>

    <!-- javascript -->
    <script>
      const tabList = document.querySelectorAll(".tab-menu .tab-list li");
      const contents = document.querySelectorAll(".tab-menu .cont_area .cont");
      let activeCont = ""; // 현재 활성화 된 컨텐츠 (기본:#tab1 활성화)

      for (var i = 0; i < tabList.length; i++) {
        tabList[i]
          .querySelector(".tab-button")
          .addEventListener("click", function (e) {
            e.preventDefault();
            for (var j = 0; j < tabList.length; j++) {
              // 나머지 버튼 클래스 제거
              tabList[j].classList.remove("tab-active");

              // 나머지 컨텐츠 display:none 처리
              contents[j].style.display = "none";
            }

            // 버튼 관련 이벤트
            this.parentNode.classList.add("tab-active");

            // 버튼 클릭시 컨텐츠 전환
            activeCont = this.getAttribute("href");
            document.querySelector(activeCont).style.display = "block";
          });
      }
    </script>
	
</body>
</html>