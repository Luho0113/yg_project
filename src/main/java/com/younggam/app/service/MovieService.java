package com.younggam.app.service;

import java.util.Map;

import org.springframework.boot.configurationprocessor.json.JSONArray;
import org.springframework.boot.configurationprocessor.json.JSONObject;
import org.springframework.stereotype.Service;

import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;

@Service
public class MovieService {
	
	private String frontUrl = "https://api.themoviedb.org/3/search/movie?query="; //요청 주소 앞 부분
	private String backUrl = "&include_adult=false&language=ko-KR&page=1"; //요청 주소 뒷 부분
	private String searchKeyword = "행오버"; //검색어
	private String message;
	
	public String get(Map<String, String> param) {
		try {
			
			//searchKeyword = param.toString(); //이거 해결
			OkHttpClient client = new OkHttpClient();

			Request request = new Request.Builder()
			  .url(frontUrl + searchKeyword + backUrl)
			  .get()
			  .addHeader("accept", "application/json")
			  .addHeader("Authorization", "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4ZGE0NzZkY2EyOTk4Y2MwYWNiN2U2MzU5NjMzMDhhNSIsInN1YiI6IjY0NzM2ZTJkOTQwOGVjMDBlMTRjZGVhNSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.rmNtSzDfgUgipyAKkyWki-Jrae8kipwRPI9ISiHdpzM")
			  .build();
 
                        
      //동기 처리시 execute함수 사용 
			Response response = client.newCall(request).execute();
			
			//출력 
			message = response.body().string(); //?
			
			JSONObject userJson = new JSONObject(message); //String > JSON
			JSONArray results = userJson.getJSONArray("results"); //JSON에서 results[] 뽑아서 results에 담음
			
			  for(int i =0; i <results.length(); i++){

			      JSONObject object  = results.getJSONObject(i);

			      String movieTitle = object.getString("title");
			      String movieId = object.getString("id");
			      String movieOverview = object.getString("overview");
			      String moviePoster = object.getString("poster_path");
			      
			      //위에 입력 받은 값을 리스트(?)로 만들어서 저장한 다음에 리턴을 하면 됨
			      //1. 결과 전체 리스트
			      //2. 1에서 각 값에 필요 정보만 담아서 다시 배열 생성
			      // 결과적으로 2 >> 1 순으로 리스트를 생성해서 담아야 한다. 
			      

			}
			
		} catch (Exception e){
			System.err.println(e.toString());
		}
		return message;
	}//end of get()

	public void dataParsing() {
		
	}
	
	
}