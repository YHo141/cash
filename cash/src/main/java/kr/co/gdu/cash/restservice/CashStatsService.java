package kr.co.gdu.cash.restservice;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.gdu.cash.restmapper.CashStatsMapper;

@Service
@Transactional
public class CashStatsService {
	@Autowired CashStatsMapper cashStatsMapper;
	
	public Map<String, Object> getTotalOfMonthByYear(){
		return cashStatsMapper.selectTotalOfMonthByYear();
	}
	
	public Map<String, Object> getTotalOutAndInByYear(int year){
		return cashStatsMapper.selectTotalOutAndInByYear(year);
	}
	
	public Map<String, Object> getTotalOfCategoryNameByYear(int year){
		return cashStatsMapper.selectTotalOfCategoryNameByYear(year);
	}
	// 년도별 지출
	public Map<String, Object> getTotalOutByYear(){
		return cashStatsMapper.selectTotalOutByYear();
	}
	
	// 년도별 수입
	public Map<String, Object> getTotalInByYear(){
		return cashStatsMapper.selectTotalInByYear();
	}
	
	// 년도별 수입종류
	public Map<String, Object> getTotalInByCategory(int year){
		return cashStatsMapper.selectTotalInByCategory(year);
	}
	
	// 월별 이익
	public Map<String, Object> getTotalSumByYear(int year){
		return cashStatsMapper.selectTotalSumByYear(year);
	}
	
	// 년도별 최고수입 금액
	public Map<String, Object> getInMaxPriceByYear(){
		return cashStatsMapper.selectInMaxPriceByYear();
	}
	
	// 년도별 최저수입 금액
	public Map<String, Object> getInMinPriceByYear(){
		return cashStatsMapper.selectInMinPriceByYear();
	}
	
	// 년도별 최고지출 금액
	public Map<String, Object> getOutMaxPriceByYear(){
		return cashStatsMapper.selectOutMaxPriceByYear();
	}
}
