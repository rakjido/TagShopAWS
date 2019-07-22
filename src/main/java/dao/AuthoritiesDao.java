package dao;

import vo.AuthoritiesVo;

public interface AuthoritiesDao {
	
	public void insertAuthorities(AuthoritiesVo vo);

	public AuthoritiesVo getAuthorities(String userid);
}
