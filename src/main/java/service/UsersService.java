package service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.UsersDao;
import vo.UsersVo;

@Service
public class UsersService {

	@Autowired
	private SqlSession sqlSession;

	public void addUsers(UsersVo vo) {
		UsersDao dao = sqlSession.getMapper(UsersDao.class);
		dao.insertUsers(vo);
	}

	public int checkUsersId(String userid) {
		int idCheck = 0;
		UsersDao dao = sqlSession.getMapper(UsersDao.class);
		idCheck = dao.idCheck(userid);
		return idCheck;

	}

	public int checkLoginId(String userid, String password) {
		int loginCheck = 0;
		UsersDao dao = sqlSession.getMapper(UsersDao.class);
		loginCheck = dao.loginCheck(userid, password);
		return loginCheck;
	}

	public UsersVo getUsers(String userid) {
		UsersDao dao = sqlSession.getMapper(UsersDao.class);
		UsersVo vo = dao.getUsers(userid);
		return vo;
	}

	public void updateUsers(UsersVo dto) {
		UsersDao dao = sqlSession.getMapper(UsersDao.class);
		dao.updateUsers(dto);
	}

}
