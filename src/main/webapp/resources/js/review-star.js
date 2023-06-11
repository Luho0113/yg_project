const drawStar = (target) => {
    document.querySelector(`.star span`).style.width = `${target.value * 10}%`;
  }
  
  function autocomplete(inp, arr) {
    /*the autocomplete function takes two arguments,
    the text field element and an array of possible autocompleted values:*/
    /* 자동 완성 함수는 두 개의 인수를 사용합니다,
    텍스트 필드 요소 및 가능한 자동 완성 값 배열 */
    var currentFocus;
    /*execute a function when someone writes in the text field:*/
    /* 텍스트 필드에 글을 쓸 때 기능을 실행합니다 */

    inp.addEventListener("input", function() {
        var a, b, i, val = this.value;
        /*close any already open lists of autocompleted values*/
        /* 이미 열려 있는 자동 완성 값 목록 닫기 */
        closeAllLists();
        if (!val) { return false;}

        currentFocus = -1; /* -1 대입 */

        /*create a DIV element that will contain the items (values):*/
        /* 항목(값)을 포함하는 DIV 요소 생성 */
        a = document.createElement("DIV");
        a.setAttribute("id", this.id + "autocomplete-list");
        a.setAttribute("class", "autocomplete-items");
        /*append the DIV element as a child of the autocomplete container:*/
        /* DIV 요소를 자동 완성 용기의 자식으로 추가 */
        this.parentNode.appendChild(a);
        /* 여기서 만들어진 것이 myInputautocomplete라는 이름을 가진 <div> */


        /*for each item in the array...*/
        /* 배열의 각 항목에 대해 */
        for (i = 0; i < arr.length; i++) {
          /*check if the item starts with the same letters as the text field value:*/
          /* 항목이 텍스트 필드 값과 동일한 문자로 시작하는지 확인합니다 */
          if (arr[i].substr(0, val.length).toUpperCase() == val.toUpperCase()) {
            /*create a DIV element for each matching element:*/
            /* 일치하는 각 요소에 대해 DIV 요소 생성 */
            b = document.createElement("DIV");
            
            /*make the matching letters bold:*/
            /* 일치하는 글자를 굵게 표시합니다 */
            b.innerHTML = "<strong>" + arr[i].substr(0, val.length) + "</strong>";
            b.innerHTML += arr[i].substr(val.length);
            /*   <div><strong>브래</strong>들리 쿠퍼</div>   */
            /*insert a input field that will hold the current array item's value:*/
            /* 현재 배열 항목의 값을 유지할 입력 필드 삽입 */
            b.innerHTML += "<input type='hidden' value='" + arr[i] + "'>";
            /*execute a function when someone clicks on the item value (DIV element):*/
            /* 항목 값(DIV 요소)을 클릭하면 다음과 같은 기능이 실행됩니다: */
                b.addEventListener("click", function() {
                /*insert the value for the autocomplete text field:*/
                /* 자동 완성 텍스트 필드 값 삽입 */
                inp.value = this.getElementsByTagName("input")[0].value;
                /*close the list of autocompleted values,
                (or any other open lists of autocompleted values:*/
                /* 자동 완성 값 리스트를 닫습니다,
                (또는 자동 완성된 값의 열려 있는 다른 목록) */
                closeAllLists();
            });
            a.appendChild(b);
          }
        }
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
          /*If the ENTER key is pressed, prevent the form from being submitted,*/
          /* ENTER 키를 누르면 양식이 제출되지 않습니다 */
          e.preventDefault();
          if (currentFocus > -1) {
            /*and simulate a click on the "active" item:*/
            /* "활성" 항목을 클릭하는 시뮬레이션을 수행합니다: */
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
  /*execute a function when someone clicks in the document:*/
  /* 문서를 클릭하면 기능을 실행합니다 */
  document.addEventListener("click", function (e) {
      closeAllLists(e.target);
  });
  }