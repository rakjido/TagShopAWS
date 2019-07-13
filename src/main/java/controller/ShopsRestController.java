package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import service.ShopsService;
import service.TagsLocaleService;
import vo.ManagementVo;
import vo.PhotoTagsVo;
import vo.ProductsVo;
import vo.TagRankVo;
import vo.TagsTableVo;


@RestController
@RequestMapping("/shops")
public class ShopsRestController {
	
	@Autowired
	private ShopsService service;
	
	@Autowired
	private TagsLocaleService tagsLocaleService;
	
	@RequestMapping(value="/categories/sort/{sort}", method=RequestMethod.GET)
	public List<ProductsVo> psort(@PathVariable("sort") String sort) throws Exception {
		return service.productOrderBy(sort);
	}
	
	@RequestMapping(value="/categories/{code}", method=RequestMethod.GET)
	public List<ProductsVo> byCategories(@PathVariable("code") String code) throws Exception {
		return service.smallCategories(code);
	}
	
	@RequestMapping(value="/categories/list/{code}", method=RequestMethod.GET)
	public List<ProductsVo> getCategories(@PathVariable("code") String code) throws Exception {
		return null;
	}
	
//	@Transactional
//	@RequestMapping(value="/{userid}/baskets/{productItemid}", method=RequestMethod.POST)
//	public String addBuyitems(@PathVariable("userid") String userid, @PathVariable("productItemid") BigInteger productItemid 
//			,double unitPrice, int quantity) {
//
//		HashMap<String, Object> map = new HashMap<String, Object>();
//
//		System.out.println("구매추가전 ");
//		map.put("deliveryFee", 2500);
//		map.put("usedPoint", 0);
//		map.put("userid", userid);
//		map.put("unitPrice", unitPrice);
//		map.put("quantity", quantity);
//		map.put("productItemId", productItemid);
//		
//		buyService.addBuyitems(map);
//		System.out.println("구매추가후");
//		
//		List<BigInteger> list = buyService.getBuyitemsId(userid);
//		List<OptionsVo> optionList = service.getOption(productItemid);
//		
//		
//		for (int i = 0; i < optionList.size(); i++) {
//			selectedOptionVo.setBuyItemsId(list.get(list.size()-1));
//			selectedOptionVo.setOptionCode(optionList.get(i).getOptionCode());
//			selectedOptionVo.setOptionType(optionList.get(i).getOptionType());
//			buyService.addSelectedOption(selectedOptionVo);
//		}
//
//		return "redirect:/";
//	}
	
	@RequestMapping(value="/check_name", method = RequestMethod.POST)
	public int checkname(String name) {
		System.out.println("들어감");
		System.out.println(name);
		return service.shopidCheck(name);
	}
	
	@RequestMapping(value="/management", method=RequestMethod.GET)
	public List<ManagementVo> getMangementList(String fromDate, String toDate, String orderStatusCode){
		
		System.out.println(fromDate + " / " + toDate + " / " + orderStatusCode);
		
		fromDate = "2000-01-01";
		toDate = "2020-12-31";
		orderStatusCode = "";
		return service.getManagementList(fromDate, toDate, orderStatusCode);
	}
	
	
	@RequestMapping(value="/tagrank", method=RequestMethod.GET)
	public List<TagRankVo> getTagRank(String country){
		//country = "KO";
		return tagsLocaleService.getTagRank(country);
	}
	
	@RequestMapping(value="/tagtable", method=RequestMethod.GET)
	public List<TagsTableVo> getTagTable(String language){
		language = "KO";
		return tagsLocaleService.getTagsTable(language);
	}

}