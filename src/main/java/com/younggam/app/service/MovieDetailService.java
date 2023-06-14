package com.younggam.app.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.boot.configurationprocessor.json.JSONArray;
import org.springframework.boot.configurationprocessor.json.JSONObject;
import org.springframework.stereotype.Service;

import com.younggam.app.vo.CastVO;
import com.younggam.app.vo.MovieVO;

import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;

@Service
@Slf4j
public class MovieDetailService {

	//배우 정보 추출 : 배우명, 배역명, 포스터
	//!!!감독도 추출해볼까?
	public List<CastVO> getCast(String movieId) {
		//데이터를 파싱해서 VO객체에 저장한 뒤 List에 저장
		List<CastVO> castList=new ArrayList<>();
		
		try {
			OkHttpClient client = new OkHttpClient();

			Request request = new Request.Builder()
			  .url("https://api.themoviedb.org/3/movie/" + movieId + "/credits?language=ko-KR")
			  .get()
			  .addHeader("accept", "application/json")
			  .addHeader("Authorization", "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4ZGE0NzZkY2EyOTk4Y2MwYWNiN2U2MzU5NjMzMDhhNSIsInN1YiI6IjY0NzM2ZTJkOTQwOGVjMDBlMTRjZGVhNSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.rmNtSzDfgUgipyAKkyWki-Jrae8kipwRPI9ISiHdpzM")
			  .build();

			Response response = client.newCall(request).execute();

			//요청 결과를 JSON 형식으로 변경 
			JSONObject jsonObject = new JSONObject(response.body().string()); //String 형식을 JSON 형식으로 변환한다.
			JSONArray castsJson = jsonObject.getJSONArray("cast"); //jsonObject의 JSON배열{~~} 중 "cast"로 되어있는 것을 하나하나 castsJson배열에 담는다. 
			//JSON 형식으로 만들어진 jsonObject에서 cast[]를 뽑아서 cast에 담는다.     
			
			//for문으로 "name" 키에 맞는 값 "사람이름"을 가져와서 (JSONObject)object를 이용해서 castVO의 actor에 값을 저장한다.
			for(int i = 0; i < 10; i++) {
				CastVO castvo = new CastVO();
				JSONObject object = castsJson.getJSONObject(i); //JSONArray를 하나씩(i) 꺼내서 JSONObject로 변경해서 object에서 Key로 value를 뽑는 방식이다.
				castvo.setActor(object.getString("name"));	
				castvo.setCharacter(object.getString("character"));
				castvo.setProfilePath(object.getString("profile_path"));
				
				castList.add(castvo);
			}//end of for
			//castVO에 저장된 값을 castList에 담는다.
			
			/*
			 * 10번째 배우만 계속 나온다
			 * castList.add(castvo);를 for 안에 넣으면 10번째 배우가 한번 나온다
			 * CastVO castvo = new CastVO();와 castList.add(castvo); 위치 수정
			 * 참고 : https://its21c.net/248
			 * */
			
	}catch(Exception e){
		System.err.println(e.toString());
}
	return castList;
}
	
	//영화 정보
	//나라,장르 등 때문에 이것도 map 사용
	public List<MovieVO> getMovieDetail(String movieId) {
		List<MovieVO> movieDataList = new ArrayList<>();
		try { 
		
			OkHttpClient client = new OkHttpClient();

			Request request = new Request.Builder()
			  .url("https://api.themoviedb.org/3/movie/" + movieId + "?language=ko-KR")
			  .get()
			  .addHeader("accept", "application/json")
			  .addHeader("Authorization", "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4ZGE0NzZkY2EyOTk4Y2MwYWNiN2U2MzU5NjMzMDhhNSIsInN1YiI6IjY0NzM2ZTJkOTQwOGVjMDBlMTRjZGVhNSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.rmNtSzDfgUgipyAKkyWki-Jrae8kipwRPI9ISiHdpzM")
			  .build();

			Response response = client.newCall(request).execute();

			//요청 결과를 JSON 형식으로 변경 
			JSONObject jsonObject = new JSONObject(response.body().string()); //String 형식을 JSON 형식으로 변환한다.
			//JSONArray movieDataJson = jsonObject.getJSONArray("cast"); //jsonObject의 JSON배열{~~} 중 "cast"로 되어있는 것을 하나하나 castsJson배열에 담는다. 
			//JSON 형식으로 만들어진 jsonObject에서 cast[]를 뽑아서 cast에 담는다.     
			
			MovieVO movieVO = new MovieVO();
			MovieService movieService = new MovieService();
				
		
			movieVO.setTitle(jsonObject.getString("title"));
			movieVO.setOriginalTitle(jsonObject.getString("original_title"));
			movieVO.setDirectors(movieService.getCredit(movieVO.getId()));
			
			movieDataList.add(movieVO);
			
			
		}catch (Exception e) {
			log.error("error=>{}", e);
		}
		return movieDataList;
		}

}