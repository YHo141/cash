package kr.co.gdu.cash.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gdu.cash.vo.Cashbook;

@Mapper
public interface CashbookMapper {
	List<Map<String, Object>> selectCashInOutList();
	int selectSumCashbookPriceByInOut(Map<String, Object> map);
	List<Map<String, Object>> selectCashListByMonth(Map<String, Object> map);
	List<Cashbook> selectCashbookListByDay(Map<String, Object> map);
}
