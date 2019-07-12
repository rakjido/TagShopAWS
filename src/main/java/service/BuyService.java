package service;

import java.math.BigInteger;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.BuyDao;
import vo.CodeVo;
import vo.OrderedItemsOptionsVo;
import vo.OrderedItemsVo;
import vo.SelectedOptionVo;

@Service
public class BuyService {

	@Autowired
	SqlSession sqlSession;
	
	public void addBuyitems(HashMap<String, Object> map) {
		BuyDao buyDao = sqlSession.getMapper(BuyDao.class);
		buyDao.insertBuyitems(map);
	}
	
	public List<BigInteger> getBuyitemsId(String userid) {
		BuyDao buyDao = sqlSession.getMapper(BuyDao.class);
		return buyDao.getBuyitemsId(userid);
	}
	
	public void addSelectedOption(SelectedOptionVo vo) {
		BuyDao buyDao = sqlSession.getMapper(BuyDao.class);
		buyDao.insertSelectedOption(vo);
	}
	
	public List<OrderedItemsVo> getBuyitems(String userid) {
		BuyDao buyDao = sqlSession.getMapper(BuyDao.class);
		return buyDao.getBuyitems(userid);
		
	}
	
	public List<OrderedItemsOptionsVo> getOptions(String userid, BigInteger buyitemsId) {
		BuyDao buyDao = sqlSession.getMapper(BuyDao.class);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("userid", userid);
		map.put("buyitemsId", buyitemsId);
		return buyDao.getOptions(map);
	}
	
	public List<CodeVo> getBankCode(){
		BuyDao buyDao = sqlSession.getMapper(BuyDao.class);
		return buyDao.getBankCode();
	}

	public List<CodeVo> getPayTypeCode(){
		BuyDao buyDao = sqlSession.getMapper(BuyDao.class);
		return buyDao.getPayTypeCode();
	}

	public void updateBakset(BigInteger basketId, double deliveryFee, double usedPoint) {
		BuyDao buyDao = sqlSession.getMapper(BuyDao.class);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("basketId", basketId);
		map.put("deliveryFee", deliveryFee);
		map.put("usedPoint", usedPoint);
		buyDao.updateBakset(map);
	}
	
	public void changeOrderStatus(BigInteger basketId, String orderStatusCode) {
		BuyDao buyDao = sqlSession.getMapper(BuyDao.class);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("basketId", basketId);
		map.put("orderStatusCode", orderStatusCode);

		buyDao.changeOrderStatus(map);
	}
}