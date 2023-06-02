package com.younggam.app.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.boot.configurationprocessor.json.JSONArray;
import org.springframework.boot.configurationprocessor.json.JSONException;
import org.springframework.boot.configurationprocessor.json.JSONObject;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;

@Service
@Slf4j
public class MovieService {
  
   public List<Map<String, String>> get(Map<String, String> param) {
	  Map<String, String> map = new HashMap<>();
	  List<Map<String, String>> movieList = new ArrayList<>();
      try {
         
    	 //영화 검색 요청 주소 시작 ---
         String frontUrl = "https://api.themoviedb.org/3/search/movie?query="; //요청 주소 앞 부분(movie search 용도)(search/multi?query= 로 변경하면 다 찾을 수 있다. 대신 로직 수정 필요하다.)
         String backUrl = "&include_adult=false&language=ko-KR&page=1"; //요청 주소 뒷 부분
         String searchKeyword = param.get("search"); //search.jsp의 name="search"의 value를 가져온다. 
         //위에 있는 3개의 변수를 합쳐서 TMDB API를 요청할 수 있다. 
         //--- 영화 검색 요청 주소 끝

         
         //TMDB API를 요청 준비
         OkHttpClient client = new OkHttpClient(); //API 요청하는 사람(?)을 생성한다. 

         //TMDB API에 주문할 내용 작성("나는 이런 걸 원해요!")
         Request request = new Request.Builder()
           .url(frontUrl + searchKeyword + backUrl) //query=(내가 찾고 싶은 영화 제목)에 값을 넣어 TMDB API로 요청할 url을 생성한다. 
           .get()
           .addHeader("accept", "application/json") 
           .addHeader("Authorization", "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4ZGE0NzZkY2EyOTk4Y2MwYWNiN2U2MzU5NjMzMDhhNSIsInN1YiI6IjY0NzM2ZTJkOTQwOGVjMDBlMTRjZGVhNSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.rmNtSzDfgUgipyAKkyWki-Jrae8kipwRPI9ISiHdpzM")
           .build();
                        
         //TMDB API를 요청
         Response response = client.newCall(request).execute(); //앞서 생성한 request를 넣어 TMDB API를 요청한다. ("전화 걸기")
                                                   //.execute()니까 동기 방식이고 그 결과를 어떻게 할 것인지 아래에서 처리한다. 
         
         //요청 결과를 JSON 형식으로 변경 
         JSONObject jsonObject = new JSONObject(response.body().string()); //String 형식을 JSON 형식으로 변환한다.
         JSONArray results = jsonObject.getJSONArray("results"); //JSON 형식으로 만들어진 jsonObject에서 results[]를 뽑아서 results에 담는다.
         
         
         //위 코드의 세부적인 의미는 아래와 같다.
         //response.body(): 반환 결과(응답 본문)를 읽는다. 
         //.string(): 응답 본문을 닫는다.   (닫지 않으면 문제가 생길 수 있다고 한다.)      
         
         movieList = dataParsing(results);
         
         
         
      } catch (Exception e){
         System.err.println(e.toString());
      }
      return movieList;
   }//end of get()

   public List<Map<String, String>> dataParsing(JSONArray results) {
	  
	  List<Map<String, String>> movieList = new ArrayList<>();
      try {
         
         for(int i = 0; i < results.length(); i++) {
        	 Map<String, String> map = new HashMap<>(); //for문 안에 선언하기!!
        	 
        	 JSONObject object  = results.getJSONObject(i); //JSONArray를 하나씩(i) 꺼내서 JSONObject로 변경해서 object에서 Key로 value를 뽑는 방식이다.
        	 
        	 map.put("id", object.getString("id")); //영화 아이디
        	 map.put("original_title", object.getString("original_title")); //영화 원제
        	 map.put("overview", object.getString("overview")); //영화 줄거리
        	 map.put("poster_path", object.getString("poster_path")); //영화 포스터(URL 일부만 들어 있음)
        	 map.put("release_date", object.getString("release_date")); //영화 개봉일
        	 map.put("title", object.getString("title")); //영화 한국어 제목
        	 
        	 movieList.add(i, map);
            
         }//end of for
            
      } catch (JSONException e) {
            e.printStackTrace();
            
      }//end of catch
      return movieList;
   }//end of dataParsing()
   
   
}//end of class