<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index</title>
</head>
<body>
<h3>index</h3>



<c:if test="${user.uiId == null}">
	<p>로그인이 필요합니다.</p>
	<button onclick="location.href='/login'">로그인</button>
	<button onclick="location.href='/join'">회원가입</button>
</c:if>
<c:if test="${user.uiId != null}">
	${user.uiNickname}님 안녕하세요! <br>
	<button onclick="location.href='/myInfo'">내 프로필</button>
	<button onclick="location.href='/logout'">로그아웃</button>
	<button onclick="location.href='/review-insert'">후기 작성</button>
	<button onclick="location.href='/search'">영화 검색</button>
	<button onclick="location.href='/reviews'">후기 게시판</button>
</c:if>

</body>
</html>