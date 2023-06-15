const drawStar = (target) => {
    document.querySelector(`.star span`).style.width = `${target.value * 10}%`;
  }

/* 검색한 후 input에 focus 하기(그러면 검색결과 생성과 동시에 연관검색어가 보여진다.) */
/* onload 말고 submit 했을 때만,,, 으로 하고싶은데,, */
onload =  function(){
	document.form.search.focus();
}

/* 추천검색어에서 특정 검색어를 선택하면 input에 focus out 하기 */
function changetoblur(){
	document.form.search.blur();
}

/* 추천검색어 함수 시작! */
function autocomplete(inp, arr, directors, movieReleaseDate, movieId) {
    var currentFocus;
    
    /* 텍스트 필드가 focus 되었을 때 기능을 실행한다 */
    inp.addEventListener("focus", function() {
        var a, b, i, val = this.value; /* this = input */
        
        if (!val) { 
			return false;
		}/* 검색어가 없으면 아래의 항목은 실행되지 않는다. */

        currentFocus = -1; /* -1 대입 */

        /* 항목(값)을 포함하는 DIV 요소 생성 */
        a = document.createElement("DIV"); /* 이 div는 목록을 묶는 div이다. (여기서는 값이 없음) */
        a.setAttribute("id", this.id + "autocomplete-list"); /* 새로 만들어진 div에 id 부여하기 */
        a.setAttribute("class", "autocomplete-items"); /* 새로 만들어진 div에 class 부여하기 */
        
        /* 새로 만들어진 div를 div#autocomplete의 자식으로 넣는다.*/
        this.parentNode.appendChild(a);
        /* this = input */
        /* 여기서 만들어진 것이 myInputautocomplete라는 이름을 가진 <div> */

		/* 배열 길이 만큼 for문 돌리기 */
        for (i = 0; i < arr.length; i++) {
            b = document.createElement("DIV"); /* 새로 만들어진 div */
            b.innerHTML = arr[i]; /* input은 value를 보내기 위해서 있는거라 hidden 처리되어 있어서 안 보임 그래서 일반 텍스트로 값을 넣어서 보여준다. */
            b.innerHTML += "<input type='hidden' value='" + arr[i] + "'>";
            /* 해당 div를 누르면 arr[i]의 값이 기존에 있던 input#myInput에 들어갈 수 있도록 input으로 태그 생성한다. */
            b.innerHTML += "<input type='hidden' value='" + directors[i] + "'>";
            b.innerHTML += "<input type='hidden' value='" + movieReleaseDate[i] + "'>";
            b.innerHTML += "<input type='hidden' value='" + movieId[i] + "'>";
           	
            /* 위에서 만들어진 변수 b(값을 포함한 div)를 클릭하면 다음과 같은 기능을 실행한다. */
                b.addEventListener("click", function() {
                inp.value = this.getElementsByTagName("input")[0].value; /* 클릭한 input의 값을 input#myInput에 넣어준다. */
                document.getElementById("director").innerHTML = this.getElementsByTagName("input")[1].value;
                document.getElementById("releaseDate").innerHTML = this.getElementsByTagName("input")[2].value;
                document.getElementById("miCode").value = this.getElementsByTagName("input")[3].value;
                /* 감독이 들어는가는데 아직 배열 상태이고 방식이 조금 구린듯 */
                
            }); /* 추천검색어 중에서 영화를 선택했을 때 실행되는 함수 끝 */ 
            a.appendChild(b);
        }/* for문 끝 */
        
    });
    /* input 했을 때 실행되는 함수 끝나는 부분 */


    /*execute a function presses a key on the keyboard:*/
    /* 기능을 실행하여 키보드의 키를 누릅니다 */
    inp.addEventListener("keydown", function(e) {
        var x = document.getElementById(this.id + "autocomplete-list");
        if (x) x = x.getElementsByTagName("div");
        if (e.keyCode == 40) {
          /*If the arrow DOWN key is pressed,
          increase the currentFocus variable:*/
          /* 화살표 DOWN 키를 누르면,
          currentFocus 변수 증가 */
          currentFocus++;
          /*and and make the current item more visible:*/
          /* 그리고 현재 항목을 더 잘 볼 수 있도록 설정합니다 */
          addActive(x);
        } else if (e.keyCode == 38) { //up
          /*If the arrow UP key is pressed,
          decrease the currentFocus variable:*/
          /* 화살표 UP 키를 누르면,
          currentFocus 변수 감소 */
          currentFocus--;
          /*and and make the current item more visible:*/
          /* 그리고 현재 항목을 더 잘 볼 수 있도록 합니다 */
          addActive(x);
        } else if (e.keyCode == 13) {
          if (currentFocus > -1) {
            /*and simulate a click on the "active" item:*/
            /* "활성" 항목을 클릭하는 시뮬레이션을 수행합니다: */
            e.preventDefault();
            changetoblur();
            if (x) x[currentFocus].click();
          }
        }
    });
    function addActive(x) {
      /*a function to classify an item as "active":*/
      /* 항목을 "활성"으로 분류하는 기능 */
      if (!x) return false;
      /*start by removing the "active" class on all items:*/
      /* 모든 항목에서 "활성" 클래스를 제거하는 것으로 시작 */
      removeActive(x);
      if (currentFocus >= x.length) currentFocus = 0;
      if (currentFocus < 0) currentFocus = (x.length - 1);
      /*add class "autocomplete-active":*/
      /* 클래스 "complete-active" 추가 */
      x[currentFocus].classList.add("autocomplete-active");
    }
    function removeActive(x) {
      /*a function to remove the "active" class from all autocomplete items:*/
      /* 모든 자동 완성 항목에서 "활성" 클래스를 제거하는 기능: */
      for (var i = 0; i < x.length; i++) {
        x[i].classList.remove("autocomplete-active");
      }
    }
    
    function closeAllLists(elmnt) {
      /*close all autocomplete lists in the document,
      except the one passed as an argument:*/
      /* 문서의 모든 자동 완성 목록을 닫습니다,
      논쟁으로 통과된 것을 제외하고는 */
      var x = document.getElementsByClassName("autocomplete-items");
      for (var i = 0; i < x.length; i++) {
        if (elmnt != x[i] && elmnt != inp) {
        x[i].parentNode.removeChild(x[i]);
      }
    }
  }
/* 함수로 가져올 수 있는 방법이 없을가,,? */ 
  function selectDirector(arr){
	  
  }
  /*execute a function when someone clicks in the document:*/
  /* 문서를 클릭하면 기능을 실행합니다 */
  document.addEventListener("click", function (e) {
      closeAllLists(e.target);
  });
  }