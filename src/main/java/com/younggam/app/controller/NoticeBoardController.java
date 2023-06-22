package com.younggam.app.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.younggam.app.service.NoticeBoardService;
import com.younggam.app.vo.AdminInfoVO;
import com.younggam.app.vo.NoticeBoardVO;


@Controller
public class NoticeBoardController {
	@Autowired
	private NoticeBoardService niService;
	
	//공지사항 글 목록 + 페이징 + 검색(유저)
	@GetMapping("/notices")
	public String getReports(@ModelAttribute NoticeBoardVO notice, Model m) {
		m.addAttribute("page", niService.getNotices(notice));
		return "user/notice-list";
	}
	
	//공지사항 글 목록 + 페이징 + 검색(관리자)
	@GetMapping("/admin/notices")
	public String goNotices(@ModelAttribute NoticeBoardVO notice, Model m) {
		m.addAttribute("page", niService.getNotices(notice));
		return "admin/notice-list";
	}

	//공지사항 보기(유저)
	@GetMapping("/notice")
	public String getNotice(Model m, @RequestParam("niNum") int niNum) {
		NoticeBoardVO notice = niService.seeNotice(niNum);
		m.addAttribute("notice", notice);
		niService.updateCnt(niNum); //조회수
		return "user/notice-view";
	}

	//공지사항 보기(관리자)
	@GetMapping("/admin/notice")
	public String goNotice(Model m, @RequestParam("niNum") int niNum) {
		NoticeBoardVO notice = niService.seeNotice(niNum);
		m.addAttribute("notice", notice);
		niService.updateCnt(niNum); //조회수
		return "admin/notice-view";
		}
	
	//공지사항 등록
	@GetMapping("/admin/notice-register")
	public String registerNotice() {
		return "admin/notice-register";
	}
	 
	@PostMapping("/admin/notice-register")
	public String noticeRegister(NoticeBoardVO notice, Model m, HttpSession session)
			throws Exception {
		AdminInfoVO admin = (AdminInfoVO)session.getAttribute("admin");
		notice.setAdminId(admin.getAdminId());
		String msg = "공지 등록이 실패하였습니다.";
		String url = "/admin/notice-register";
		if(niService.registerNotice(notice)) {
			msg = "공지가 등록되었습니다.";
			url = "/admin/notices";
		}
		m.addAttribute("msg", msg);
		m.addAttribute("url", url);
		return "/admin/notice-list";
	}
	
	//공지사항 수정
	@GetMapping("/admin/notice-update")
	public String updateNotice(Model m, @RequestParam("niNum") int niNum) {
		NoticeBoardVO notice = niService.seeNotice(niNum);
		m.addAttribute("notice", notice);
		return "admin/notice-update";
	}
	
	@PostMapping("/admin/notice-update")
	public String noticeUpdate(NoticeBoardVO notice, Model m) throws Exception {
		String msg = "공지사항 수정이 실패하였습니다.";
		String url = "/notice-update?niNum=" + notice.getNiNum();
		if (niService.updateNotice(notice)) {
			msg = "공지사항이 수정되었습니다";
			url = "/admin/notices";
		}
		m.addAttribute("msg", msg);
		m.addAttribute("url", url);
		return "admin/notice-list";
	}
	
	//공지사항 삭제
	@GetMapping("/admin/notice-delete")
	public String deleteNotice(Model m, @RequestParam("niNum") int niNum) {
		String msg = "공지사항 삭제가 실패하였습니다.";
		String url = "/admin/notice-view?niNum=" + niNum;
		if (niService.deleteNotice(niNum)) {
			msg = "공지사항이 삭제되었습니다.";
			url = "/admin/notices";
		}
		m.addAttribute("msg", msg);
		m.addAttribute("url", url);
		return "admin/notice-list";
	}		
}

	
	


