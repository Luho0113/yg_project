/* To-Do List */
var i = 0;
function click_event() {
  var add = document.getElementById("input").value;
  if (!add) {
    alert("Today 업무를 입력하세요.");
  } else {
    /* 글 추가*/
    additional(add, i, "node", "list");
    /* 완료 버튼 */
    doneBotton(i);
    /* 제거 버튼 생성 */
    removeButton(i);
    /*개행 처리 태그*/
    Next(i, "br", "list");
    i++;
  }
}

/* 글 추가 기능 및 수정 */
function additional(text, n, id, spot) {
  /* 입력한 값 SPAN 태그로 추가*/
  var node = document.createElement("SPAN");
  var textnode = document.createTextNode(text);
  node.id = id + n;
  node.appendChild(textnode);
  document.getElementById(spot).appendChild(node);

  node.onclick = function () {
    modify(node.id);
  };
  document.getElementById("input").value = "";
}

/* 완료 버튼 생성 */
function doneBotton(n) {
  var done_btn = document.createElement("BUTTON");
  done_btn.id = "done" + n;
  done_btn.className = "fas fa-check";
  document.getElementById("list").appendChild(done_btn);

  done_btn.onclick = function () {
    done(n);
  };
}

/* To-Do List의 목록들 완료 처리 */
function done(n) {
  var value = document.getElementById("node" + n).innerHTML;

  additional(value, n, "node_d", "done");

  /* 처리완료 목록 삭제 버튼 */
  var remove_btn = document.createElement("BUTTON");
  remove_btn.id = "bnt" + n;
  remove_btn.className = "fas fa-minus";
  document.getElementById("done").appendChild(remove_btn);

  remove_btn.onclick = function () {
    remove_d("node_d" + n, remove_btn.id, "br_d" + n);
  };

  Next(n, "br_d", "done");
  remove(n);
}

/* To-Do List 목록 삭제 버튼 */
function removeButton(n) {
  var remove_btn = document.createElement("BUTTON");
  remove_btn.id = n;
  remove_btn.className = "fas fa-minus";
  remove_btn.onclick = function () {
    remove(remove_btn.id);
  };
  document.getElementById("list").appendChild(remove_btn);
}

/* To-Do List에 있는 글 + 버튼 삭제 */
function remove(n) {
  var arr = ["node", "br", "done", ""];

  for (var i = 0; i < 4; i++) {
    var b = document.getElementById(arr[i] + n);
    b.style.display = "none";
  }
}

/* 글 수정 */
function modify(spot) {
  var value = prompt("수정", "수정");

  /* 수정하는 글 수정 X 기존 글 유지 */
  if (value) {
    document.getElementById(spot).innerHTML = value;
  }
}

/* 처리완료 목록에 있는 글 + 버튼 삭제 */
function remove_d(node, bnt, br) {
  var arr = [node, bnt, br];

  for (var i = 0; i < 3; i++) {
    var a = document.getElementById(arr[i]);
    a.style.display = "none";
  }
}

/* br 태그 생성 */
function Next(n, id, spot) {
  var br = document.createElement("BR");
  br.id = id + n;
  document.getElementById(spot).appendChild(br);
}

/* 캘린더 */
window.onload = function () {
  buildCalendar();
}; // 웹 페이지 로드 시 buildCalendar 실행

let nowMonth = new Date(); // 현재 달을 페이지를 로드한 날의 달로 초기화
let today = new Date(); // 페이지를 로드한 날짜를 저장
today.setHours(0, 0, 0, 0); // 비교 편의를 위해 today의 시간을 초기화

// 달력 생성: 해당 달에 맞춰 테이블 생성, 날짜를 fill in
function buildCalendar() {
  let firstDate = new Date(nowMonth.getFullYear(), nowMonth.getMonth(), 1); // 이번 달 1일
  let lastDate = new Date(nowMonth.getFullYear(), nowMonth.getMonth() + 1, 0); // 이번 달 마지막 날

  let tbody_Calendar = document.querySelector(".Calendar > tbody");
  document.getElementById("calYear").innerText = nowMonth.getFullYear(); // 연도 숫자 갱신
  document.getElementById("calMonth").innerText = leftPad(
    nowMonth.getMonth() + 1
  ); // 월 숫자 갱신

  while (tbody_Calendar.rows.length > 0) {
    // 이전 출력 결과가 남아 있는 경우 초기화
    tbody_Calendar.deleteRow(tbody_Calendar.rows.length - 1);
  }

  let nowRow = tbody_Calendar.insertRow(); // 첫 번 째 행 추가

  for (let j = 0; j < firstDate.getDay(); j++) {
    // 이번 달 1일의 요일 만큼
    let nowColumn = nowRow.insertCell(); // 열 추가
  }

  for (
    let nowDay = firstDate;
    nowDay <= lastDate;
    nowDay.setDate(nowDay.getDate() + 1)
  ) {
    // day는 날짜를 저장하는 변수, 이번 달 마지막 날까지 증가시키며 반복

    let nowColumn = nowRow.insertCell(); // 새 열 추가
    nowColumn.innerText = leftPad(nowDay.getDate()); // 추가한 열에 날짜 입력

    if (nowDay.getDay() == 0) {
      // 일요일 = 글자색 red
      nowColumn.style.color = "#DC143C";
    }
    if (nowDay.getDay() == 6) {
      // 토요일 = 글자색 blue
      nowColumn.style.color = "#0000CD";
      nowRow = tbody_Calendar.insertRow(); // 새로운 행 추가
    }

    if (nowDay < today) {
      // 지난 날인 경우
      nowColumn.className = "pastDay";
    } else if (
      nowDay.getFullYear() == today.getFullYear() &&
      nowDay.getMonth() == today.getMonth() &&
      nowDay.getDate() == today.getDate()
    ) {
      // 오늘인 경우
      nowColumn.className = "today";
      nowColumn.onclick = function () {
        choiceDate(this);
      };
    } else {
      // 미래인 경우
      nowColumn.className = "futureDay";
      nowColumn.onclick = function () {
        choiceDate(this);
      };
    }
  }
}

// 날짜 선택
function choiceDate(nowColumn) {
  if (document.getElementsByClassName("choiceDay")[0]) {
    // 기존에 선택한 날짜가 있으면
    document
      .getElementsByClassName("choiceDay")[0]
      .classList.remove("choiceDay"); // 해당 날짜의 "choiceDay" class 제거
  }
  nowColumn.classList.add("choiceDay"); // 선택된 날짜에 "choiceDay" class 추가
}

// 이전 달 버튼 클릭
function prevCalendar() {
  nowMonth = new Date(
    nowMonth.getFullYear(),
    nowMonth.getMonth() - 1,
    nowMonth.getDate()
  ); // 현재 달을 1 감소
  buildCalendar(); // 달력 다시 생성
}
// 다음 달 버튼 클릭
function nextCalendar() {
  nowMonth = new Date(
    nowMonth.getFullYear(),
    nowMonth.getMonth() + 1,
    nowMonth.getDate()
  ); // 현재 달을 1 증가
  buildCalendar(); // 달력 다시 생성
}

// input 값이 한자리 숫자인 경우 앞에 '0' 붙혀주는 함수
function leftPad(value) {
  if (value < 10) {
    value = "0" + value;
    return value;
  }
  return value;
}
