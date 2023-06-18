<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고 게시판 페이지</title>
</head>
<body>
<h2>신고 게시판</h2>
<form action="/reports" method="GET">
	<input type="text" name="piTitle" placeholder="제목" value="${param.piTitle}">
	<input type="text" name="uiNickname" placeholder="작성자" value="${param.uiNickname}">
	<button>신고 검색</button>
</form>
<div align=right>
<button onclick="location.href='/admin/home'">Younggam Manager Home</button>
<button onclick="location.href='/admin/logout'">로그아웃</button>
</div>
<button onclick="location.href='/report-file'">신고하기</button>
<table class="reportTable" border="1">
   <tr>
      <th>번호</th>
      <th>제목</th>
      <th>분류</th>
      <th>닉네임</th>
      <th>작성일</th>
      <th>수정 / 삭제</th>
   </tr>
   <c:if test="${empty page.list}">
      <th colspan="12">신고 목록이 없습니다.</th>
   </c:if>
   <c:forEach items="${page.list}" var="report">
   <tr>
   	  <td>${report.piNum}</td>	
      <td>
      <a href="/admin/report?piNum=${report.piNum}">
	  <span class="glyphicon glyphicon-lock">
	  '신고 게시판은 작성자와 관리자만 볼 수 있는 게시판입니다.'
	  </span>
      </a>
      </td>
      <td>${report.piCategory}</td>
      <td>${report.uiNickname}</td>
      <td>${report.piCredat}</td>
      <td><button onclick="location.href='/report-update?piNum=${report.piNum}'">수정</button>
      <button onclick="deleteCheck()">삭제</button></td>
    </tr>
    </c:forEach>
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
      html += '<a href="/admin/reports?page=' + (start-1);
      if('${param.piTitle}'){
         html += '&piTitle=${param.piTitle}';
      }
        html += '"></a>';
     }
   
   for(let i = start; i<=end; i++){
      if(i==page){
         html += ' [' + i + '] '; 
      }else{
         if(i == 1){
            html += ' <a href="/admin/reports?&piTitle=${param.piTitle}&uiNickname=${param.uiNickname}">[' + i + ']</a> ';
         }else{
            html += ' <a href="/admin/reports?page=' + i + '&piTitle=${param.piTitle}&uiNickname=${param.uiNickname}">[' + i + ']</a> ';
         }
      }
   }
   if(end != pages){
      html += '<a href="/admin/reports?page=' + (end + 1) + '&piTitle=${param.piTitle}&uiNickname=${param.uiNickname}"></a>';
   }
   document.querySelector('#pageDiv').innerHTML = html;
</script>
</c:if>
</body>
</html>