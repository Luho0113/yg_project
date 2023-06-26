<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file = "/WEB-INF/views/common/error-admin.jsp"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
      integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    />
    <link rel="stylesheet" href="${path}/resources/css/admin/home.css" />
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@2.0/nanumsquare.css">
    <script src="${path}/resources/js/admin/home.js"></script>
    
    <title>영감 관리자 페이지</title>
  </head>
  <body>
    <nav>
      <div class="younggam-logo">
        <div class="younggam-img">
          <img src="${path}/resources/images/yg_logo_orange.png" alt="영감 관리자" />
        </div>
        <span class="younggam-logo">YoungGam</span>
      </div>
      <div class="menu-items">
        <ul class="nav-links">
          <li>
            <a href="/admin/home">
              <i class="fa-solid fa-house"></i>
              <span class="admin-home">Home</span>
            </a>
          </li>
          <li>
            <a href="/admin/users">
              <i class="fa-solid fa-user"></i>
              <span class="admin-user">회원 관리</span>
            </a>
          </li>
          <li>
            <a href="/admin/notices">
              <i class="fa-solid fa-flag"></i>
              <span class="admin-user">공지사항</span>
            </a>
          </li>
          <li>
            <a href="/admin/reports">
              <i class="fa-solid fa-clipboard"></i>
              <span class="admin-report">신고 게시판 관리</span>
            </a>
          </li>
          <li>
            <a href="/admin/profile">
              <i class="fa-solid fa-pen"></i>
              <span class="admin-profile">관리자 정보</span>
            </a>
          </li>
        </ul>

        <ul class="logout">
          <li>
            <a href="/admin/logout">
              <i class="fa-solid fa-right-from-bracket"></i>
              <span class="admin-logout">로그아웃</span>
            </a>
          </li>
        </ul>
      </div>
    </nav>

    <section class="dashboard">
      <div class="dash-top">
        <a href="/admin/profile"><img src="${admin.adminFilePath}" alt="영감 관리자">
        </a>&nbsp;<a class="admin-nickname" href="/admin/profile">${admin.adminNickName} 님</a>
      </div>
      <div class="dash-content">
        <div class="overview">
          <div class="title">
            <i class="fa-solid fa-house"></i>
            <span class="text">영감 관리</span>
          </div>
          <div class="boxes">
            <div class="box box1">
              <i class="fa-solid fa-user"></i>
              <a href="/admin/users/">회원 관리</a>
            </div>
            <div class="box box2">
              <i class="fa-solid fa-flag"></i>
              <a href="/admin/notices/">공지사항</a>
            </div>
            <div class="box box3">
              <i class="fa-solid fa-clipboard"></i>
              <a href="/admin/reports">신고 게시판 관리</a>
            </div>
          </div>
        </div>

        <div class="title">
          <i class="fa-solid fa-list"></i>
          <span class="text">TO-DO List</span>
          <i class="fa-solid fa-calendar"></i>
          </span><span class="text">Calendar</span>
        </div>
        <div class="main">
          <div class="main-todo">
            <!-- To-Do List -->
            <details open>
              <summary>
                <div class="todo-top">
                  <h4>TO-DO List</h4>
                  <input
                    type="text"
                    id="input"
                    placeholder="Today 업무"
                    onKeypress="javascript:if(event.keyCode==13) click_event();"
                  />
                  <button
                    type="button"
                    class="fas fa-plus"
                    onclick="click_event();"
                  ></button>
                </div>
              </summary>
              <div id="list"></div>
            </details>

            <details open>
              <summary><h4 class="middle">처리 완료</h4></summary>
              <div id="done"></div>
            </details>
          </div>

          <div class="main-calendar">
            <!-- 캘린더 -->
            <table class="Calendar">
              <thead>
                <tr>
                  <td onClick="prevCalendar();" style="cursor: pointer">
                    &#60;
                  </td>
                  <td colspan="5">
                    <span id="calYear"></span>년
                    <p><span id="calMonth"></span>월</p>
                  </td>
                  <td onClick="nextCalendar();" style="cursor: pointer">
                    &#62;
                  </td>
                </tr>
                <tr>
                  <td>일</td>
                  <td>월</td>
                  <td>화</td>
                  <td>수</td>
                  <td>목</td>
                  <td>금</td>
                  <td>토</td>
                </tr>
              </thead>
              <tbody></tbody>
            </table>
          </div>
        </div>
      </div>
    </section>

  </body>
</html>
