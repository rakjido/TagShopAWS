package service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.UsersDao;
import vo.RecommendVo;
import vo.SnsUserVo;
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
	
	public List<UsersVo> getEnabledUsers() {
        UsersDao dao = sqlSession.getMapper(UsersDao.class);
        List<UsersVo> list = dao.getEnabledUsers();
        
        return list;
    }
	
	public List<RecommendVo> recommend(String userid) {
		UsersDao dao = sqlSession.getMapper(UsersDao.class);
		List<RecommendVo> recommend = dao.recommend(userid);
		return recommend;
	}
	
	public void updateUsersPassword(String userid, String password) {
		UsersDao dao = sqlSession.getMapper(UsersDao.class);
		
		HashMap<String, Object> editpassword = new HashMap<String, Object>();
		
		editpassword.put("userid", userid);
		editpassword.put("password", password);
		
		dao.updateUsersPassword(editpassword);
	}
	
	public void addSNS(SnsUserVo sns) {
		UsersDao dao = sqlSession.getMapper(UsersDao.class);
		dao.insertSNS(sns);
	}
	
	public int emailCheck(String email) {
		int emailCheck = 0;
		UsersDao dao = sqlSession.getMapper(UsersDao.class);
		emailCheck = dao.emailCheck(email);
		return emailCheck;
	}

}
