package service;

import org.springframework.stereotype.Component;

@Component
public class ScheduledService {


	// 30분마다 PRODUCT 사진의 COLOR를 업데이트 	
//	@Scheduled(cron= "30 * * * * *")
//	public void test3() {
//	}

   // 전날의 매출, 비용 집계	
//	@Scheduled(cron= "0 0 01 * * *")
//	public void test4() {
//	}

	// 금요일 23
	// TAG PRICE 계산 
//	@Scheduled(cron= "0 0 23 * * FRI")
//	public void test4() {
//	 
//	INSERT INTO TAGSPRICEHISTORY
//	SELECT '20190628', TAGSID,  'KRW', @RANK:=@RANK+1 AS RANK, COUNT*10000 AS PRICE
//	FROM (
//	SELECT T.TAGSID , COUNT(P.TAGSID) AS COUNT
//	FROM TAGSLOCALE T JOIN PHOTOTAGS P
//	ON T.TAGSID = P.TAGSID 
//	GROUP BY T.TAGSNAMEKO
//	ORDER BY COUNT DESC
//	) A, (SELECT @RANK:=0) R
//	;
//
//	INSERT INTO TAGSPRICEHISTORY
//	SELECT BASEDATE, TAGSID, 'USD', RANK, FORMAT(PRICE/1171, 2) 
//	FROM TAGSPRICEHISTORY
//	WHERE BASEDATE='20190628'
//	AND CURRENCYCODE='KRW';
//
//	INSERT INTO TAGSPRICEHISTORY
//	SELECT BASEDATE, TAGSID, 'CNY', RANK, FORMAT(PRICE/170.27, 2) 
//	FROM TAGSPRICEHISTORY
//	WHERE BASEDATE='20190628'
//	AND CURRENCYCODE='KRW';
//
//	INSERT INTO TAGSPRICEHISTORY
//	SELECT BASEDATE, TAGSID, 'JPY', RANK, FORMAT(PRICE/1084.07, 2) 
//	FROM TAGSPRICEHISTORY
//	WHERE BASEDATE='20190628'
//	AND CURRENCYCODE='KRW';

	
//	}

	// 매월말 검색순위 weight 조정 
//	@Scheduled(cron= "0 0 23 28-31 * ?")
//	public void test5() {
//		final Calendar cal = Calendar.getInstance();
//		if(cal.get(Calendar.DATE) == cal.getActualMaximum(Calendar.DATE)) {
//			System.out.println("매월 마지막 날 23시에 순조는 몸무게를 잰다.");	
//		}
//	}

}
