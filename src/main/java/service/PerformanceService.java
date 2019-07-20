package service;

import java.math.BigInteger;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.PerformanceDao;
import vo.PerformanceVo;
import vo.RankingVo;
import vo.ViewParamsVo;
import vo.WeightsVo;

@Service
public class PerformanceService {
	
	@Autowired
	private SqlSession sqlsession;
	
	public void insertPerformance(Date baseDate) {
		PerformanceDao dao = sqlsession.getMapper(PerformanceDao.class);
		dao.insertPerformance(baseDate);
	}
	
	public List<PerformanceVo> getPerformance(){
		PerformanceDao dao = sqlsession.getMapper(PerformanceDao.class);
//		HashMap<String, Date> map = new HashMap<String, Date>();
//		map.put("fromDate", fromDate);
//		map.put("toDate", toDate);
		return dao.getPerformance();
	}
	
	public void insertViewParams() {
		PerformanceDao dao = sqlsession.getMapper(PerformanceDao.class);
		dao.insertViewParams();
	}
	
	public List<ViewParamsVo> getNormalizedParams(String baseDate) {
		PerformanceDao dao = sqlsession.getMapper(PerformanceDao.class);
		return dao.getNormalizedParams(baseDate);
	}
	
	public List<RankingVo> getRanking(WeightsVo vo) {
		PerformanceDao dao = sqlsession.getMapper(PerformanceDao.class);
		return dao.getRanking(vo);
	}

	public void insertWeights(WeightsVo vo) {
		PerformanceDao dao = sqlsession.getMapper(PerformanceDao.class);
		dao.insertWeights(vo);
	}
	
	public List<WeightsVo> getWeights(BigInteger weightsId) {
		PerformanceDao dao = sqlsession.getMapper(PerformanceDao.class);
		return dao.getWeights(weightsId);		
	}
	
	public int getPerformanceCount() {
		PerformanceDao dao = sqlsession.getMapper(PerformanceDao.class);
		return dao.getPerformanceCount();
	}
}
