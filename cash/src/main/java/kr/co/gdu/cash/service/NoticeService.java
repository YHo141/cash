package kr.co.gdu.cash.service;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import kr.co.gdu.cash.mapper.CashbookMapper;
import kr.co.gdu.cash.mapper.NoticeMapper;
import kr.co.gdu.cash.mapper.NoticefileMapper;
import kr.co.gdu.cash.vo.Notice;
import kr.co.gdu.cash.vo.NoticeForm;
import kr.co.gdu.cash.vo.Noticefile;

@Service
@Transactional
public class NoticeService {
	private final String PATH = "D:\\stswork\\maven.1606089827158\\cash\\src\\main\\webapp\\upload";
	
	@Autowired private NoticeMapper noticeMapper;
	@Autowired private NoticefileMapper noticefileMapper;
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
	public void getdeleteNoticeOne(int noticeId) {
		List<String> noticefileNameList = noticefileMapper.selectNoticefileNameList(noticeId);
		for(String s : noticefileNameList) {
			File file = new File(PATH + s);
			if(file.exists()) {
				file.delete();
			}
		}
		
		// 공지사항에 있는 파일 삭제
		noticefileMapper.deleteNoticefile(noticeId);
		// 공지사항 삭제
		noticeMapper.deleteNoticeOne(noticeId);
	}
	
	// 공지사항 수정
	public void updateNoticeOne(NoticeForm noticeForm) {
		Notice notice = new Notice();
		notice.setNoticeId(noticeForm.getNoticeId());
		notice.setNoticeTitle(noticeForm.getNoticeTitle());
		notice.setNoticeContent(noticeForm.getNoticeContent());
		noticeMapper.updateNoticeOne(notice);
		
		
		List<Noticefile> noticefile = null;
		if(noticeForm.getNoticefile()!=null) {
			noticefile = new ArrayList<Noticefile>();
			for(MultipartFile mf : noticeForm.getNoticefile()) {
				Noticefile nf = new Noticefile();
				nf.setNoticeId(notice.getNoticeId());
				String filename = UUID.randomUUID().toString().replace("-", "");
				int p = mf.getOriginalFilename().lastIndexOf(".");
				String ext = mf.getOriginalFilename().substring(p);
				nf.setNoticefileName(filename+ext);
				nf.setNoticefileType(mf.getContentType());
				nf.setNoticefileSize(mf.getSize());
				noticefile.add(nf);
				try {
					mf.transferTo(new File(PATH+filename+ext));
				} catch(Exception e) {
					e.printStackTrace();
					throw new RuntimeException();
				}
			}
		}
		
		if(noticefile != null) {
			for(Noticefile nf : noticefile) {
				noticefileMapper.insertNoticefile(nf);
			}
		}
	}
	
	// 공지사항 추가
	public void addNotice(NoticeForm noticeForm) {
		
		Notice notice = new Notice();
		notice.setNoticeTitle(noticeForm.getNoticeTitle());
		notice.setNoticeContent(noticeForm.getNoticeContent());
		
		// 1. notice DB 입력 -> 키값 받음
		noticeMapper.insertNotice(notice);
		
		List<Noticefile> noticefile = null;
		if(noticeForm.getNoticefile()!=null) {
			noticefile = new ArrayList<Noticefile>();
			for(MultipartFile mf : noticeForm.getNoticefile()) {
				Noticefile nf = new Noticefile();
				nf.setNoticeId(notice.getNoticeId());
				String filename = UUID.randomUUID().toString().replace("-", "");
				int p = mf.getOriginalFilename().lastIndexOf(".");
				String ext = mf.getOriginalFilename().substring(p);
				nf.setNoticefileName(filename+ext);
				nf.setNoticefileType(mf.getContentType());
				nf.setNoticefileSize(mf.getSize());
				noticefile.add(nf);
				try {
					mf.transferTo(new File(PATH+filename+ext));
				} catch(Exception e) {
					e.printStackTrace();
					throw new RuntimeException();
				}
			}
		}
		
		if(noticefile != null) {
			for(Noticefile nf : noticefile) {
				noticefileMapper.insertNoticefile(nf);
			}
		}
		
	}
	
	
}