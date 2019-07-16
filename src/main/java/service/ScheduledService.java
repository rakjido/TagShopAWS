package service;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import utils.DateUtil;
import utils.FormatUtil;
import vo.RankingVo;
import vo.ViewParamsVo;
import vo.WeightsVo;

@Service
public class ScheduledService {

	@Autowired
	private PerformanceService performanceService;
	
	@Autowired
	private TagsLocaleService tagsLocaleService;
	
	@Autowired
	private ViewParamsVo viewParamsVo;
	
	@Autowired
	private WeightsVo weightsVo;
	
   // 매일 새벽 1시 전날의 매출등 performance 집계 	
	@Scheduled(cron= "0 0 01 * * *")
    public void insertPerformance() {
    		Date baseDate = DateUtil.changeDay(DateUtil.today(), -1);  		
    		performanceService.insertPerformance(baseDate);
    }	

	// 매주 금요일 23시 TAG PRICE 계산 
	@Scheduled(cron= "0 0 23 * * FRI")
	@Transactional
	public void addTagsPrice() {
		String baseDate = FormatUtil.dateFormat(DateUtil.today());
		System.out.println(baseDate);
		tagsLocaleService.insertTagsPriceHistory(baseDate);
		
		tagsLocaleService.insertTagsPriceFx(baseDate, "USD", 1171);
		tagsLocaleService.insertTagsPriceFx(baseDate, "EUR", 1322);
		tagsLocaleService.insertTagsPriceFx(baseDate, "CNY", 171);
		tagsLocaleService.insertTagsPriceFx(baseDate, "INR", 17);
		tagsLocaleService.insertTagsPriceFx(baseDate, "JPY", 1084);
		tagsLocaleService.insertTagsPriceFx(baseDate, "RUB", 18);
		tagsLocaleService.insertTagsPriceFx(baseDate, "BRL", 310);
	}

	// 매월말   
	@Scheduled(cron= "0 0 23 28-31 * ?")
	public void getParams() {
		final Calendar cal = Calendar.getInstance();
		if(cal.get(Calendar.DATE) == cal.getActualMaximum(Calendar.DATE)) {
		
		//검색순위 parameter계산
		performanceService.insertViewParams();
		
		//#일종의 정규화 : 변수의 최대값이 1이 되도록 조정  
		String baseDate = "20190710";
		List<ViewParamsVo> voList=performanceService.getNormalizedParams(baseDate);
		for (ViewParamsVo vo : voList) {
			System.out.println(vo.toString());
		}
		
		// ranking 구하기
		weightsVo.setBaseDate("20190710");
		weightsVo.setWLikes(1.0);
		weightsVo.setWBuyLikes(2.0);
		weightsVo.setWComments(1.0);
		weightsVo.setWBuyCmts(2.0);
		weightsVo.setWRepost(2.0);
		List<RankingVo> rankingVoList = performanceService.getRanking(weightsVo);
		for (RankingVo rankingVo : rankingVoList) {
			System.out.println(rankingVo.toString());
		}
		


			}
	}

}
