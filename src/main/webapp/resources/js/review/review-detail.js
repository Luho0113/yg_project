onload = function() {
	const starPointArray = document.getElementsByClassName("starPoint");
	const starPoint = starPointArray[0];
	const star = starPoint.getElementsByClassName("riStar")[0].value;
	const starCalc = ((star * 2) * 10);
	
	starPoint.getElementsByClassName("starRange")[0].style.width = `${starCalc}%`;
}


function deleteReview(e){
	
	if(confirm('정말 삭제하시겠습니까?')){
		window.location.href = '/review-delete?riNum=' + e;
		alert('삭제되었습니다.');
	}
	
}

function deleteComment(e){
	
	if(confirm('정말 삭제하시겠습니까?')){
		window.location.href = '/delete-comment?rcNum=' + e;
		alert('삭제되었습니다.');
	}
	
}