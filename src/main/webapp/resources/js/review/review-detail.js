/* 날려도 될 듯 */
onload = function() {


	const movieId = document.getElementById("movieId"); /* 여러 개의 element를 배열로 가져온다. */
	
	const options = {
		method: 'GET',
		headers: {
			accept: 'application/json',
			Authorization: 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4ZGE0NzZkY2EyOTk4Y2MwYWNiN2U2MzU5NjMzMDhhNSIsInN1YiI6IjY0NzM2ZTJkOTQwOGVjMDBlMTRjZGVhNSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.rmNtSzDfgUgipyAKkyWki-Jrae8kipwRPI9ISiHdpzM'
		}
	};

	fetch('https://api.themoviedb.org/3/movie/' + movieId + '?language=ko-KR', options)
		.then(response => response.json())
		.then(response => {
			const poster = response.poster_path;
			const title = response.title;
			const release_date = response.release_date.substring(0, 4);
			const genre = response.genres[0].name;	
			const country = response.production_companies[0].origin_country;
			
			
			document.getElementById("posetPath").setAttribute("src", "https://image.tmdb.org/t/p/original" + poster);
			document.getElementById("movieTitle").innerHTML = title;
			document.getElementById("releaseDate").innerHTML = release_date;
			document.getElementById("genre").innerHTML = genre;	
			document.getElementById("country").innerHTML = country;
			

		})
		.catch(err => console.error(err));

	const starPointArray = document.getElementsByClassName("starPoint");
	const starPoint = starPointArray[i];

	const star = starPoint.getElementsByClassName("riStar")[0].value;

	const starCalc = ((star * 2) * 10);

	starPoint.getElementsByClassName("starRange")[0].style.width = `${starCalc}%`;


}