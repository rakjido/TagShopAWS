package dao;

import java.math.BigInteger;
import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import vo.CategoriesSortVo;
import vo.CategoriesVo;
import vo.CodeVo;
import vo.ManagementVo;
import vo.MyOrderVo;
import vo.OptionsVo;
import vo.OrdercodeVo;
import vo.ProductDetailVo;
import vo.ProductItemVo;
import vo.ProductsVo;
import vo.SelectedCategoriesVo;
import vo.ShopsVo;

@Repository
public interface ShopsDao {
	public void sellerRegister(ShopsVo vo);
	
	public void insertCategories(SelectedCategoriesVo vo);
	
	public void productsRegister(ProductsVo productsVo);
	
	public void productItemRegister(ProductItemVo productItemVo);
	
	public void insertOptions(OptionsVo optionsVo);
	
	public ProductDetailVo productDetail(BigInteger productid);
	
	public List<OptionsVo> getOptions(BigInteger productid);
	
	public List<OptionsVo> getOption(BigInteger productItemid);
	
	public List<ProductsVo> productCategories();
	
	public List<ProductsVo> productOrderBy(HashMap<String, String> map);
	
	public List<ProductsVo> productBetweenPrices(HashMap<String, Object> map);
	
	public List<ProductsVo> productByColor(String color);
	
	public List<ProductsVo> smallCategories(HashMap<String, String> map);
	
	public void deleteSelectedOption(BigInteger buyItemsId);
	
	public void deleteBuyItems(BigInteger buyItemsId);
	
	public List<CategoriesSortVo> getCategoriesSort();
	
	public List<CategoriesVo> getCategories(HashMap<String, String> map);
	
	public List<CodeVo> getBankCode();
	
	public List<CategoriesVo> getCategoryCode();
	
	public String getShopId(String userid);
	
	public List<ManagementVo> getManagementList(HashMap<String, Object> map);
	
	public int check_name(String name);
	
	public List<OrdercodeVo> getOrder(String userid);
	
	public List<MyOrderVo> getOrderList(String userid);
	
	public List<ProductsVo> getSellerList() throws Exception;
	
	public List<ProductsVo> getPhotoProduct(HashMap<String, BigInteger> map);
	
	public ShopsVo getShopinfo(String userid);
	
	public void shopModify(ShopsVo svo, String userid2);
	
	public void shopModify2(SelectedCategoriesVo selectedcategories, String shopid2);
	
	public List<ManagementVo> selectPOIManagementList();
	
	public void updateOrderStatusCode(HashMap<String, Object> map);
}
