onload = function() {
	const starPointArray = document.getElementsByClassName("starPoint");
	const starPoint = starPointArray[0];
	const star = starPoint.getElementsByClassName("riStar")[0].value;
	const starCalc = ((star * 2) * 10);
	
	starPoint.getElementsByClassName("starRange")[0].style.width = `${starCalc}%`;
}