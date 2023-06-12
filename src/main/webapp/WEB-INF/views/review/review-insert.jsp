<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 작성 페이지</title>
<link rel="stylesheet" href="${path}/resources/css/review-star.css">
<script src="${path}/resources/js/review-star.js"></script>
</head>

<body>
<h3>리뷰 작성 페이지</h3><%-- 이후 페이지 정리 필요함 --%>
    
	<form autocomplete="off" action="/review-insert" method="GET">
        <div class="autocomplete" style="width:300px;">
          <input id="myInput" type="text" name="search" placeholder="Country" value="${param.search}">
        </div>
        <input type="submit">
    </form>
	
    <form action="#" method="POST">
        <table>
            <tr>
                <th>감독</th><td>블라블라</td>
            </tr>
            <tr>
                <th>개봉 연도</th><td>블라블라</td>
            </tr>
            <tr>
                <th>영감 포인트</th>
                <td>
                    <input type="checkbox" id="dirction" name="dirction" value="1">
                    <label for="dirction">연출</label>

                    <input type="checkbox" id="acting" name="acting" value="1">
                    <label for="acting">연기</label>

                    <input type="checkbox" id="story" name="story" value="1">
                    <label for="story">스토리</label>

                    <input type="checkbox" id="visual" name="visual" value="1">
                    <label for="visual">영상미</label>

                    <input type="checkbox" id="ost" name="ost" value="1">
                    <label for="ost">OST</label><br>
                </td>
            </tr>
            <tr>
                <th>별점</th>
                    <td>	
                        <span class="star">
                            ★★★★★
                            <span>★★★★★</span>
                            <input type="range" oninput="drawStar(this)" value="1" step="1" min="0" max="10">
                        </span>
                </td>
            </tr>
        </table>
        <div>
            <textarea placeholder="리뷰를 작성하세요." style="height: 300px; width: 600px;"></textarea>
        </div>
        <div>
            <input type="checkbox" id="spoiler" name="spoiler">
            <label for="spoiler">해당 리뷰는 스포일러를 포함하고 있습니다.</label>
        </div>
        <div>
            <button type="submit">등록</button>
            <button onclick="">취소</button>
        </div>
    </form>
</body>


<script>
var countries = new Array();
	<c:forEach items="${movie}" var="movie">
		 countries.push("${movie['title']}");
    </c:forEach>
    autocomplete(document.getElementById("myInput"), countries);
</script>

</html>