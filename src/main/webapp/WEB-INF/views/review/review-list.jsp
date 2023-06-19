<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화록록</title>
<link rel="stylesheet" href="${path}/resources/css/common/header.css">
<link rel="stylesheet" href="${path}/resources/css/common/footer.css">
<link rel="stylesheet" href="${path}/resources/css/common/page.css">
<link rel="stylesheet" href="${path}/resources/css/review/review-star.css">
<link rel="stylesheet" href="${path}/resources/css/review/review-list.css">
</head>
<body>
<!-- header area -->
<jsp:include page="../common/header.jsp"></jsp:include>

<!-- content area -->
     <div class="riShorSelect" id="riShorSelect">

    </div>



    <div class="riGenreBar" id="riGenreBar">
        <ul>
            <li>전체</li>
            <li>액션</li>
            <li>모험</li>
            <li>애니메이션</li>
            <li>코미디</li>
            <li>범죄</li>
            <li>다큐멘터리</li>
            <li>드라마</li>
            <li>가족</li>
            <li>판타지</li>
            <li>역사</li>
            <li>공포</li>
            <li>음악</li>
            <li>미스터리</li>
            <li>로맨스</li>
            <li>SF</li>
            <li>TV 영화</li>
            <li>스릴러</li>
            <li>전쟁</li>
            <li>서부</li>
        </ul>
    </div>




    <div class="riListContainer" id="riListContainer"><!-- riListContainer: 리뷰 목록 전체를 묶는 div -->

        <div class="riListElement" id="riListElement"><!-- riListElement: 리뷰 하나의 내용을 묶는 div  --><!-- 이걸 반복 생성하면 되지 않을까  -->

            <div class="riListPoster" id="riListPoster"><!-- riListPoster: riListElement에 들어갈 포스터를 묶는 div  -->
                <img id="posterPath" src="https://image.tmdb.org/t/p/original/b7epV2cQZVIR4u5VZraDwD0AgiE.jpg"><!-- posterPath: 포스터 img  -->
            </div>

            <div class="riListMovieInfo" id="riListMovieInfo"><!-- riListMovieInfo: 영화 제목 및 연도를 표시하는 div  -->
                <span class="riMovieTitle" id="riMovieTitle">가디언즈 오브 갤럭시 Vol. 2 |</span>
                <span id="riListReleaseDate" class="riListReleaseDate">2017</span>
            </div>

            <div class="riListUserInfo" id="riListUserInfo"><!-- riListUserInfo: 작성자 프로필 이미지, 닉네임, 별점을 표시하는 div  -->
                <div class="profileBox" id="profileBox">
                    <img id="profile" src="https://i.pinimg.com/564x/1c/cf/f0/1ccff0a256a5dfd24bf32782326582f7.jpg">
                </div>

                <div class="nickName" id="nickName">
                    은진
                </div>
                
                <div class="starPoint" id="starPoint">
                <span class="star">
                    ★★★★★
                    <span>★★★★★</span>
                    <input type="range" oninput="drawStar(this)" value="1" step="1" min="0" max="10">
                </span>

                <span>(5.0)</span>
                </div>
            </div>

            <div class="riListReviewContent" id="riListReviewContent"><!-- riListReviewContent: 리뷰 그 자체,, div  -->
                가지에 별과 싸인 피다. 타오르고 품에 안고, 철환하였는가?
                꽃이 인생에 꾸며 인도하겠다는 길지 따뜻한 대중을 사막이다. 때에, 미묘한 우리는 기관과 구할 따뜻한 아니한 대중을 운다. 
                인생을 내려온 너의 쓸쓸한 인간은 말이다.
                꽃 같으며, 날카로우나 부패를 가는 군영과 모래뿐일 풍부하게 충분히 쓸쓸하랴? 피에 별과 방황하였으며, 대한 구할 풍부하게 청춘은 것이다. 
                무한한 그들에게 원대하고, 싸인 싹이 이것이야말로 운다. 
                청춘의 것은 새가 꽃이 이 만천하의 피어나기 것이다. 
                끓는 실로 그와 위하여 낙원을 같이, 날카로우나 못하다 위하여서.    
            </div>

            <div class="riListComment" id="riListComment"><!-- riListComment: 해당 리뷰의 댓글과 좋아요 수 div  -->
                ♥10 🗨2
            </div>

            <div class="riListDate" id="riListDate"><!-- riListDate: 리뷰 작성 일자 div  -->
                2023. 06. 19
            </div>
        </div>
        <div class="riListElement" id="riListElement"><!-- riListElement: 리뷰 하나의 내용을 묶는 div  --><!-- 이걸 반복 생성하면 되지 않을까  -->

            <div class="riListPoster" id="riListPoster"><!-- riListPoster: riListElement에 들어갈 포스터를 묶는 div  -->
                <img id="posterPath" src="https://image.tmdb.org/t/p/original/b7epV2cQZVIR4u5VZraDwD0AgiE.jpg"><!-- posterPath: 포스터 img  -->
            </div>

            <div class="riListMovieInfo" id="riListMovieInfo"><!-- riListMovieInfo: 영화 제목 및 연도를 표시하는 div  -->
                <span class="riMovieTitle" id="riMovieTitle">가디언즈 오브 갤럭시 Vol. 2 |</span>
                <span id="riListReleaseDate" class="riListReleaseDate">2017</span>
            </div>

            <div class="riListUserInfo" id="riListUserInfo"><!-- riListUserInfo: 작성자 프로필 이미지, 닉네임, 별점을 표시하는 div  -->
                <div class="profileBox" id="profileBox">
                    <img id="profile" src="https://i.pinimg.com/564x/1c/cf/f0/1ccff0a256a5dfd24bf32782326582f7.jpg">
                </div>

                <div class="nickName" id="nickName">
                    은진
                </div>
                
                <div class="starPoint" id="starPoint">
                <span class="star">
                    ★★★★★
                    <span>★★★★★</span>
                    <input type="range" oninput="drawStar(this)" value="1" step="1" min="0" max="10">
                </span>

                <span>(5.0)</span>
                </div>
            </div>

            <div class="riListReviewContent" id="riListReviewContent"><!-- riListReviewContent: 리뷰 그 자체,, div  -->
                가지에 별과 싸인 피다. 타오르고 품에 안고, 철환하였는가?
                꽃이 인생에 꾸며 인도하겠다는 길지 따뜻한 대중을 사막이다. 때에, 미묘한 우리는 기관과 구할 따뜻한 아니한 대중을 운다. 
                인생을 내려온 너의 쓸쓸한 인간은 말이다.
                꽃 같으며, 날카로우나 부패를 가는 군영과 모래뿐일 풍부하게 충분히 쓸쓸하랴? 피에 별과 방황하였으며, 대한 구할 풍부하게 청춘은 것이다. 
                무한한 그들에게 원대하고, 싸인 싹이 이것이야말로 운다. 
                청춘의 것은 새가 꽃이 이 만천하의 피어나기 것이다. 
                끓는 실로 그와 위하여 낙원을 같이, 날카로우나 못하다 위하여서.    
            </div>

            <div class="riListComment" id="riListComment"><!-- riListComment: 해당 리뷰의 댓글과 좋아요 수 div  -->
                ♥10 🗨2
            </div>

            <div class="riListDate" id="riListDate"><!-- riListDate: 리뷰 작성 일자 div  -->
                2023. 06. 19
            </div>
        </div>


    </div>


<!-- footer area -->
<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>