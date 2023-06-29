<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 등록</title>
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@2.0/nanumsquare.css">
<link rel="stylesheet" href="${path}/resources/css/admin/header.css">
<link rel="stylesheet" href="${path}/resources/css/common/footer.css">
<link rel="stylesheet" href="${path}/resources/css/common/page.css">
<link rel="stylesheet"
	href="${path}/resources/css/admin/notice-register.css">
</head>
<style>
html {
	font-family: 'NanumSquareRound';
}
</style>
<body>
	<!-- header area -->
	<jsp:include page="../header/header.jsp"></jsp:include>

	<div class="content noticeRegi-area">
		<form method="POST" action="/admin/notice-register"
			enctype="multipart/form-data" onsubmit="return writeCheck()">
			<h2>공지사항 등록</h2>

			<label for="niTitle">제목</label> <input type="text" id="niTitle"
				name="niTitle"><br> <label for="niFilePath">첨부
				<div class="btn-upload">공지 파일</div>
			</label> <input type="file" id="niFilePath" name="niFile"
				onchange="uploadImg(this)"><br> <label for="niContent">내용</label>
			<textarea rows="10" cols="80" id="niContent" name="niContent"></textarea>
			<br>

			<button class="regiBtn">공지사항 등록</button>
			<input type="reset" class="resetBtn" value="다시 작성">
		</form>
	</div>
	<!-- footer area -->
	<jsp:include page="../../common/footer.jsp"></jsp:include>

	<script>
		function uploadImg(obj) {
			let file = obj.files[0];
			document.querySelector('#img_div>img').src = URL
					.createObjectURL(file);
			document.querySelector('#img_div').style.display = '';
		}
		function writeCheck() {
			const niTitle = document.getElementById('niTitle');
			const niContent = document.getElementById('niContent');

			if (niTitle.value == '') {
				alert('제목을 입력해주세요.');
				niTitle.focus();
				return false;
			}
			if (niContent.value == '') {
				alert('내용을 입력해주세요.');
				niContent.focus();
				return false;
			}
		}
	</script>
</body>
</html>