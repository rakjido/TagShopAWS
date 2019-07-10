package service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.PerformanceDao;
import vo.PerformanceVo;

@Service
public class PerformanceService {
	
	@Autowired
	private SqlSession sqlsession;
	
	public void insertPerformance(Date baseDate) {
		PerformanceDao dao = sqlsession.getMapper(PerformanceDao.class);
		dao.insertPerformance(baseDate);
	}
	
	public List<PerformanceVo> getPerformance(Date fromDate, Date toDate){
		PerformanceDao dao = sqlsession.getMapper(PerformanceDao.class);
		HashMap<String, Date> map = new HashMap<String, Date>();
		map.put("fromDate", fromDate);
		map.put("toDate", toDate);
		return dao.getPerformance(map);
	}
}
