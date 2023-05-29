<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>영화 검색</h1>
<h3 id="select">^_^</h3>
<input name="search" id="search" value=""><button onclick="searchMovie()">검색</button>
<ul id="title"></ul>


</body>
<script>
var a = 0;
function searchMovie(){
const imgUrl = 'https://image.tmdb.org/t/p/w200';

const searchKeyword = document.getElementById('search').value;
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
				  
				  let ulTag = document.getElementById('title'); //ul 태그를 담음
				  let new_liTag = document.createElement('li'); //li 태그를 생성함
				  let new_imgTag = document.createElement('img'); //img 태그를 생성함
				  let new_aTag = document.createElement('a'); //a 태그를 생성함
				  
				  new_aTag.innerHTML = response.results[a].title; //영화를 찾은 값을 a 태그 안에 넣음
				  new_aTag.setAttribute('id', 'a_' + a); //li 태그에 id 생성
				  new_aTag.setAttribute('href' , 'javascript:selectMovie(this.id);'); //a 태그 안에 href 속성을 넣어서 함수 호출함
				  new_imgTag.setAttribute('src', imgUrl + response.results[a].poster_path); //img 태그 안에 src 속성을 넣어서 이미지 조회
				  
				  ulTag.appendChild(new_liTag); //li 태그를 ul 태그 안에 넣음
				  new_liTag.appendChild(new_aTag); //a 태그를 ul 태그 안에 넣음
				  new_liTag.appendChild(new_imgTag); //a 태그를 ul 태그 안에 넣음
				  
			  }
		  })
		  .catch(err => console.error(err));
}
function selectMovie(id){
	
}
</script>
</html>