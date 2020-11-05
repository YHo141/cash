package kr.co.gdu.cash.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.gdu.cash.mapper.CashbookMapper;
import kr.co.gdu.cash.mapper.NoticeMapper;
import kr.co.gdu.cash.vo.Notice;

@Service
@Transactional
public class NoticeService {
	@Autowired private NoticeMapper noticeMapper;
	@Autowired private CashbookMapper cashbookMapper;
	
	public List<Notice> getNoticeListByPage(int currentPage, int rowPerPage){
		// int currentPage, int rowPerPage -> beginRow
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("beginRow", (currentPage-1)*rowPerPage);
		map.put("rowPerPage", rowPerPage);
		
		return noticeMapper.selectNoticeListByPage(map);
	}
	
	// 문제점 : noticeList만드는 코드가 중복되어 있다.
	public Map<String, Object> getNoticeAndInOutList() {
		List<Notice> noticeList = noticeMapper.selectLatestNoiceList();
		List<Map<String,Object>> inOutList = cashbookMapper.selectCashInOutList();
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("noticeList",noticeList);
		map.put("inOutList", inOutList);
		return map;
	}
	
	public List<Notice> getNoticeList(){
		return noticeMapper.selectLatestNoiceList();
	}
	
	// 공지사항 갯수
	public int getCountNotice() {
		return noticeMapper.selectNoticeListCount();
	}
	
	// 공지사항 상세보기
	public Notice getNoticeOne(int noticeId){
		return noticeMapper.selectNoticeOne(noticeId);
	}
	
	// 공지사항 삭제
	public int getdeleteNoticeOne(int noticeId) {
		return noticeMapper.deleteNoticeOne(noticeId);
	}
	
	// 공지사항 수정
	public int updateNoticeOne(Notice notice) {
		return noticeMapper.updateNoticeOne(notice);
	}
	
	// 공지사항 추가
	public int addNotice(Notice notice) {
		return noticeMapper.insertNotice(notice);
	}
	
	
}