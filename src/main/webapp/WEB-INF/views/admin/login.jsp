<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영감 관리자 로그인 페이지</title>
</head>
<body>
<script>
<c:if test="${msg != null}">
	alert('${msg}');
</c:if>
function frmCheck(){
	const adminId = document.querySelector('#adminId');
	if(adminId.value==''){
		alert('아이디를 입력해주세요.');
		adminId.focus();
		return false;
	}
	const adminPwd = document.querySelector('#adminPwd');
	if(adminPwd.value==''){
		alert('비밀번호를 입력해주세요.');
		adminPwd.focus();
		return false;
	}
	return true;
}
</script>
	<h2>영감 관리자 로그인</h2>
	<form method="POST" action="/admin/login"
		onsubmit="return frmCheck()">
		<table border="1" width="400px">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="adminId" id="adminId"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="adminPwd" id="adminPwd"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" id="loginBtn" value="로그인">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>