package kr.co.gdu.cash.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gdu.cash.vo.Cashbook;

@Mapper
public interface CashbookMapper {
	List<Cashbook> selectCashbookListByPage(Map<String, Object> map);	//인수(Map) brginRow, rowPerPage
	// 전체 cashbookList -> 엑셀파일
	List<Cashbook> selectCashbookListAll();

	List<Map<String, Object>> selectCashInOutList();
	int selectSumCashbookPriceByInOut(Map<String, Object> map);
	List<Map<String, Object>> selectCashListByMonth(Map<String, Object> map);
	List<Cashbook> selectCashbookListByDay(Map<String, Object> map);
	int insertCashbook(Cashbook cashbook);
	int deleteCashbook(int cashbookId);
	Cashbook selectCashbookOne(int cashbookId);
	int updateCashbook(Cashbook cashbook);
}
