package dao;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import vo.PerformanceVo;

public interface PerformanceDao {
	public void insertPerformance(Date baseDate);
	
	public List<PerformanceVo> getPerformance(HashMap<String, Date> map);
}
