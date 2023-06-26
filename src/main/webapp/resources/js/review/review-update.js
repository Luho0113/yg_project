onload = function() {
	/* 기존 별점 표시*/
	const starPoint = document.querySelector('#riStar').value;
	const starCalc = ((starPoint * 2)*10);
	
	document.querySelector(`.star span`).style.width= `${starCalc}%`;
	
	/* 기존 영감포인트 표시 */
	const riDirectionPoint = document.querySelector('#riDirectionPoint');
	const riActingPoint = document.querySelector('#riActingPoint');
	const riStoryPoint = document.querySelector('#riStoryPoint');
	const riOstPoint = document.querySelector('#riOstPoint');
	const riVisualPoint = document.querySelector('#riVisualPoint');
	
	if(riDirectionPoint.value == 1){
		riDirectionPoint.checked = true;
	}
	if(riActingPoint.value == 1){
		riActingPoint.checked = true;
	}
	if(riStoryPoint.value == 1){
		riStoryPoint.checked = true;
	}
	if(riOstPoint.value == 1){
		riOstPoint.checked = true;
	}
	if(riVisualPoint.value == 1){
		riVisualPoint.checked = true;
	}
	
	/* 기존 스포일러 포함 표시 */
	const spoil = document.querySelector('#riSpoilValue')
	if(spoil.value == 1){
		document.getElementById("riSpoil").checked = true;
		document.getElementById("riSpoil_hidden").disabled = true;
	}else{
		document.getElementById("riSpoil_hidden").disabled = false;
	}
	
	
}

const drawStar = (target) => {
    document.querySelector(`.star span`).style.width = `${target.value * 10}%`;
    console.log(target.value);
    const starPoint = target.value/2.0;    
    document.getElementById("riStar").value = +starPoint;
}

//영감포인트 value 변경
function younggamPointCheck(checkbox){
	
	//unChecked일 때
	if(!checkbox.checked){
		checkbox.value = 0;
	}else{
		checkbox.value = 1;
	}
	
}

function spoilCheck(checkbox){
	if(checkbox.checked){
		document.getElementById("riSpoil_hidden").disabled = true;
	}else{
		document.getElementById("riSpoil_hidden").disabled = false;
	}
}