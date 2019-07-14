package dao;

import vo.ProfileVo;

public interface ProfileDao {
	
	public ProfileVo getProfile(String userid);
	
	public void updateProfile(ProfileVo vo);
	
	public void updateSnsProfile(ProfileVo vo);
	
	public void updateShoppingInfo(ProfileVo vo);
	
	public void deductRepostNo(String userid);
}
