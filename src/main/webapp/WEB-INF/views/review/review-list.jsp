<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화록록</title>
<link rel="stylesheet" href="${path}/resources/css/review/review-list.css">
</head>
<body>
    <div class="riShorSelect" id="riShorSelect">

    </div>



    <div class="riGenreBar" id="riGenreBar">
        <ul>
            <li>전체</li>
            <li>액션</li>
            <li>모험</li>
            <li>애니메이션</li>
            <li>코미디</li>
            <li>범죄</li>
            <li>다큐멘터리</li>
            <li>드라마</li>
            <li>가족</li>
            <li>판타지</li>
            <li>역사</li>
            <li>공포</li>
            <li>음악</li>
            <li>미스터리</li>
            <li>로맨스</li>
            <li>SF</li>
            <li>TV 영화</li>
            <li>스릴러</li>
            <li>전쟁</li>
            <li>서부</li>
        </ul>
    </div>




    <div class="riListContainer" id="riListContainer">
        <!-- <img id="poster" src="https://image.tmdb.org/t/p/w300"> -->
    </div>



</body>
</html>