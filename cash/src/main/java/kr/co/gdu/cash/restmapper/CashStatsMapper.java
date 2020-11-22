package kr.co.gdu.cash.restmapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CashStatsMapper {
	public Map<String, Object> selectTotalOfMonthByYear();
	public Map<String, Object> selectTotalOutAndInByYear(int year);
	public Map<String, Object> selectTotalOfCategoryNameByYear(int year);
	public Map<String, Object> selectTotalOutByYear();
	public Map<String, Object> selectTotalInByYear();
	public Map<String, Object> selectTotalInByCategory(int year);
	public Map<String, Object> selectTotalSumByYear(int year);
	public Map<String, Object> selectInMaxPriceByYear();
	public Map<String, Object> selectInMinPriceByYear();
	public Map<String, Object> selectOutMaxPriceByYear();
}
