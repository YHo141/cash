package kr.co.gdu.cash.controller;

import java.util.Calendar;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.gdu.cash.service.CashbookService;
import kr.co.gdu.cash.service.CategoryService;
import kr.co.gdu.cash.vo.Cashbook;
import kr.co.gdu.cash.vo.Category;

@Controller
public class CashbookController {
	@Autowired
	private CashbookService cashbookService;
	@Autowired
	CategoryService categoryService;

	
	@GetMapping(value = "/admin/cashbookByMonth/{currentYear}/{currentMonth}")
	public String cashbookByMonth(Model model,
									@PathVariable(name = "currentYear") int currentYear,
									@PathVariable(name = "currentMonth") int currentMonth) {
		
		// 1. 요청분석
		Calendar currentDay = Calendar.getInstance(); // 2020년 11월 2일
		//currentYear 넘어오고, currentMonth 넘어오면
		// Calendar API 사용시 : currentDay.add(Calendar.Month, -1);
		if(currentYear !=-1 || currentMonth != -1) {
			if(currentMonth == 0) {
				currentYear -= 1;
				currentMonth = 12;
			}
			if(currentMonth == 13) {
				currentYear += 1;
				currentMonth = 1;
			}
			currentDay.set(Calendar.YEAR, currentYear);
			currentDay.set(Calendar.MONTH, currentMonth -1);
		}
		
		currentDay.set(Calendar.DATE, 1); //2020년 11월 1일
		currentYear = currentDay.get(Calendar.YEAR); 
		currentMonth = currentDay.get(Calendar.MONTH) +1; //월
		int lastDay = currentDay.getActualMaximum(Calendar.DATE);	
		int firstDayOfWeek = currentDay.get(Calendar.DAY_OF_WEEK);
		//--------------------------------------------------------------------------------------------
		int sumOut= cashbookService.getselectSumCashbookPriceByInOut("지출", currentYear, currentMonth);
		int sumIn =	cashbookService.getselectSumCashbookPriceByInOut("수입", currentYear, currentMonth);
		//--------------------------------------------------------------------------------------------
		List<Map<String, Object>> cashList = cashbookService.getCashListByMonth(currentYear, currentMonth);
		//--------------------------------------------------------------------------------------------
		
		// 2. 뷰 모델 추가
		model.addAttribute("currentYear", currentYear); // 년
		model.addAttribute("currentMonth", currentMonth); // 월
		model.addAttribute("lastDay", lastDay); // 마지막 일
		model.addAttribute("firstDayOfWeek", firstDayOfWeek);
		
		model.addAttribute("sumOut", sumOut);
		model.addAttribute("sumIn", sumIn);
		
		model.addAttribute("cashList", cashList);
		
		return "cashbookByMonth";
	}
	
	@GetMapping("/admin/cashbookByDay/{target}/{currentYear}/{currentMonth}/{currentDay}")
	public String cashbookByDay(Model model,
			@PathVariable(name = "target") String target,
			@PathVariable(name = "currentYear", required = true) int currentYear,
			@PathVariable(name = "currentMonth", required = true) int currentMonth,
			@PathVariable(name = "currentDay", required = true) int currentDay) {
		
		Calendar targetDay = Calendar.getInstance();
		targetDay.set(Calendar.YEAR, currentYear);
		targetDay.set(Calendar.MONTH, currentMonth-1);
		targetDay.set(Calendar.DATE, currentDay);
		if(target.equals("pre")) {
			targetDay.add(Calendar.DATE, -1);
		}else if(target.equals("next")) {
			targetDay.add(Calendar.DATE, 1);
		}
		
		List<Cashbook> cashbookList = cashbookService.getCashbookListByDay(targetDay.get(Calendar.YEAR), targetDay.get(Calendar.MONTH)+1, targetDay.get(Calendar.DATE));
		
		model.addAttribute("cashbookList", cashbookList);
		model.addAttribute("currentYear", targetDay.get(Calendar.YEAR));
		model.addAttribute("currentMonth", targetDay.get(Calendar.MONTH)+1);
		model.addAttribute("currentDay", targetDay.get(Calendar.DATE));

		
		return "cashbookByDay";
	}
	
	// 가계부 추가
	@GetMapping("/admin/addCashbook/add/{currentYear}/{currentMonth}/{currentDay}")
	public String addCashbook(Model model,
			@PathVariable(name = "currentYear", required = true) int currentYear,
			@PathVariable(name = "currentMonth", required = true) int currentMonth,
			@PathVariable(name = "currentDay", required = true) int currentDay) {
		
		List<Category> categoryList = categoryService.getCategoryList();
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("currentYear", currentYear);
		model.addAttribute("currentMonth", currentMonth);
		model.addAttribute("currentDay", currentDay);
		
		return "addCashbook";	// forward
	}
	
	@PostMapping("/admin/addCashbook")
	public String addCashbook(Cashbook cashbook) {	// 커맨드 객체
		cashbookService.addCashbook(cashbook);
		return "redirect:/admin/cashbookByMonth/-1/-1";	// response.sendRedirect -> /cashbookByMonth
	}

	// 가계부 삭제
	@GetMapping("/admin/removeCashbook/remove/{cashbookId}")
	public String removeCashbook(@PathVariable(name = "cashbookId") int cashbookId) {
		
		cashbookService.getDelelteCashbook(cashbookId);
		
		return "redirect:/admin/cashbookByMonth/-1/-1";
	}
	
	// 가계부 수정 폼
	@GetMapping("/admin/modifyCashbook/modify/{cashbookId}")
	public String modifyCashbook(Model model,
									@PathVariable(name = "cashbookId") int cashbookId) {
		
		Cashbook cashbook = cashbookService.getCashbookOne(cashbookId);
		
		List<Category> categoryList = categoryService.getCategoryList();
		model.addAttribute("categoryList", categoryList);
		
		model.addAttribute("cashbook", cashbook);
		
		return "modifyCashbook";
	}
	
	// 가계부 수정 액션
	@PostMapping("/admin/modifyCashbook")
	public String modifyCashbook(Cashbook cashbook) {
		cashbookService.getUpdateCashbook(cashbook);
		return "redirect:/admin/cashbookByMonth/-1/-1";
	}
	
	@GetMapping("/admin/cashbookList/{currentPage}")
	public String cashbookList(Model model, @PathVariable(name = "currentPage", required = true) int currentPage) {
		
		int rowPerPage = 20;
		List<Cashbook> cashbookList = cashbookService.getCashbookListByPage(currentPage, rowPerPage);
		model.addAttribute("cashbookList", cashbookList);
		
		return "cashbookList";
	}
	
}