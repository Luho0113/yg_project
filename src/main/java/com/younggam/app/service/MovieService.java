package com.younggam.app.service;

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

	private String title;
	
	public String get(Map<String, String> param) {
		try {
			
			String frontUrl = "https://api.themoviedb.org/3/search/movie?query="; //요청 주소 앞 부분(movie search 용도)(search/multi?query= 로 변경하면 다 찾을 수 있다. 대신 로직 수정 필요하다.)
			String backUrl = "&include_adult=false&language=ko-KR&page=1"; //요청 주소 뒷 부분
			String searchKeyword = param.get("search"); //search.jsp의 name="search"의 value를 가져온다. 
			//위에 있는 3개의 변수를 합쳐서 TMDB API를 요청할 수 있다. 
			
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
			//.string(): 응답 본문을 닫는다.	(닫지 않으면 문제가 생길 수 있다고 한다.)		
			
			
			  for(int i =0; i <results.length(); i++){

			      JSONObject object  = results.getJSONObject(i);
			      
			      //Map<String, Object> map = (Map<String, Object>) object.get("message"); //해결 필요
			      //Map<String, Object> map1 = (Map<String, Object>) map.get("title"); //해결 필요
			      
			      title = object.getString("title");
			      String id = object.getString("id");
			      String overview = object.getString("overview");
			      String poster_path = object.getString("poster_path");
			     
			      //위에 입력 받은 값을 리스트(?)로 만들어서 저장한 다음에 리턴을 하면 됨
			      //1. 결과 전체 리스트
			      //2. 1에서 각 값에 필요 정보만 담아서 다시 배열 생성
			      // 결과적으로 2 >> 1 순으로 리스트를 생성해서 담아야 한다. 
			}
			
			
			
		} catch (Exception e){
			System.err.println(e.toString());
		}
		return title;
	}//end of get()

	public Map<String, String> dataParsing(JSONArray results) {
		Map<String, String> map = null;
		try {
			
			for(int i = 0; i < results.length(); i++) {
				map.put("id", results.getJSONObject(i).getString("id")); //영화 아이디
				map.put("original_title", results.getJSONObject(i).getString("original_title")); //영화 원제
				map.put("overview", results.getJSONObject(i).getString("overview")); //영화 줄거리
				map.put("poster_path", results.getJSONObject(i).getString("poster_path")); //영화 포스터(URL 일부만 들어 있음)
				map.put("release_date", results.getJSONObject(i).getString("release_date")); //영화 개봉일
				map.put("title", results.getJSONObject(i).getString("title")); //영화 한국어 제목
				
				//TO DO: 이제 map을 배열에 넣기
				
			}//end of for
				
		} catch (JSONException e) {
				e.printStackTrace();
				
		}//end of catch
		return map;
	}//end of dataParsing()
	
	
}//end of class