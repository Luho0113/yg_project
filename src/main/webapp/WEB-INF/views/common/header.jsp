<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<div class="nav">
	<ul>
		<li><a href="/myInfo">내 프로필</a></li>
		<li><a href="/logout">로그아웃</a></li>
		<li><a href="/review-insert">후기작성</a></li>
		<li><a href="/search">영화검색</a></li>
		<li><a href="/reviews">후기게시판</a></li>
	</ul>
</div>
<c:if test="${user.uiId == null}">
	<p>로그인이 필요합니다.</p>
	<button onclick="location.href='/login'">로그인</button>
	<button onclick="location.href='/join'">회원가입</button>
</c:if>

<c:if test="${admin.adminId != null}">

</c:if>
<c:if test="${user.uiId != null}">
	${user.uiNickname}님 안녕하세요! <br>
	<div>
		<a href="/myInfo"> <img alt="내프로필" src="${user.uiFilePath}"
			style="border-radius: 20px" width="40px" height="40px"
			onerror="this.src='https://ifh.cc/g/cDROLZ.png';">
		</a>
	</div>
</c:if>
<div class="header"></div>