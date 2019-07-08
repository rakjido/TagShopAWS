package dao;

import vo.UsersVo;

public interface UsersDao {
	
	public void insertUsers(UsersVo dto);
	
	public int idCheck(String userid);
	
	public int loginCheck(String userid, String password);
	
	public UsersVo getUsers(String userid);
	
	public void updateUsers(UsersVo dto);
}
