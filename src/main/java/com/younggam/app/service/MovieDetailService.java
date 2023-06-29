package com.younggam.app.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.boot.configurationprocessor.json.JSONArray;
import org.springframework.boot.configurationprocessor.json.JSONObject;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
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
			JSONObject jsonObject = new JSONObject(response.body().string()); 
			JSONArray castsJson = jsonObject.getJSONArray("cast"); 

			for (int i = 0; i < 6; i++) {
				CastVO castvo = new CastVO();
				JSONObject object = castsJson.getJSONObject(i); 

				castvo.setActor(object.getString("name"));
				castvo.setCharacter(object.getString("character"));
				castvo.setProfilePath(object.getString("profile_path"));


				castList.add(castvo);

			} // end of for

		} catch (Exception e) {	 System.err.println(e.toString());  }

		return castList;

	}

	// 영화 정보
	public MovieVO getMovieDetail(String movieId) {

		MovieVO movieVO = new MovieVO(); // detail에 MovieId를 검색한 내용

		try {

			OkHttpClient client = new OkHttpClient();

			Request request = new Request.Builder()
					.url("https://api.themoviedb.org/3/movie/" + movieId + "?language=ko-KR").get()
					.addHeader("accept", "application/json")
					.addHeader("Authorization",
							"Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4ZGE0NzZkY2EyOTk4Y2MwYWNiN2U2MzU5NjMzMDhhNSIsInN1YiI6IjY0NzM2ZTJkOTQwOGVjMDBlMTRjZGVhNSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.rmNtSzDfgUgipyAKkyWki-Jrae8kipwRPI9ISiHdpzM")
					.build();

			Response response = client.newCall(request).execute();

			JSONObject jsonObject = new JSONObject(response.body().string()); 

			MovieService movieService = new MovieService();

			movieVO.setId(jsonObject.getString("id"));
			movieVO.setTitle(jsonObject.getString("title"));
			movieVO.setPosterPath(jsonObject.getString("poster_path")); // 영화포스터
			movieVO.setReleaseDate(jsonObject.getString("release_date")); // 개봉일
			movieVO.setRuntime(jsonObject.getString("runtime")); // 상영시간
			movieVO.setOriginalTitle(jsonObject.getString("original_title")); // 원제
			movieVO.setOverview(jsonObject.getString("overview")); // 오버뷰

			movieVO.setGenreIds(movieService.getGenres(movieId)); // 장르
			movieVO.setProductionConturies(movieService.getConturies(movieId)); // 국가

			movieVO.setDirectors(movieService.getCredit(movieId));


		} catch (Exception e) {
			log.error("error=>{}", e);
		}
		return movieVO;
	}

	// 영화 등급

	public List<MovieVO> getMovieCertification(String movieId) {
		List<MovieVO> movieCertificationList = new ArrayList<>();
		try {

			OkHttpClient client = new OkHttpClient();

			Request request = new Request.Builder()
					.url("https://api.themoviedb.org/3/movie/" + movieId + "/release_dates").get()
					.addHeader("accept", "application/json")
					.addHeader("Authorization",
							"Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4ZGE0NzZkY2EyOTk4Y2MwYWNiN2U2MzU5NjMzMDhhNSIsInN1YiI6IjY0NzM2ZTJkOTQwOGVjMDBlMTRjZGVhNSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.rmNtSzDfgUgipyAKkyWki-Jrae8kipwRPI9ISiHdpzM")
					.build();

			Response response = client.newCall(request).execute();

			JSONObject jsonObject = new JSONObject(response.body().string()); 
			JSONArray results = jsonObject.getJSONArray("results");
			
			MovieVO movieVO = new MovieVO();

			for (int i = 0; i < results.length(); i++) {
				
				JSONObject object = results.getJSONObject(i);

				if (object.getString("iso_3166_1").equalsIgnoreCase("KR")) {

					JSONArray releaseDates = object.getJSONArray("release_dates");

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



}