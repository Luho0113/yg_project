<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="/review-insert" method="POST">
	이름: <input type="text" name="uiId" id="uiId"><br>
	영화 제목: <input type="text" name="miTitle" id="miTitle"><button type="button" onclick="searchMovie()">검색</button><br>
	<ul id="title"></ul>
	내용: <textarea name="riContent" id="riContent"></textarea><br>
	평점: <input type="text" name="riStar" id="riStar"><br>
	<button type="submit" onclick="location.href='/review-list'">리뷰등록</button>
</form>
</body>
<script>
function searchMovie(){
var a = 0;
const searchKeyword = document.getElementById('miTitle').value;
const searchURL = 'https://api.themoviedb.org/3/search/movie?query=' + searchKeyword + '&include_adult=false&language=ko-KR&page=1';
const options = {
		  method: 'GET',
		  headers: {
		    accept: 'application/json',
		    Authorization: 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4ZGE0NzZkY2EyOTk4Y2MwYWNiN2U2MzU5NjMzMDhhNSIsInN1YiI6IjY0NzM2ZTJkOTQwOGVjMDBlMTRjZGVhNSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.rmNtSzDfgUgipyAKkyWki-Jrae8kipwRPI9ISiHdpzM'
		  }
		};

		fetch(searchURL, options)
		  .then(response => response.json())
		  .then(response => {
			  for(a; a < response.results.length; a++){
				  
				  let tagArea = document.getElementById('title');
				  let new_pTag = document.createElement('li');
				  
				  new_pTag.innerHTML = response.results[a].title;
				  tagArea.appendChild(new_pTag);
				  
			  }
		  })
		  .catch(err => console.error(err));
}
</script>
</html>