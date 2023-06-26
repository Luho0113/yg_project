package com.younggam.app.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.boot.configurationprocessor.json.JSONArray;
import org.springframework.boot.configurationprocessor.json.JSONObject;
import org.springframework.stereotype.Service;

import com.younggam.app.vo.CastVO;
import com.younggam.app.vo.MovieVO;

import lombok.extern.slf4j.Slf4j;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;

@Service
@Slf4j
public class MovieService {
	
	//TMDB API 요청 Method (기본)
	public List<MovieVO> getMovie(Map<String, String> param) {
		List<MovieVO> movieList = new ArrayList<>();
		try {

			//영화 검색 요청 주소 시작 ---
			String frontUrl = "https://api.themoviedb.org/3/search/multi?query="; //요청 주소 앞 부분(movie search 용도)(search/multi?query= 로 변경하면 다 찾을 수 있다. 대신 로직 수정 필요하다.)
			String backUrl = "&include_adult=false&language=ko-KR&page=1"; //요청 주소 뒷 부분
			String searchKeyword = param.get("search"); //search.jsp의 name="search"의 value를 가져온다. 
			//위에 있는 3개의 변수를 합쳐서 TMDB API를 요청할 수 있다. 
			//--- 영화 검색 요청 주소 끝
			
			//초기값(NULL은 검색 결과가 있어서 처음 Method를 호출할 때 null로 초기화)
			if(searchKeyword == null) {
				searchKeyword = "";
			}

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
			String json = response.body().string();
			JSONObject jsonObject = new JSONObject(json); //String 형식을 JSON 형식으로 변환한다.
			JSONArray results = jsonObject.getJSONArray("results"); //JSON 형식으로 만들어진 jsonObject에서 results[]를 뽑아서 results에 담는다.


			//위 코드의 세부적인 의미는 아래와 같다.
			//response.body(): 반환 결과(응답 본문)를 읽는다. 
			//.string(): 응답 본문을 닫는다.   (닫지 않으면 문제가 생길 수 있다고 한다.)      

			for(int i = 0; i < results.length(); i++) {
				MovieVO movieVO = new MovieVO();
				JSONObject object  = results.getJSONObject(i); //JSONArray를 하나씩(i) 꺼내서 JSONObject로 변경해서 object에서 Key로 value를 뽑는 방식이다.

				//사람 이름을 검색했을 경우 실행
				if(object.getString("media_type").equalsIgnoreCase("person")) {
					JSONArray knownFor = object.getJSONArray("known_for");

					//known_For 배열 뽑아서 know object 만들기
					for(int j = 0; j < knownFor.length(); j++) {
						movieVO = new MovieVO();
						
						JSONObject known  = knownFor.getJSONObject(j);
						
						if(known.getString("media_type").equalsIgnoreCase("tv")){
							continue; //만약 해당 인물의 필모그래피에 tv(드라마)가 있다면 해당 배열은 건너뛰기!(드라마 검색 및 출력은 불가능하게 처리하였다.)
						}
						
						movieVO.setId(known.getString("id"));
						movieVO.setTitle(known.getString("title"));
						movieVO.setOriginalTitle(known.getString("original_title"));
						movieVO.setPosterPath(known.getString("poster_path"));
						movieVO.setOverview(known.getString("overview"));
						movieVO.setReleaseDate(known.getString("release_date"));
						
						movieVO.setGenreIds(getGenres(movieVO.getId()));
						movieVO.setDirectors(getCredit(movieVO.getId()));
						movieVO.setProductionConturies(getConturies(movieVO.getId()));

						
						movieList.add(movieVO);
						
					}//end of inner for

					//영화 이름을 검색했을 경우 실행   
				}else if(object.getString("media_type").equalsIgnoreCase("movie")) {
					
					movieVO.setId(object.getString("id"));
					movieVO.setTitle(object.getString("title"));
					movieVO.setOriginalTitle(object.getString("original_title"));
					movieVO.setPosterPath(object.getString("poster_path"));
					movieVO.setOverview(object.getString("overview"));
					movieVO.setReleaseDate(object.getString("release_date"));
					
					movieVO.setGenreIds(getGenres(movieVO.getId()));
					movieVO.setDirectors(getCredit(movieVO.getId()));
					movieVO.setProductionConturies(getConturies(movieVO.getId()));

					
					movieList.add(movieVO);
					
				}//end of outer if



			}//end of outer for



		} catch (Exception e){
			log.error("error=>{}", e);
		}
		return movieList;
	}//end of get()


	//TMDB API 요청 Method (크레딧)
	public List<String> getCredit(String movieId) {
		//Map<String, String> creditList = new HashMap<>();
		List<String> directors = new ArrayList<>();
		//String director = "";
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
			JSONArray crew = jsonObject.getJSONArray("crew"); //JSON 형식으로 만들어진 jsonObject에서 cast[]를 뽑아서 cast에 담는다.     

			for(int i = 0; i < crew.length(); i++) {
				//Map<String, String> map = new HashMap<>(); //for문 안에 선언하기!!
				JSONObject object  = crew.getJSONObject(i); //JSONArray를 하나씩(i) 꺼내서 JSONObject로 변경해서 object에서 Key로 value를 뽑는 방식이다.

				if(object.has("job") && object.getString("job").equalsIgnoreCase("director")) {
					directors.add(object.optString("name")); 
				}

			}//end of for


		} catch (Exception e) {
			System.err.println(e.toString());
		}//end of catch
		return directors;

	}//end of getCredit
	
	
	//TMDB API 요청 Method (제작 국가)
	public List<String> getConturies(String movieId) {
		List<String> countries = new ArrayList<>();
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
			JSONArray countriesJson = jsonObject.getJSONArray("production_countries"); //JSON 형식으로 만들어진 jsonObject에서 cast[]를 뽑아서 cast에 담는다.     

			for(int i = 0; i < countriesJson.length(); i++) {
				JSONObject object = countriesJson.getJSONObject(i); //JSONArray를 하나씩(i) 꺼내서 JSONObject로 변경해서 object에서 Key로 value를 뽑는 방식이다.
				countries.add(object.optString("name")); 			
			}//end of for


		} catch (Exception e) {
			log.error("error=>{}", e);
		}//end of catch
		return countries;

	}//end of getConturies
	
	
	//TMDB API 요청 Method (장르)
	public List<String> getGenres(String movieId) {
		List<String> genres = new ArrayList<>();
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
			JSONArray genresJson = jsonObject.getJSONArray("genres"); //JSON 형식으로 만들어진 jsonObject에서 cast[]를 뽑아서 cast에 담는다.     

			for(int i = 0; i < genresJson.length(); i++) {
			
				JSONObject object = genresJson.getJSONObject(i); //JSONArray를 하나씩(i) 꺼내서 JSONObject로 변경해서 object에서 Key로 value를 뽑는 방식이다.
				genres.add(object.optString("name")); 		
				
			}//end of for


		} catch (Exception e) {
			log.error("error=>{}", e);
		}//end of catch
		return genres;

	}//end of getConturies
	
	



}//end of class