package service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.LogsDao;
import vo.LogsVo;

@Service
public class LogsService {
	
	@Autowired
	private SqlSession sqlsession;
	
	@Autowired
	private LogsVo vo;
	
	public void addLogs(String userid, String ipAddress, String uri) {
		LogsDao dao = sqlsession.getMapper(LogsDao.class);
		vo.setUserid(userid);
		vo.setIpAddress(ipAddress);
		vo.setUri(uri);
		dao.insertLogs(vo);
	}
}
