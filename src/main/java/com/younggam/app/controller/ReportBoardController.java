package com.younggam.app.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.younggam.app.service.ReportBoardService;
import com.younggam.app.vo.AdminInfoVO;
import com.younggam.app.vo.ReportBoardVO;
import com.younggam.app.vo.UserInfoVO;

@Controller
public class ReportBoardController {
	@Autowired
	ReportBoardService piService;
	
	//신고 글 목록 + 페이징 + 검색(유저)
	@GetMapping("/reports")
	public String getReports(@ModelAttribute ReportBoardVO report, Model m) {
		m.addAttribute("page", piService.getReports(report));
		return "user/report-list";
	}
	
	//신고 글 목록 + 페이징 + 검색(관리자)
		@GetMapping("/admin/reports")
		public String goReports(@ModelAttribute ReportBoardVO report, Model m) {
			m.addAttribute("page", piService.getReports(report));
			return "admin/report-list";
		}

	//신고 글 보기(유저)
	@GetMapping("/report")
	public String getReport(Model m, HttpSession session, @RequestParam("piNum") int piNum) {
		UserInfoVO user = (UserInfoVO)session.getAttribute("user");
		String userId = user.getUiId();
		ReportBoardVO report = piService.seeReport(piNum);
		String boardId = report.getUiId();
			if(userId.equals(boardId)) {
				m.addAttribute("report", report);
				return "user/report-view";
			}else{
				String msg="본 게시물은 관리자와 작성자만 열람할 수 있는 게시물입니다.";
				String url="/reports";
				m.addAttribute("msg", msg);
				m.addAttribute("url", url);
				return "user/report-list";
			}
		}
	//신고 글 보기(관리자)
	@GetMapping("/admin/report")
	public String goReport(Model m, HttpSession session, @RequestParam("piNum") int piNum) {
		AdminInfoVO admin = (AdminInfoVO)session.getAttribute("admin");
		String adminId = admin.getAdminId();
		ReportBoardVO report = piService.seeReport(piNum);
			if(adminId.equals("younggam_official")) {
				m.addAttribute("report", report);
				return "admin/report-view";
			}
			else{
				String msg="본 게시물은 관리자와 작성자만 열람할 수 있는 게시물입니다.";
				String url="/admin/reports";
				m.addAttribute("msg", msg);
				m.addAttribute("url", url);
				return "admin/report-list";
			}
		}
	
	//신고 글 등록
	@GetMapping("/report-file")
	public String registerReport(HttpSession session, Model m) {
		UserInfoVO user = (UserInfoVO)session.getAttribute("user");
		if(user==null) {
			String msg="로그인이 필요합니다.";
			String url="/login";
			m.addAttribute("msg", msg);
			m.addAttribute("url", url);
		}
		return "user/report-file";
	}
	
	@PostMapping("/report-file")
	public String reportRegister(UserInfoVO user, ReportBoardVO report, Model m, HttpSession session, 
			@RequestParam List<String> piCategory)
			throws Exception {
		user = (UserInfoVO)session.getAttribute("user");
		report.setUiId(user.getUiId());
		List<String> categories = piCategory;
		m.addAttribute("categories", categories);
		String msg = "신고 글 등록을 실패하였습니다.";
		String url = "/report-file";
		if (piService.fileReport(report)) {
			msg = "신고 글을 등록하였습니다.";
			url = "/reports";
		}
		m.addAttribute("msg", msg);
		m.addAttribute("url", url);
		return "user/report-list";
	}
	
	//신고 글 수정
	@GetMapping("/report-update")
	public String updateReport(Model m, @RequestParam("piNum") int piNum) {
		ReportBoardVO report = piService.seeReport(piNum);
		m.addAttribute("report", report);
		return "user/report-update";
	}
	
	@PostMapping("/report-update")
	public String reportUpdate(ReportBoardVO report, Model m) throws Exception {
		String msg = "신고 글 수정에 실패하였습니다.";
		String url = "/report-update?piNum=" + report.getPiNum();
		if (piService.updateReport(report)) {
			msg = "신고 글 수정이 완료되었습니다.";
			url = "/reports";
		}
		m.addAttribute("msg", msg);
		m.addAttribute("url", url);
		return "user/report-list";
	}
	
	//신고 글 삭제
	@GetMapping("/report-delete")
	public String deleteReport(Model m, @RequestParam("piNum") int piNum) {
		String msg = "신고 글 삭제가 실패하였습니다.";
		String url = "/report-view?piNum=" + piNum;
		if (piService.deleteReport(piNum)) {
			msg = "신고 글이 삭제되었습니다.";
			url = "/reports";
		}
		m.addAttribute("msg", msg);
		m.addAttribute("url", url);
		return "user/report-list";
	}

}
