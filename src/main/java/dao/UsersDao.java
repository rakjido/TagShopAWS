package dao;

import java.util.HashMap;
import java.util.List;

import vo.RecommendVo;
import vo.SnsUserVo;
import vo.UsersVo;

public interface UsersDao {
	
	public void insertUsers(UsersVo dto);
	
	public int idCheck(String userid);
	
	public int loginCheck(String userid, String password);
	
	public UsersVo getUsers(String userid);
	
	public void updateUsers(UsersVo dto);
	
	public void updateKey(HashMap<String, Object> map);
	
	public int alter_userKey(HashMap<String, Object> map);
	
	public List<UsersVo> getEnabledUsers();
	
	public List<RecommendVo> recommend(String userid);
	
	public void updateUsersPassword(HashMap<String, Object> map);
	
	public int emailCheck(String email);
	
	public void insertSNS(SnsUserVo sns);

}
