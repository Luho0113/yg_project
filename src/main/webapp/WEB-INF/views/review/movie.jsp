<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>존윅을 출력하기</h1>
<p id="title"></p>
<p id="overview"></p>
<img id="poster" src="https://image.tmdb.org/t/p/w300"/>




</body>
<script>
const options = {
		  method: 'GET',
		  headers: {
		    accept: 'application/json',
		    Authorization: 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4ZGE0NzZkY2EyOTk4Y2MwYWNiN2U2MzU5NjMzMDhhNSIsInN1YiI6IjY0NzM2ZTJkOTQwOGVjMDBlMTRjZGVhNSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.rmNtSzDfgUgipyAKkyWki-Jrae8kipwRPI9ISiHdpzM'
		  }
		};

		fetch('https://api.themoviedb.org/3/discover/movie?include_adult=false&include_video=false&language=ko&page=1&sort_by=popularity.desc', options)
		  .then(response => response.json())
		  .then(response => {
			  document.getElementById('title').innerHTML = response.results[0].title;
			  document.getElementById('overview').innerHTML = response.results[0].overview;
			  document.getElementById('poster').src += response.results[0].poster_path;
		  })
		  .catch(err => console.error(err));
</script>
</html>