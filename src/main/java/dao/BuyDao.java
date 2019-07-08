package dao;

import java.math.BigInteger;
import java.util.HashMap;
import java.util.List;

import vo.CodeVo;
import vo.OrderedItemsOptionsVo;
import vo.OrderedItemsVo;
import vo.SelectedOptionVo;

public interface BuyDao {
	public void insertBuyitems(HashMap<String, Object> map);
	
	public List<BigInteger> getBuyitemsId(String userid);
	
	public void insertSelectedOption(SelectedOptionVo vo);
	
	public List<OrderedItemsVo> getBuyitems(String userid);
	
	public List<OrderedItemsOptionsVo> getOptions(HashMap<String, Object> map);
	
	public List<CodeVo> getBankCode();
	
	public List<CodeVo> getPayTypeCode();
	
	public void updateBakset(HashMap<String, Object> map);
	
	public void changeOrderStatus(HashMap<String, Object> map);
}