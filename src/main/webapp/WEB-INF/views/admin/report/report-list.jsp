<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file = "/WEB-INF/views/common/error-admin.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고 게시판 페이지</title>
<link rel="stylesheet" href="${path}/resources/css/admin/header.css">
<link rel="stylesheet" href="${path}/resources/css/common/footer.css">
<link rel="stylesheet" href="${path}/resources/css/common/page.css">
<link rel="stylesheet" href="${path}/resources/css/admin/report-list.css">
<link
   rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
   integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
   crossorigin="anonymous"
   referrerpolicy="no-referrer"
/>
</head>
<body>
   <!-- header area -->
	<jsp:include page="../header/header.jsp"></jsp:include>

<div class="content reportArea">
<h2>신고 게시판</h2>
<form action="/admin/reports" method="GET">
	<input type="text" id="piTitle" name="piTitle" placeholder="제목" value="${param.piTitle}">
	<input type="text" id="uiNickname" name="uiNickname" placeholder="작성자" value="${param.uiNickname}">
	<button class="reportSearch">신고 검색</button>
</form>
<table class="reportTable">
   <tr>
      <th><h4>번호</h4></th>
      <th><h4>제목</h4></th>
      <th><h4>분류</h4></th>
      <th><h4>닉네임</h4></th>
      <th><h4>작성일</h4></th>
      <th><h4>수정 / 삭제</h4></th>
   </tr>
   <c:if test="${empty page.list}">
      <th colspan="12">신고 목록이 없습니다.</th>
   </c:if>
   <c:forEach items="${page.list}" var="report">
   <tr>
   	  <td>${report.piNum}</td>	
      <td>
      <a class="piTitle" href="/admin/report?piNum=${report.piNum}">
	  ${report.piTitle} &nbsp;
	  <i class="fa-solid fa-lock"></i> ['신고 게시판은 작성자와 관리자만 볼 수 있는 게시판입니다.']
      </a>
      </td>
      <td>${report.piCategory}</td>
      <td>${report.uiNickname}</td>
      <td>${report.piCredat}</td>
      <td><button class="reportUpdate" onclick="location.href='/admin/report-update?piNum=${report.piNum}'">수정</button>
      <button class="reportDelete" onclick="deleteCheck(${report.piNum});">삭제</button></td>
    </tr>
    </c:forEach>
</table>
<div id="pageDiv"></div>
<c:if test="${!(empty page.list)}">
<script>
<!-- 삭제 버튼 -->
	function deleteCheck(e) {
		if(!confirm('삭제하시면 복구할 수 없습니다. \n정말로 삭제하시겠습니까?')){
			alert("삭제가 취소되었습니다.");
			return false;
		}else{
			location.href="/admin/report-delete?piNum=" + e;
		}
	}
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
</div>
   <!-- footer area -->
   <jsp:include page="../../common/footer.jsp"></jsp:include>
</body>
</html>