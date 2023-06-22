<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 페이지</title>
</head>
<body>
<h2>공지사항</h2>
<form action="/notices" method="GET">
	<input type="text" name="niTitle" placeholder="제목" value="${param.niTitle}">
	<input type="text" name="niContent" placeholder="내용" value="${param.niContent}">
	<button>공지 검색</button>
</form> 
<div align=right>
<button onclick="location.href='/'">My YoungGam Home</button>
<button onclick="location.href='/logout'">로그아웃</button>
</div>
<table class="noticeTable" border="1">
   <tr>
      <th>번호</th>
      <th>제목</th>
      <th>작성자</th>
      <th>작성일</th>
      <th>조회수</th>
 
   </tr>
   <c:if test="${empty page.list}">
      <th colspan="12">공지사항 목록이 없습니다.</th>
   </c:if>
   <c:forEach items="${page.list}" var="notice">
   <tr>
   	  <td>${notice.niNum}</td>	
      <td>
      <a href="/notice?niNum=${notice.niNum}">${notice.niTitle}</a>
      </td>
      <td>${notice.adminNickName}</td>
      <td>${notice.niCredat}</td>
      <td>${notice.niCnt}</td>
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
      html += '<a href="/notices?page=' + (start-1);
      if('${param.niTitle}'){
         html += '&niTitle=${param.niTitle}';
      }
        html += '"></a>';
     }
   
   for(let i = start; i<=end; i++){
      if(i==page){
         html += ' [' + i + '] '; 
      }else{
         if(i == 1){
            html += ' <a href="/notices?&niTitle=${param.niTitle}&niContent=${param.niContent}">[' + i + ']</a> ';
         }else{
            html += ' <a href="/notices?page=' + i + '&niTitle=${param.niTitle}&niContent=${param.niContent}">[' + i + ']</a> ';
         }
      }
   }
   if(end != pages){
      html += '<a href="/notices?page=' + (end + 1) + '&niTitle=${param.niTitle}&niContent=${param.niContent}"></a>';
   }
   document.querySelector('#pageDiv').innerHTML = html;
</script>
</c:if>
</body>
</html>