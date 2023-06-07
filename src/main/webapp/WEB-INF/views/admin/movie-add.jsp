<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 등록 페이지</title>
</head>
<body>
<script>
function add_row(table_id){
   const table_body = document.getElementById(table_id);
   const first_tr = table_body.firstElementChild;
   const clone_tr = first_tr.cloneNode(true);
   table_body.append(clone_tr);
   clean_first_tr(table_body.firstElementChild);
}
function clean_first_tr(firstTr){
   const children = firstTr.children;
   children = Array.isArray(children) ? children : Object.values(children);
   children.forEach(x =>{
      if(x !== firstTr.lastElementChild){
         x.firstElementChild.value='';
      }   
   });   
}
function remove_row(This){
   if(This.closest('tbody').childElementCount == 1){
      alert("삭제할 수 없습니다.");
   }else{
      This.closest('tr').remove();
   }
}
function uploadImg(obj){
   let file = obj.files[0];
   document.querySelector('#img_div>img').src = URL.createObjectURL(file);
   document.querySelector('#img_div').style.display='';
}
</script>
   <form method="POST" action="/admin/movie-add" enctype="multipart/form-data">
      <h2>영화 등록</h2>
      <label for="miCode">코드</label> 
      <input type="text" id="miCode" name="miCode"><br>

      <label for="miTitle">제목</label> 
      <input type="text" id="miTitle" name="miTitle"><br>
       
      <label for="miOrgTitle">원제</label> 
      <input type="text" id="miOrgTitle" name="miOrgTitle"><br>
       
      <label for="miOpenDate">개봉일</label> 
      <input type="text" id="miOpenDate" name="miOpenDate"><br>
      
      <label for="miShowTime">상영 시간</label> 
      <input type="text" id="miShowTime" name="miShowTime"><br>

      <label for="miNation">국가</label> <input type="text" id="miNation" name="miNation"><br> 
      <label for="miGenre">장르</label> 
      <input type="checkbox" id="miGenre" name="miGenre" value="코미디">코미디 
      <input type="checkbox" id="miGenre" name="miGenre" value="액션">액션 
      <input type="checkbox" id="miGenre" name="miGenre" value="모험">모험 
      <input type="checkbox" id="miGenre" name="miGenre" value="범죄">범죄 
      <input type="checkbox" id="miGenre" name="miGenre" value="드라마">드라마 
      <input type="checkbox" id="miGenre" name="miGenre" value="로맨스">로맨스 
      <input type="checkbox" id="miGenre" name="miGenre" value="판타지">판타지<br>
      <input type="checkbox" id="miGenre" name="miGenre" value="공포">공포
      <input type="checkbox" id="miGenre" name="miGenre" value="미스터리/스릴러">미스터리/스릴러
      <input type="checkbox" id="miGenre" name="miGenre" value="다큐멘터리">다큐멘터리
      <input type="checkbox" id="miGenre" name="miGenre" value="전쟁">전쟁
      <input type="checkbox" id="miGenre" name="miGenre" value="애니메이션">애니메이션
      <input type="checkbox" id="miGenre" name="miGenre" value="SF">SF
      <br> <label for="miDirector">감독</label> 
      <input type="text" id="miDirector" name="miDirector"><br>
      <table>
         <thead>
            <tr>
               <th>배우</th>
               <th>배역명</th>
               <th width="30px">
                  <button type="button" class="addBtn" onclick="add_row('table_body')">추가</button>
               </th>
            </tr>
         </thead>
         <tbody id="table_body">
            <tr>
               <td><input type="text" id="miActor" name="miActor"></td>
               <td><input type="text" id="miCast" name="miCast"></td>
               <td><button type="button" class="delBtn" onclick="remove_row(this)">삭제</button></td>
            </tr>
         </tbody>
      </table>
      
      <label for="miAdult">등급</label> 
      <input type="radio" id="miAdult" name="miAdult" value="비성인">비성인 
      <input type="radio" id="miAdult" name="miAdult" value="성인">성인<br>
       
      <label for="miOverview">줄거리</label>
      <textarea rows="10" cols="80" id="miOverview" name="miOverview"></textarea><br>

      <div id="img_div" style="display: none">
         <img src="" width="200">
      </div>
      <label for="miFile">포스터</label> 
      <input type="file" id="miImage" name="miFile" onchange="uploadImg(this)"><br>

      <button>영화 등록</button>
      <input type="reset" value="다시 작성">
   </form>
</body>
</html>