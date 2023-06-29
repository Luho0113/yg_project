<%@page import="com.younggam.app.vo.AdminInfoVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영감 관리자 페이지</title>
</head>
<body>
<%
AdminInfoVO admin = (AdminInfoVO) session.getAttribute("admin");
if(admin == null){
%>
<script>
   alert('관리자 로그인이 필요합니다.');
   location.href='/admin/login';
</script>
<%
return;
}
%>
</body>
</html>