package kr.co.gdu.cash.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import kr.co.gdu.cash.service.NoticeService;
import kr.co.gdu.cash.vo.Notice;
import kr.co.gdu.cash.vo.NoticeForm;

@Controller
public class NoticeController {
	@Autowired private NoticeService noticeService;
	
	// 공지 목록
	@GetMapping("/admin/noticeList/{currentPage}")
	public String noticeList(Model model,
								@PathVariable(value = "currentPage") int currentPage) {
		// noticeService 호출
		int rowPerPage = 3;
		int lastPage = 0;
		
		List<Notice> noticeList = noticeService.getNoticeListByPage(currentPage, rowPerPage);
		
		int noticeCount = noticeService.getCountNotice();
		if(noticeCount % rowPerPage == 0) {
			lastPage = (noticeCount / rowPerPage);
		}else {
			lastPage = (noticeCount / rowPerPage) + 1;
		}
		
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("currentPage",currentPage);
		model.addAttribute("rowPerPage",rowPerPage);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("noticeCount", noticeCount);
		
		return "noticeList";
	}
	
	// 공지추가 폼
	@GetMapping("/admin/addNotice")
	public String addNotice() {
		return "addNotice";
	}
	
	// 공지추가 액션
	@PostMapping("/admin/addNotice")
	public String addNotice(NoticeForm noticeForm) {
		
		noticeService.addNotice(noticeForm);
		
		return "redirect:/admin/noticeList/1";
	}
	
	// 공지상세 보기
	@GetMapping("/admin/noticeOne/{noticeId}")
	public String noticeOne(Model model,
								@PathVariable(value = "noticeId") int noticeId) {
		// noticeService 호출
		Notice notice = noticeService.getNoticeOne(noticeId);
		model.addAttribute("notice", notice);
		
		return "noticeOne";
	}
	
	// 공지 삭제
	@GetMapping("/admin/removeNotice/{noticeId}")
	public String removeNotice(@PathVariable(value = "noticeId") int noticeId) {
		
		noticeService.getdeleteNoticeOne(noticeId);
		
		return "redirect:/admin/noticeList/1";
	}
	
	// 공지 수정 폼
	@GetMapping("/admin/modifyNotice/{noticeId}")
	public String modifyNotice(Model model, @PathVariable(value = "noticeId") int noticeId) {
		
		Notice notice = noticeService.getNoticeOne(noticeId);
		model.addAttribute(notice);
		
		return "modifyNotice";
	}
	
	// 공지 수정 액션
	@PostMapping("/admin/modifyNotice/{noticeId}")
	public String modifyNotice(NoticeForm noticeForm) {
		
		noticeService.updateNoticeOne(noticeForm);
		
		return "redirect:/admin/noticeOne/"+noticeForm.getNoticeId();
	}
}
