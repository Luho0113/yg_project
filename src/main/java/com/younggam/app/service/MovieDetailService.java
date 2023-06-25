package com.younggam.app.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.boot.configurationprocessor.json.JSONArray;
import org.springframework.boot.configurationprocessor.json.JSONObject;
import org.springframework.stereotype.Service;

import com.mysql.cj.xdevapi.JsonArray;
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

	// 배우 정보 추출 : 배우명, 배역명, 포스터
	public List<CastVO> getCast(String movieId) {
		// 데이터를 파싱해서 VO객체에 저장한 뒤 List에 저장
		List<CastVO> castList = new ArrayList<>(); // credits에 movieId를 검색한 내용

		try {
			OkHttpClient client = new OkHttpClient();

			Request request = new Request.Builder()
					.url("https://api.themoviedb.org/3/movie/" + movieId + "/credits?language=ko-KR").get()
					.addHeader("accept", "application/json")
					.addHeader("Authorization",
							"Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4ZGE0NzZkY2EyOTk4Y2MwYWNiN2U2MzU5NjMzMDhhNSIsInN1YiI6IjY0NzM2ZTJkOTQwOGVjMDBlMTRjZGVhNSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.rmNtSzDfgUgipyAKkyWki-Jrae8kipwRPI9ISiHdpzM")
					.build();

			Response response = client.newCall(request).execute();

			// 요청 결과를 JSON 형식으로 변경
			JSONObject jsonObject = new JSONObject(response.body().string()); // String 형식을 JSON 형식으로 변환한다.
			JSONArray castsJson = jsonObject.getJSONArray("cast"); // jsonObject의 JSON배열{~~} 중 "cast"로 되어있는 것을 하나하나
																	// castsJson배열에 담는다.
			// JSON 형식으로 만들어진 jsonObject에서 cast[]를 뽑아서 cast에 담는다.

			// for문으로 "name" 키에 맞는 값 "사람이름"을 가져와서 (JSONObject)object를 이용해서 castVO의 actor에 값을
			// 저장한다.
			for (int i = 0; i < 10; i++) {
				CastVO castvo = new CastVO();
				JSONObject object = castsJson.getJSONObject(i); // JSONArray를 하나씩(i) 꺼내서 JSONObject로 변경해서 object에서 Key로
																// value를 뽑는 방식이다.
				castvo.setActor(object.getString("name"));
				castvo.setCharacter(object.getString("character"));
				castvo.setProfilePath(object.getString("profile_path"));

				castList.add(castvo);
			} // end of for
				// castVO에 저장된 값을 castList에 담는다.

			/*
			 * 10번째 배우만 계속 나온다 castList.add(castvo);를 for 안에 넣으면 10번째 배우가 한번 나온다 CastVO
			 * castvo = new CastVO();와 castList.add(castvo); 위치 수정 참고 :
			 * https://its21c.net/248
			 */

		} catch (Exception e) {
			System.err.println(e.toString());
		}
		return castList;
	}

	// 영화 정보
	// 나라,장르 등 때문에 이것도 map 사용
	public List<MovieVO> getMovieDetail(String movieId) {
		List<MovieVO> movieDataList = new ArrayList<>(); // detail에 MovieId를 검색한 내용
		try {

			OkHttpClient client = new OkHttpClient();

			Request request = new Request.Builder()
					.url("https://api.themoviedb.org/3/movie/" + movieId + "?language=ko-KR").get()
					.addHeader("accept", "application/json")
					.addHeader("Authorization",
							"Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4ZGE0NzZkY2EyOTk4Y2MwYWNiN2U2MzU5NjMzMDhhNSIsInN1YiI6IjY0NzM2ZTJkOTQwOGVjMDBlMTRjZGVhNSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.rmNtSzDfgUgipyAKkyWki-Jrae8kipwRPI9ISiHdpzM")
					.build();

			Response response = client.newCall(request).execute();

			// 요청 결과를 JSON 형식으로 변경
			JSONObject jsonObject = new JSONObject(response.body().string()); // String 형식을 JSON 형식으로 변환한다.
			// JSONArray movieDataJson = jsonObject.getJSONArray("cast"); //jsonObject의
			// JSON배열{~~} 중 "cast"로 되어있는 것을 하나하나 castsJson배열에 담는다.
			// JSON 형식으로 만들어진 jsonObject에서 cast[]를 뽑아서 cast에 담는다.

			MovieVO movieVO = new MovieVO();
			MovieService movieService = new MovieService();

			movieVO.setTitle(jsonObject.getString("title"));
			movieVO.setPosterPath(jsonObject.getString("poster_path"));// 영화포스터
			movieVO.setReleaseDate(jsonObject.getString("release_date"));// 개봉일
			movieVO.setGenreIds(movieService.getGenres(movieId));// 장르
			movieVO.setProductionConturies(movieService.getConturies(movieId));// 국가
			movieVO.setRuntime(jsonObject.getString("runtime"));// 상영시간
			movieVO.setOriginalTitle(jsonObject.getString("original_title")); // 원제
			movieVO.setOverview(jsonObject.getString("overview"));// 오버뷰

			/* 감독명이 안나왔었는데 MovieService 생성 후 무비서비스틔 겟크레딧메소드에 movieId를 담아 감독명을 저장함 */
			movieVO.setDirectors(movieService.getCredit(movieId));

			movieDataList.add(movieVO);

		} catch (Exception e) {
			log.error("error=>{}", e);
		}
		return movieDataList;
	}

	// 영화 등급
	// java.lang.NumberFormatException: For input string: "certification" 너무 마음이
	// 아프다..

	public List<MovieVO> getMovieCertification(String movieId) {
		List<MovieVO> movieCertificationList = new ArrayList<>(); // detail에 MovieId를 검색한 내용
		try {

			OkHttpClient client = new OkHttpClient();

			Request request = new Request.Builder()
					.url("https://api.themoviedb.org/3/movie/" + movieId + "/release_dates").get()
					.addHeader("accept", "application/json")
					.addHeader("Authorization",
							"Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4ZGE0NzZkY2EyOTk4Y2MwYWNiN2U2MzU5NjMzMDhhNSIsInN1YiI6IjY0NzM2ZTJkOTQwOGVjMDBlMTRjZGVhNSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.rmNtSzDfgUgipyAKkyWki-Jrae8kipwRPI9ISiHdpzM")
					.build();

			Response response = client.newCall(request).execute();

			// 요청 결과를 JSON 형식으로 변경
			JSONObject jsonObject = new JSONObject(response.body().string()); // String 형식을 JSON 형식으로 변환한다.
			JSONArray results = jsonObject.getJSONArray("results");
			MovieVO movieVO = new MovieVO();

			for (int i = 0; i < results.length(); i++) {
				JSONObject object = results.getJSONObject(i);

				if (object.getString("iso_3166_1").equalsIgnoreCase("KR")) {

					JSONArray releaseDates = object.getJSONArray("release_dates");
					//

					for (int j = 0; j < releaseDates.length(); j++) {
						JSONObject object2 = releaseDates.getJSONObject(j);

						if (object2.has("certification") && object2.getString("type").equalsIgnoreCase("3")) {
							movieVO.setCertification(object2.optString("certification"));
						}
					}
					movieCertificationList.add(movieVO);
					break;
				}

			}

		} catch (Exception e) {
			log.error("error=>{}", e);
		}
		return movieCertificationList;
	}

	// 박스오피스
	public List<MovieVO> getNowPlaying(String s) {
		List<MovieVO> nowPlayingList = new ArrayList<>();

		try {

			OkHttpClient client = new OkHttpClient();

			Request request = new Request.Builder()
					.url("https://api.themoviedb.org/3/movie/now_playing?language=ko-KR&page=1").get()
					.addHeader("accept", "application/json")
					.addHeader("Authorization",
							"Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4ZGE0NzZkY2EyOTk4Y2MwYWNiN2U2MzU5NjMzMDhhNSIsInN1YiI6IjY0NzM2ZTJkOTQwOGVjMDBlMTRjZGVhNSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.rmNtSzDfgUgipyAKkyWki-Jrae8kipwRPI9ISiHdpzM")
					.build();

			Response response = client.newCall(request).execute();

			JSONObject jsonObject = new JSONObject(response.body().string());
			JSONArray jsonArray = jsonObject.getJSONArray("results");

			for (int i = 0; i < jsonArray.length(); i++) {
				JSONObject jsonObject1 = jsonArray.getJSONObject(i);

				MovieVO movieVO = new MovieVO();
				movieVO.setTitle(jsonObject1.getString("title"));
				movieVO.setPosterPath(jsonObject1.getString("poster_path"));

				nowPlayingList.add(movieVO);
			}

//	         OkHttpClient client = new OkHttpClient();
//
//	         Request request = new Request.Builder()
//	           .url("https://api.themoviedb.org/3/movie/now_playing?language=ko-KR&page=1")
//	           .get()
//	           .addHeader("accept", "application/json")
//	           .addHeader("Authorization", "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4ZGE0NzZkY2EyOTk4Y2MwYWNiN2U2MzU5NjMzMDhhNSIsInN1YiI6IjY0NzM2ZTJkOTQwOGVjMDBlMTRjZGVhNSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.rmNtSzDfgUgipyAKkyWki-Jrae8kipwRPI9ISiHdpzM")
//	           .build();
//
//	         Response response = client.newCall(request).execute();
//
//	         //요청 결과를 JSON 형식으로 변경 
//	         JSONObject jsonObject = new JSONObject(response.body().string()); //String 형식을 JSON 형식으로 변환한다.
//	         JSONArray results = jsonObject.getJSONArray("results"); 
//	         
//	     
//	         for(int i = 0; i <results.length(); i++) {
//	            MovieVO movieVO = new MovieVO();
//	            //JSONObject object = results.getJSONObject(i); //JSONArray를 하나씩(i) 꺼내서 JSONObject로 변경해서 object에서 Key로 value를 뽑는 방식이다.
//	            
//	            movieVO.setTitle(movieId);
//	            movieVO.setPosterPath(movieId);
//	       
//	            nowPlayingList.add(movieVO);
//	         }//end of for

		} catch (Exception e) {
			System.err.println(e.toString());
		}
		return nowPlayingList;
	}

}