/* riListElement에서 함수 호출,,? */
onload = function(){

		
	
    const val = document.getElementById('riMovieId').value;
    const options = {
        method: 'GET',
        headers: {
          accept: 'application/json',
          Authorization: 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4ZGE0NzZkY2EyOTk4Y2MwYWNiN2U2MzU5NjMzMDhhNSIsInN1YiI6IjY0NzM2ZTJkOTQwOGVjMDBlMTRjZGVhNSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.rmNtSzDfgUgipyAKkyWki-Jrae8kipwRPI9ISiHdpzM'
        }
      };
      fetch('https://api.themoviedb.org/3/movie/' + val + '?language=ko-KR', options)
        .then(response => response.json())
        .then(response => {
            const poster = response.poster_path;
            const title = response.title;
            const release_date = response.release_date.substring(0, 4);

			document.getElementById('posterPath').setAttribute("src", "https://image.tmdb.org/t/p/original" + poster);	
            document.getElementById('riMovieTitle').innerHTML = title + ' | ';
			document.getElementById('riListReleaseDate').innerHTML = release_date;

        })
        .catch(err => console.error(err));
        
}