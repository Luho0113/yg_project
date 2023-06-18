<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영감</title>
</head>
<body>

<script>
<c:if test = "${msg != null}">
	alert('${msg}');
	location.href='${url}';
</c:if>
</script>


</body>
</html>