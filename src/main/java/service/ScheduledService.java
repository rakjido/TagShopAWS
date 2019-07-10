package service;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import utils.DateUtil;
import utils.FormatUtil;

@Service
public class ScheduledService {

	@Autowired
	private PerformanceService performanceService;
	
	@Autowired
	private TagsLocaleService tagsLocaleService;
	
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

	// 매월말 검색순위 weight 조정 
//	@Scheduled(cron= "0 0 23 28-31 * ?")
//	public void test5() {
//		final Calendar cal = Calendar.getInstance();
//		if(cal.get(Calendar.DATE) == cal.getActualMaximum(Calendar.DATE)) {

//	CREATE OR REPLACE VIEW  VIEW_PARAMS AS
//	SELECT P.PHOTOID, SUM(L.LIKEYN) AS LIKES, SUM(IFNULL(L.BUYYN,0)) AS BUYLIKES, COUNT(C.COMMENTSID) AS COMMENTS, SUM(IFNULL(L.BUYYN,0)) AS BUYCMTS,  COUNT(R.PHOTOID) AS REPOST, SUM(IFNULL(R.BUYYN,0)) AS BUYREPOST, F.FOLLOWING
//	FROM PHOTO P LEFT JOIN LIKES L  ON P.PHOTOID = L.PHOTOID
//								 LEFT JOIN COMMENTS C ON P.PHOTOID = C.PHOTOID
//	                             LEFT JOIN REPOSTS R ON P.PHOTOID = R.PHOTOID
//	                             LEFT JOIN (
//										SELECT FOLLOWINGID, COUNT(USERSUSERID) AS FOLLOWING
//										FROM FOLLOWING
//										GROUP BY FOLLOWINGID
//	                             ) F ON P.USERID = F.FOLLOWINGID
//	GROUP BY P.PHOTOID
//	;


	//		}
//	}

}
