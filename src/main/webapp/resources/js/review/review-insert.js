function checkNull() {

	let riMovieId = document.querySelector("#riMovieId");
	if (riMovieId.value == null) {
		alert('영화 정보를 입력해주세요.');
		return false;
	}
	let riStar = document.querySelector("#riStar");
	if (riStar.value == '' || riStar.value == 0) {
		alert('별점을 입력해주세요.');
		return false;
	}
	let riContent = document.querySelector('.riContent');
	if (riContent.value == null || riContent.value == '') {
		alert('영화 후기를 입력해주세요.');
		return false;
	}
	return true;
}