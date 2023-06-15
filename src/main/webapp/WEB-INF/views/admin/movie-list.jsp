<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 목록 페이지</title>
</head>
<body>
<form action="/admin/movies" method="GET">
	<input type="text" name="miTitle" placeholder="영화 제목" value="${param.miTitle}">
	<input type="text" name="miOverview" placeholder="영화 내용" value="${param.miOverview}">
	<button>영화 검색</button>
</form>
<table class="movieTable" border="1">
   <tr>
      <th>제목</th>
      <th>원제</th>
      <th>개봉 연도</th>
      <th>상영 시간</th>
      <th>국가</th>
      <th>장르</th>
      <th>감독</th>
      <th>배우</th>
      <th>배역명</th>
      <th>등급</th>
      <th>포스터</th>
      <th>줄거리</th>
   </tr>
   <c:if test="${empty page.list}">
      <th colspan="7">영화 목록이 없습니다.</th>
   </c:if>
   <c:forEach items="${page.list}" var="movie">
   <tr>
      <td><a href="/admin/movie?miCode=${movie.miCode}">${movie.miTitle}</a></td>
      <td>${movie.miOrgTitle}</td>
      <td>${movie.miOpenDate}</td>
      <td>${movie.miShowTime}</td>
      <td>${movie.miNation}</td>
      <td>${movie.miGenre}</td>
      <td>${movie.miDirector}</td>
      <td>${movie.miActor}</td>
      <td>${movie.miCast}</td>
      <td>${movie.miAdult}</td>
      <td><img src= "${movie.miImage}" width="150"></td>
      <td>${movie.miOverview}</td>
      <td><a href="/admin/movie-update?miCode=${movie.miCode}">수정</a></td>
      <td><a href="/admin/movie-delete?miCode=${movie.miCode}">삭제</a></td>
   </tr>
   </c:forEach>
   <tr>
      <td colspan="11" align="right">
         <a href="/admin/movie-add">영화 등록</a>   
   </tr>
</table>
<div id="pageDiv"></div>
<c:if test="${!(empty page.list)}">
<script>
   const pages = ${page.pages}; 
   const page = ${page.pageNum}; //현재 페이지
   const start = Math.floor((page-1)/10)*10+1;
   const end = (start + 9) > pages ? pages : (start + 9);
   let html = '';
   if(start!=1){
      html += '<a href="/admin/movies?page=' + (start-1);
      if('${param.miTitle}'){
         html += '&miTitle=${param.miTitle}';
      }
        html += '"></a>';
     }
   
   for(let i = start; i<=end; i++){
      if(i==page){
         html += ' [' + i + '] '; 
      }else{
         if(i == 1){
            html += ' <a href="/admin/movies?&miTitle=${param.miTitle}">[' + i + ']</a> ';
         }else{
            html += ' <a href="/admin/movies?page=' + i + '&miTitle=${param.miTitle}">[' + i + ']</a> ';
         }
      }
   }
   if(end != pages){
      html += '<a href="/admin/movies?page=' + (end + 1) + '&miTitle=${param.miTitle}"></a>';
   }
   document.querySelector('#pageDiv').innerHTML = html;
</script>
</c:if>
</body>
</html>