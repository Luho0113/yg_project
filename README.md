# YoungGam Web Project
영감 웹 개발 프로젝트


![thumbnail](https://github.com/Luho0113/yg_project/assets/65997312/d922740f-efe3-4f7c-b84e-490ad0efa933)




## 🍊목차
* [프로젝트 소개](#🍊-프로젝트-소개)
  - 개요
  - 주제 선정
  - 팀 소개   
* [개발환경 및 사용기술](#🍊-개발환경-및-사용기술)
* [흐름도](#🍊-흐름도)
  - 사용자 화면
  - 관리자 화면
* [ERD](#🍊-ERD)
* [요구사항 정의서](#🍊-요구사항-정의서)
* [웹페이지 구성](#🍊-웹페이지-구성)
* [후기](#🍊-후기)
* [개발일지](#🍊-개발일지)
* [이슈 관리](#🍊-이슈-관리)




## 🍊 프로젝트 소개
영화를 좋아하는 사람들이 모여서 만든 웹사이트입니다. 프로젝트의 이름은 영화감상의 앞 글자 '영'과 '감'을 따와 영감(靈感)을 얻는다는 뜻으로 지었습니다.

영화를 보고나서 다양한 영감들을 기록하며 서로 다른 관점들을 통해 새로운 영감을 얻고 소통하는 공간을 목표로 개발했습니다. 

자신의 영감을 찾아보세요.


### 🌱 사이트 목적
- 영화를 검색하여 원하는 영화 정보를 얻을 수 있다.
- 영화에 대한 댓글을 남기고, 다른 사람의 후기에 댓글을 달 수 있다.


### 👴 팀 소개
| 이름 | 역할 | Github |
|----|-----|------------|
| 박정은 | 팀장 | [Luho0113](https://github.com/Luho0113) |
| 김예리 | 팀원 | [dhdrhdqkdl515](https://github.com/dhdrhdqkdl515) |
| 윤은진 | 팀원 | [yoooneunjin](https://github.com/yoooneunjin) |
| 이수지 | 팀원 | [comput3202](https://github.com/comput3202) |




## 🍊 개발환경 및 사용기술


#### Programming Language
  - JAVA 17, HTML, CSS, JavaScript, JQuery, JSP
#### Framework
  - Spring Boot 2.7.12
  - Eclipse IDE
  - Mybatis 2.3.1
#### Build Tool
  - Gradle
#### Database
  - MySQL
#### API
  - TMDB
 
 
 
 
## 🍊 흐름도
전체적인 화면 흐름의 설계 및 구조 (Flow chart)

#### 🌱 사용자 화면
![user-page](https://github.com/Luho0113/yg_project/assets/65997312/b2447d00-af5a-45ae-8366-acbd5c40f01c)

#### 🌱 관리자 화면
![admin-page](https://github.com/Luho0113/yg_project/assets/65997312/668e2137-2eda-4cbe-a3f6-529b11b7c91c)




## 🍊 ERD 
데이터베이스 모델링(개체-관계 다이어그램, Entity Relationship Diagram)
![erd](https://github.com/Luho0113/yg_project/assets/65997312/d84e6b73-86ce-4ffd-b0aa-bc66b5247908)




## 🍊 요구사항 정의서
![요구사항정의서](https://github.com/Luho0113/yg_project/assets/65997312/d3b147b3-1a63-4ebf-8e56-af29ac65680e)




## 🍊 웹페이지 구성


### 메인 화면 
![main1](https://github.com/Luho0113/yg_project/assets/65997312/da23e33a-537f-4531-abf9-b0c4ac0eb306)
![main3](https://github.com/Luho0113/yg_project/assets/65997312/eee8ff65-83b9-4157-972d-ea3627445922)


### 회원 가입
#### 회원 가입 성공
![join](https://github.com/Luho0113/yg_project/assets/65997312/58f9c718-eb0d-46d8-8c52-55a3007cda5a)
#### 중복된 계정
![joinFail1](https://github.com/Luho0113/yg_project/assets/65997312/6e971e1d-d0db-4323-9b9e-bc9bc6059dfc)
#### 올바르지 않은 양식
![joinFail2](https://github.com/Luho0113/yg_project/assets/65997312/ea95fa4e-a6e1-483f-8efc-6d1a22edb6f3)


### 로그인
#### 로그인 성공
![loginSuccess](https://github.com/Luho0113/yg_project/assets/65997312/f20336f3-60f5-4338-804e-dee0404b57a8)
#### 로그인 실패
![loginFail](https://github.com/Luho0113/yg_project/assets/65997312/aa237a85-c4ba-4dce-943e-14671c2e640e)


### 내 프로필
#### 작성한 후기, 댓글 조회
![mypage1](https://github.com/Luho0113/yg_project/assets/65997312/6bb476ca-546c-4147-b0aa-de67bc7be56e)
#### 작성한 후기, 댓글 삭제
![mypage2](https://github.com/Luho0113/yg_project/assets/65997312/ed175866-a844-4073-ac63-873e8e6775bb)
![mypage3](https://github.com/Luho0113/yg_project/assets/65997312/e24864fb-6af8-4eab-9470-1fb60e93c67e)


### 내 프로필 수정
![profileImgUpdate](https://github.com/Luho0113/yg_project/assets/65997312/3c5cea46-9739-4458-8641-bf7f644e9aad)
![profileNicknameUpdate](https://github.com/Luho0113/yg_project/assets/65997312/7a8d2007-fcb1-4400-9c17-8e2413e808b9)


### 영화 후기 목록
#### 최신순/오래된순
![movieList1](https://github.com/Luho0113/yg_project/assets/65997312/c920b828-2e32-4379-bc70-b2a204c6e1ac)
#### 장르별
![movieList2](https://github.com/Luho0113/yg_project/assets/65997312/0aca5bf8-3162-4a3c-a8cb-93f3585b92eb)


### 영화 검색
#### 검색 결과
![movieSearch3](https://github.com/Luho0113/yg_project/assets/65997312/ae990cb7-efe6-4b39-8b0e-86b5aa17fb42)
#### 결과가 없는 경우
![movieSearch2](https://github.com/Luho0113/yg_project/assets/65997312/5a88df7e-4f1c-4e2e-a20e-a5dd06125a90)


### 후기 작성
#### 내 프로필에서 작성
![reviewInsert1](https://github.com/Luho0113/yg_project/assets/65997312/ded0fe25-6621-4fb4-b54b-c97360650ba5)
#### 메뉴에서 작성
![reviewInsert2(spoil)](https://github.com/Luho0113/yg_project/assets/65997312/46cdcd13-6fe8-44c9-95bc-2b1881524362)



### 댓글 작성
![commentInsert](https://github.com/Luho0113/yg_project/assets/65997312/dfd730c7-59aa-4af4-b456-b9f5374778d0)

### 사용자 신고
#### 신고하기
![userReport](https://github.com/Luho0113/yg_project/assets/65997312/38467986-a4d4-4214-85a9-c9e3a1c84535)
#### 신고게시판
![reportView](https://github.com/Luho0113/yg_project/assets/65997312/c9756162-0a37-42ac-8623-bcffcf3f8674)


### 사이트 안내
![about](https://github.com/Luho0113/yg_project/assets/65997312/a47dbf47-af63-4d21-8262-4695b72c4b37)


### 로그인이 필요한 경우
![needLogin](https://github.com/Luho0113/yg_project/assets/65997312/bc05cb6e-8f66-4e87-b078-10bb44f3e3cb)


### 그 외 예기치 못한 오류
![error404](https://github.com/Luho0113/yg_project/assets/65997312/fa765941-5f18-43e9-a173-56880a19b904)


### 관리자 로그인
#### 로그인 성공
![adminLogin](https://github.com/Luho0113/yg_project/assets/65997312/0553effa-516d-4415-a84f-ca265a64275b)
#### 로그인 실패
![adminLoginFail](https://github.com/Luho0113/yg_project/assets/65997312/78f92671-266c-42bf-96cd-ad10c85fb4fe)


### 관리자 프로필 수정
#### 이름 수정
![adminNameUpdate](https://github.com/Luho0113/yg_project/assets/65997312/695eaedc-c5a8-4fc9-8c62-fba75bc738c6)
#### 프로필 사진 수정
![adminImgUpdate](https://github.com/Luho0113/yg_project/assets/65997312/1ba8288f-dec7-4b73-8e51-4773ce8d7d93)


### 회원 목록
![adminUserList](https://github.com/Luho0113/yg_project/assets/65997312/59885372-9fa8-4c87-8b93-3f3dfcac05e3)


### 회원 비활성화
#### 회원 정지시키기
![adminInActiveUserLogin](https://github.com/Luho0113/yg_project/assets/65997312/41c4bbfa-9721-47d5-9726-c0d23aae1560)
#### 정지된 계정의 로그인
![adminInActiveUpdate](https://github.com/Luho0113/yg_project/assets/65997312/3e83fd47-4159-4ad7-aa19-1e7a992337d0)

### 공지사항 관리
#### 공지사항 등록/삭제
![adminNotice](https://github.com/Luho0113/yg_project/assets/65997312/5bd8186a-abc6-4235-845e-3324d29cd53d)
#### 공지사항 검색
![adminNoticeSearch](https://github.com/Luho0113/yg_project/assets/65997312/f40a5166-e170-40b8-a8f9-2a9befd804b4)


### 신고 게시판 관리
![adminReportSearch](https://github.com/Luho0113/yg_project/assets/65997312/99b240df-0c2e-47b9-bf62-38dcddcc0cdc)



## 🍊 후기
<details>
<summary>김예리</summary>
아무 것도 없는 무의 상태에서 유를 창조해 낸 팀원들 정말 자랑스럽습니다.<br>
모르는 것이 있으면 서로 적극적으로 도와주고 훈훈했습니다.<br>
수차례 고난과 역경이 있었지만, 다들 구현을 해내는 모습에 뿌듯했습니다.<br>
이 프로젝트를 시작으로, 앞으로 팀원들 모두 커리어가 승승장구하길 진심으로 바랍니다.
</details>
<details>
<summary>박정은</summary>
처음 시작한 웹 프로젝트라서 초반에 설계했던 것을 100% 구현하지는 못했지만 그동안 팀원들과 의견을 조율하고 자주 피드백하면서 같이 공부해나가는 것이 즐거웠습니다. 
이번 프로젝트를 통해 개발자란 단순히 개발만 잘하는 것이 아니라 사용자 관점에서 세세한 불편함들을 미리 생각해야 하고 고려해야 한다는 점을 깨달았습니다. 
그리고 이러한 것들을 실제로 반영하면서 개발하는 것이 어려웠습니다. 다음엔 보안이나 다른 api와 연동해서 작업하는 것을 처음 설계부터 제대로 해보고 싶습니다.
그동안 고생한 팀원분들께 감사드립니다!
</details>
<details>
<summary>윤은진</summary>
</details>
<details>
<summary>이수지</summary>
  팀원들과 스프링부트 프로젝트를 하면서 한층 더 성장하는 기회를 가지게 되어 좋았습니다.
  특히 TMDB API에 대해 공부하고 실습하는 과정이 저에게 좋은 경험이었습니다.
  아쉬웠던 점은 DB설계나 화면설계 등 초반에 이루어졌던 작업들이 생각보다 부실했다는 것 입니다. 다음 프로젝트에서는 설계 부분을 좀 더 세심하게 신경써야겠다는 생각을 했습니다.
</details>



## 🍊 개발일지
#### 프로젝트 일정
![project-plan](https://github.com/Luho0113/yg_project/assets/65997312/7ce19e61-d910-461a-a3fd-ddffed343638)
#### WBS
![wbs](https://github.com/Luho0113/yg_project/assets/65997312/dc6688a9-f08f-489e-a76b-d1b51a8fb088)

 

## 🍊 이슈(Issue) 관리
![TroubleShooting_page](https://github.com/Luho0113/yg_project/assets/65997312/4344a006-2e3b-446b-bba7-baf0e815aef9)

