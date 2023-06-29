function checkNull() {

	const riMovieId = document.querySelector("#riMovieId");
	if (riMovieId.value == null || riMovieId.value == "") {
		alert('영화 정보를 입력해주세요.');
		return false;
	}
	const riStar = document.querySelector("#riStar");
	if (riStar.value == '') {
		alert('별점을 입력해주세요.');
		return false;
	}
	const riContent = document.querySelector('.riContent');
	if (riContent.value == null || riContent.value == "") {
		alert('영화 후기를 입력해주세요.');
		return false;
	}
}

	