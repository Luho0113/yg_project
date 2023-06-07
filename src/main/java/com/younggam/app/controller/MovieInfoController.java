package com.younggam.app.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.younggam.app.service.MovieInfoService;
import com.younggam.app.vo.AdminInfoVO;
import com.younggam.app.vo.MovieInfoVO;

@Controller
public class MovieInfoController {
	@Autowired
	private MovieInfoService miService;

	//영화 목록
	@GetMapping("/admin/movies")
	public String getMovieInfos(MovieInfoVO movie, Model m) {
		List<MovieInfoVO> movies = miService.getMovieInfos(movie);
		m.addAttribute("movies", movies);
		return "admin/movie-list";
	}

	//영화 상세 정보
	@GetMapping("/admin/movie")
	public String getMovieInfo(Model m, @RequestParam("miCode") String miCode) {
		MovieInfoVO movie = miService.getMovieInfo(miCode);
		m.addAttribute("movie", movie);
		return "admin/movie-view";
	}
	
	//영화 등록
	@GetMapping("/admin/movie-add")
	public String goMovieAdd() {
		return "admin/movie-add";
	}

	@PostMapping("/admin/movie-add")
	public String addMovie(MovieInfoVO movie, Model m, HttpSession session, @RequestParam List<String> miGenre)
			throws Exception {
		AdminInfoVO admin = (AdminInfoVO) session.getAttribute("admin");
		movie.setMiCode(admin.getAdminId());
		List<String> genres = miGenre;
		m.addAttribute("genres", genres);
		String msg = "영화 등록이 실패하였습니다.";
		String url = "/admin/movie-update?miCode=" + movie.getMiCode();
		if (miService.addMovieInfo(movie)) {
			msg = "영화 등록이 성공하였습니다.";
			url = "/admin/movies";
		}
		m.addAttribute("msg", msg);
		m.addAttribute("url", url);
		return "common/msg";
	}

	//영화 수정
	@GetMapping("/admin/movie-update")
	public String updateMovie(Model m, @RequestParam("miCode") String miCode) {
		MovieInfoVO movie = miService.getMovieInfo(miCode);
		m.addAttribute("movie", movie);
		return "admin/movie-update";
	}

	@PostMapping("/admin/movie-update")
	public String movieUpdate(MovieInfoVO movie, Model m) throws Exception {
		String msg = "영화 정보 수정에 실패하였습니다.";
		String url = "/admin/movie-update?miCode=" + movie.getMiCode();
		if (miService.updateMovieInfo(movie)) {
			msg = "영화 정보 수정에 성공하였습니다.";
			url = "/admin/movies";
		}
		m.addAttribute("msg", msg);
		m.addAttribute("url", url);
		return "common/msg";
	}
	
	//영화 삭제
	@GetMapping("/admin/movie-delete")
	public String deleteMovie(Model m, @RequestParam("miCode") String miCode) {
		String msg = "영화 삭제가 실패하였습니다.";
		String url = "/admin/movie-view?miCode=" + miCode;
		if (miService.deleteMovieInfo(miCode)) {
			msg = "영화가 삭제되었습니다.";
			url = "/admin/movies";
		}
		m.addAttribute("msg", msg);
		m.addAttribute("url", url);
		return "common/msg";
	}
}
