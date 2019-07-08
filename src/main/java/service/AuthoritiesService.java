package service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.AuthoritiesDao;
import vo.AuthoritiesVo;

@Service
public class AuthoritiesService {

	@Autowired
	private SqlSession sqlSession;
	
	public void addAuthorities(AuthoritiesVo vo) {
		AuthoritiesDao dao = sqlSession.getMapper(AuthoritiesDao.class);
		dao.insertAuthorities(vo);
	}
	
	public AuthoritiesVo getAuthorities(String userid) {
		AuthoritiesDao dao = sqlSession.getMapper(AuthoritiesDao.class);
		return dao.getAuthorities(userid);
	}
}
