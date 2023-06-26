<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영감</title>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@2.0/nanumsquare.css">
<link rel="stylesheet" href="${path}/resources/css/review/review-update-star.css">
<link rel="stylesheet" href="${path}/resources/css/review/review-update.css">
<script src="${path}/resources/js/review/review-update.js"></script>
</head>
<body>
<!-- header area -->
<jsp:include page="../common/header.jsp"></jsp:include>

<!-- content area -->
<div class="content">

    <div class="margin"></div>
    
    <div class="autocomplete">
      <input id="myInput" type="text" name="search" value="${movie[0].title}" readonly="readonly">
    </div>

	
    <form action="/review-update" method="POST" onsubmit="return checkNull()">
    	<input type="hidden" id="riNum" name="riNum" value="${review.riNum}">
        <table class="reviewInfo">
            <tr>
                <th>감독</th>
                <td id="director">
                	<c:forEach items="${movie}" var="movie">
                		<c:forEach items="${movie.directors}" var="directors">
                			${directors}
                		</c:forEach>
                	</c:forEach>
                </td>
            </tr>
            <tr>
                <th>개봉 연도</th>
                <td id="releaseDate">
                	<c:set var="releaseDate" value="${movie[0].releaseDate}"></c:set>
                	${fn:substring(releaseDate,0,4)}
                </td>
            </tr>
            <tr>
                <th>영감 포인트</th>
                <td>
                    <input type="checkbox" id="riDirectionPoint" name="riDirectionPoint" value="${review.riDirectionPoint}" onchange="younggamPointCheck(this)">
                    <label for="riDirectionPoint">연출</label>

                    <input type="checkbox" id="riActingPoint" name="riActingPoint" value="${review.riActingPoint}" onchange="younggamPointCheck(this)">
                    <label for="riActingPoint">연기</label>

                    <input type="checkbox" id="riStoryPoint" name="riStoryPoint" value="${review.riStoryPoint}" onchange="younggamPointCheck(this)">
                    <label for="riStoryPoint">스토리</label>
                    
					<input type="checkbox" id="riOstPoint" name="riOstPoint" value="${review.riOstPoint}" onchange="younggamPointCheck(this)">
                    <label for="riOstPoint">OST</label>
                    
                    <input type="checkbox" id="riVisualPoint" name="riVisualPoint" value="${review.riVisualPoint}" onchange="younggamPointCheck(this)">
                    <label for="riVisualPoint">영상미</label><br>
                </td>
            </tr>
            <tr>
                <th>별점</th>
               		<td>	
                       <span class="star">
                           ★★★★★
                           <span>★★★★★</span>
                           <input type="range" oninput="drawStar(this)" value="1" step="1" min="0" max="10">
                           <input type="hidden" name="riStar" id="riStar" value="${review.riStar}">
                       </span>
               		</td>
            </tr>
        </table>
        <div>
            <textarea name="riContent" class="riContent" id="riContent">${review.riContent}</textarea>
        </div>
        <div class="spoilContainer">
            <input type="checkbox" id="riSpoil" name="riSpoil" value="1" onchange="spoilCheck(this)">
            <input type="hidden" id="riSpoil_hidden" name="riSpoil" value="0">
            <input type="hidden" id="riSpoilValue" name="riSpoil" value="${review.riSpoil}" disabled="disabled">
            <label for="riSpoil">해당 리뷰는 스포일러를 포함하고 있습니다.</label>
        </div>
        <div class="buttonContainer">
            <button type="submit">등록</button>
            <button type="button" onclick="location.href='reviews'">취소</button>
        </div>
    </form>
</div>
    
<!-- footer area -->
<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>