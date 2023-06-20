/* riListElement에서 함수 호출,,? */
onload = function() {
	const options = {
		method: 'GET',
		headers: {
			accept: 'application/json',
			Authorization: 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4ZGE0NzZkY2EyOTk4Y2MwYWNiN2U2MzU5NjMzMDhhNSIsInN1YiI6IjY0NzM2ZTJkOTQwOGVjMDBlMTRjZGVhNSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.rmNtSzDfgUgipyAKkyWki-Jrae8kipwRPI9ISiHdpzM'
		}
	};

	const index = document.getElementsByClassName("index");

	for (i = 0; i < index.length; i++) {

		const elementArray = document.getElementsByClassName("riListElement"); /* 여러 개의 element 중에서 i번째를 찾는다. */
		const element = elementArray[i];

		const val = element.getElementsByClassName("riMovieId")[0].value;


		fetch('https://api.themoviedb.org/3/movie/' + val + '?language=ko-KR', options)
			.then(response => response.json())
			.then(response => {
				const poster = response.poster_path;
				const title = response.title;
				const release_date = response.release_date.substring(0, 4);

				element.getElementsByClassName("posterPath")[0].setAttribute("src", "https://image.tmdb.org/t/p/original" + poster);
				element.getElementsByClassName("riMovieTitle")[0].innerHTML = title + ' | ';
				element.getElementsByClassName("riListReleaseDate")[0].innerHTML = release_date;


			})
			.catch(err => console.error(err));

	}
}