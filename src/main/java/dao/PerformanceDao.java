package dao;

import java.math.BigInteger;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import vo.PerformanceVo;
import vo.RankingVo;
import vo.ViewParamsVo;
import vo.WeightsVo;

public interface PerformanceDao {
	public void insertPerformance(Date baseDate);
	
	public List<PerformanceVo> getPerformance();
	
	public void insertViewParams();
	
	public List<ViewParamsVo> getNormalizedParams(String baseDate);
	
	public List<RankingVo> getRanking(WeightsVo vo);

	public void insertWeights(WeightsVo vo);
	
	public List<WeightsVo> getWeights(BigInteger weightsId);
	
	public int getPerformanceCount();
}
