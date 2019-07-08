package service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.ProfileDao;
import vo.ProfileVo;

@Service
public class ProfileService {

	@Autowired
	private SqlSession sqlSession;
	
	public ProfileVo getProfile(String userid) {
		ProfileDao dao= sqlSession.getMapper(ProfileDao.class);
		return dao.getProfile(userid);
	}
	
	public void updateProfile(ProfileVo vo) {
		ProfileDao dao= sqlSession.getMapper(ProfileDao.class);
		dao.updateProfile(vo);
	}
	
	public void updateSnsProfile(ProfileVo vo) {
		ProfileDao dao= sqlSession.getMapper(ProfileDao.class);
		dao.updateSnsProfile(vo);
	}
	
	public void updateShoppingInfo(ProfileVo vo) {
		ProfileDao dao= sqlSession.getMapper(ProfileDao.class);
		dao.updateShoppingInfo(vo);
	}

	public void deductRepostNo(String userid) {
		ProfileDao dao= sqlSession.getMapper(ProfileDao.class);
		dao.deductRepostNo(userid);
	}
}
