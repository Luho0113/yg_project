<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 수정 페이지</title>
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
	<form method="POST" action="/admin/movie-update"
		enctype="multipart/form-data">
		<h2>영화 수정</h2>
		<input type="hidden" name="miCode" value="${movie.miCode}">
		
		<label for="miTitle">제목</label> 
		<input type="text" id="miTitle" name="miTitle" value="${movie.miTitle}"><br>
		 
		<label for="miOrgTitle">원제</label> 
		<input type="text" id="miOrgTitle" name="miOrgTitle" value="${movie.miOrgTitle}"><br>
		 
		<label for="miOpenDate">개봉일</label> 
		<input type="text" id="miOpenDate" name="miOpenDate" value="${movie.miOpenDate}"><br>
		 
		<label for="miShowTime">상영 시간</label> 
		<input type="text" id="miShowTime" name="miShowTime" value="${movie.miShowTime}"><br>

		<label for="miNation">국가</label> 
		<input type="text" id="miNation" name="miNation" value="${movie.miNation}"><br>
		 
		<label for="miGenre">장르</label>
		<c:set value="${movie.miGenre}" var="movies"/>
			<input type="checkbox" id="miGenre" name="miGenre" value="코미디"
			<c:if test="${fn:contains(movies, '코미디')}">checked
			</c:if>
			>코미디
			<input type="checkbox" id="miGenre" name="miGenre" value="액션"
			<c:if test="${fn:contains(movies, '액션')}">checked
			</c:if>
			>액션
			<input type="checkbox" id="miGenre" name="miGenre" value="모험"
			<c:if test="${fn:contains(movies, '모험')}">checked
			</c:if>
			>모험
			<input type="checkbox" id="miGenre" name="miGenre" value="범죄"
			<c:if test="${fn:contains(movies, '범죄')}">checked
			</c:if>
			>범죄
			<input type="checkbox" id="miGenre" name="miGenre" value="드라마"
			<c:if test="${fn:contains(movies, '드라마')}">checked
			</c:if>
			>드라마
			<input type="checkbox" id="miGenre" name="miGenre" value="로맨스"
			<c:if test="${fn:contains(movies, '로맨스')}">checked
			</c:if>
			>로맨스
			<input type="checkbox" id="miGenre" name="miGenre" value="판타지"
			<c:if test="${fn:contains(movies, '판타지')}">checked
			</c:if>
			>판타지 <br>
			<input type="checkbox" id="miGenre" name="miGenre" value="공포"
			<c:if test="${fn:contains(movies, '공포')}">checked
			</c:if>
			>공포
			<input type="checkbox" id="miGenre" name="miGenre" value="미스터리/스릴러"
			<c:if test="${fn:contains(movies, '미스터리/스릴러')}">checked
			</c:if>
			>미스터리/스릴러
			<input type="checkbox" id="miGenre" name="miGenre" value="다큐멘터리"
			<c:if test="${fn:contains(movies, '다큐멘터리')}">checked
			</c:if>
			>다큐멘터리
			<input type="checkbox" id="miGenre" name="miGenre" value="전쟁"
			<c:if test="${fn:contains(movies, '전쟁')}">checked
			</c:if>
			>전쟁
			<input type="checkbox" id="miGenre" name="miGenre" value="애나메이션"
			<c:if test="${fn:contains(movies, '애니메이션')}">checked
			</c:if>
			>애니메이션
			<input type="checkbox" id="miGenre" name="miGenre" value="SF"
			<c:if test="${fn:contains(movies, 'SF')}">checked
			</c:if>
			>SF
			
		<br><label for="miDirector">감독</label> 
		<input type="text" id="miDirector" name="miDirector" value="${movie.miDirector}"><br>
		
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
					<td><input type="text" id="miActor" name="miActor" value="${movie.miActor}"></td>
					<td><input type="text" id="miCast" name="miCast" value="${movie.miCast}"></td>
					<td><button type="button" class="delBtn" onclick="remove_row(this)">삭제</button></td>
				</tr>
			</tbody>
		</table>
		
		<label for="miAdult">등급</label> 
		<input type="radio" id="miAdult" name="miAdult" value="비성인"
		<c:if test="${movie.miAdult eq '비성인'}">checked</c:if>
		>비성인
		<input type="radio" id="miAdult" name="miAdult" value="성인"
		<c:if test="${movie.miAdult eq '성인'}">checked</c:if>
		>성인	
		<br>
		 
		<label for="miOverview">줄거리</label>
		<textarea rows="10" cols="80" id="miOverview" name="miOverview">${movie.miOverview}</textarea><br>

		<div id="img_div" style="display: none">
			<img src="${movie.miImage}" width="200">
		</div>
		<label for="miFile">포스터</label> <input type="file" id="miImage"
			name="miFile" onchange="uploadImg(this)"><br>

		<button>영화 수정</button>
		<input type="reset" value="다시 작성">
	</form>
</body>
</html>