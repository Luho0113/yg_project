package com.younggam.app.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.configurationprocessor.json.JSONArray;
import org.springframework.boot.configurationprocessor.json.JSONObject;
import org.springframework.stereotype.Service;

import com.younggam.app.mapper.ReviewerInfoMapper;
import com.younggam.app.vo.MovieVO;
import com.younggam.app.vo.ReviewInfoVO;

import lombok.extern.slf4j.Slf4j;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;

@Service
@Slf4j
public class MovieMainService {
	
	@Autowired
	private ReviewerInfoMapper riMapper;

	//현재 상영 영화
	public List<MovieVO> getNowPlaying() {
		List<MovieVO> movieList = new ArrayList<>(); // credits에 movieId를 검색한 내용
		
		try {

			OkHttpClient client = new OkHttpClient();

			Request request = new Request.Builder()
					  .url("https://api.themoviedb.org/3/movie/now_playing?language=ko-KR&page=1")
					  .get()
					  .addHeader("accept", "application/json")
					  .addHeader("Authorization", "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjODY3YWU0NjA3YTJlYzgyNTY1OTVkN2I3MzBhMzhkMyIsInN1YiI6IjY0NzYwMjAyNjc0M2ZhMDBhOTlmNTNiNiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.hBuRZnSvjot0z9nTI97qMDzi9eciVE_Z2aEsjUPfqHw")
					  .build();

			Response response = client.newCall(request).execute();

			// 요청 결과를 JSON 형식으로 변경
			JSONObject jsonObject = new JSONObject(response.body().string()); // String 형식을 JSON 형식으로 변환한다.
			JSONArray nowPlayingJson = jsonObject.getJSONArray("results"); 
			
			for (int i = 0; i < 3; i++) {
				MovieVO movievo = new MovieVO();
				JSONObject object = nowPlayingJson.getJSONObject(i); // JSONArray를 하나씩(i) 꺼내서 JSONObject로 변경해서 object에서 Key로
					
				movievo.setId(object.getString("id"));
				movievo.setTitle(object.getString("title"));
			movievo.setPosterPath(object.getString("poster_path"));
				movievo.setBackdropPath(object.getString("backdrop_path"));
				movievo.setOverview(object.getString("overview"));

				movieList.add(movievo);
		
			
			} // end of for
				// castVO에 저장된 값을 castList에 담는다.
			


		} catch (Exception e) {
			log.error("error=>{}", e);
		}
		return movieList;
	}
	
	//최근 리뷰어 리스트
	public List<ReviewInfoVO> selectNewReviewersInfo(ReviewInfoVO reviews){
		return riMapper.selectNewReviewersInfos(reviews);
	}
	
	
	//별점 높은 영화
	public List<ReviewInfoVO> selectBestMoviesInfo (ReviewInfoVO reviews){
		return riMapper.selectBestMoviesInfos(reviews);
	}
	
	 
}
