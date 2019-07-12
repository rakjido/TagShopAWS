package test;

import java.math.BigInteger;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import dao.ShopsDao;
import dao.UsersDao;
import service.ShopsService;

public class testShopid {

//	@Autowired
//	private static ShopsService service;
	
	@Autowired
	private static SqlSession sqlSession;
	
	public static String getShopid() {
		String shopid = "";
		UsersDao dao = sqlSession.getMapper(UsersDao.class);
		//ShopsDao dao = sqlSession.getMapper(ShopsDao.class);
	//	System.out.println(dao.productDetail(BigInteger.valueOf(1)));
		return "1";
		//return dao.getShopId("zozo");
		
		//return service.getShopId("zozo");
	}
	public static void main(String[] args) {
		System.out.println(getShopid());
	}
}
