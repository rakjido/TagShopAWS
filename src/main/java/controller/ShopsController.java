package controller;

import java.io.File;
import java.io.IOException;
import java.math.BigInteger;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import net.sf.json.JSONArray;
import service.AuthoritiesService;
import service.BuyService;
import service.ShopsService;
import service.TagsLocaleService;
import vo.AuthoritiesVo;
import vo.CategoriesSortVo;
import vo.CategoriesVo;
import vo.CodeVo;
import vo.MyOrderVo;
import vo.OptionListVo;
import vo.OptionsVo;
import vo.OrdercodeVo;
import vo.ProductDetailVo;
import vo.ProductItemVo;
import vo.ProductsVo;
import vo.SelectedCategoriesVo;
import vo.ShopsVo;
import vo.TagsLocaleVo;

@Controller
@RequestMapping(value = "/shops")
public class ShopsController {

	private static final Logger logger = LoggerFactory.getLogger(ShopsController.class);

	@Autowired
	private ShopsService service;
	
	@Autowired
	private BuyService buyService;
	
	@Autowired
	private AuthoritiesService authService;
	
	@Autowired
	private AuthoritiesVo authVo;

	@Autowired
	private TagsLocaleService tagsLocaleService;
	
	@Autowired
	private TagsLocaleVo tagsLocaleVo;
	

	
	/*
     * @method name : sellerRegister
     *
     * @date : 2019.06.24
     *
     * @author : 장지훈
     *
     * @description : 판매등록 페이지 이동
     *
     * @parameters : 
     *
     * @return : String
     *
     * @example 
     */
	@RequestMapping(value = "/new", method = RequestMethod.GET)
	public String sellerRegister(Model model) {
		logger.debug("[GET] sellerRegister()");
		
		List<CodeVo> bankList = service.getBankCode();
		List<CategoriesVo> categoryCodeList = service.getCategoryCode();
		
		model.addAttribute("bankList", bankList);
		model.addAttribute("categoryCodeList", categoryCodeList);
		
		return "shops/sellerRegister";
	}
	
	/*
     * @method name : sellerRegister
     *
     * @date : 2019.06.24
     *
     * @author : 장지훈
     *
     * @description : 판매자 등록
     *
     * @parameters : ShopsVo shopsVo, SelectedCategoriesVo scVo
     *
     * @return : String
     *
     * @example 
     */
	/*public String sellerRegister(ShopsVo shopsVo, SelectedCategoriesVo scVo, HttpSession session,
			@RequestParam("regNum1") int regNum1,
			@RequestParam("regNum2") int regNum2,
			@RequestParam("regNum3") int regNum3)*/
	
	@Transactional
	@RequestMapping(value="/new", method = RequestMethod.POST)
	public String sellerRegister(ShopsVo shopsVo, HttpSession session,
			@RequestParam("regNum1") int regNum1,
			@RequestParam("regNum2") int regNum2,
			@RequestParam("regNum3") int regNum3,
			@RequestParam("midCategoryCode") String midCategoryCode) {
		
		
		logger.info("[POST] sellerRegister()");
		
		SelectedCategoriesVo scVo = new SelectedCategoriesVo();
		
		String coporateNum = "" + regNum1 + regNum2 + regNum3;
		
		authVo.setUserid((String)session.getAttribute("userid"));
		authVo.setAuthority("ROLE_SELLER");
		
		shopsVo.setUserid((String)session.getAttribute("userid"));	
		shopsVo.setCorporateRegisterNumber(coporateNum);
		scVo.setShopid(shopsVo.getShopid());
		scVo.setMidCategoryCode(midCategoryCode);
		System.out.println(scVo);
		
		authService.addAuthorities(authVo);
		service.sellerRegister(shopsVo);
		service.insertCategories(scVo);
		
		return "redirect:/";
	}
	
	/*
     * @method name : productsReg
     *
     * @date : 2019.06.24
     *
     * @author : 장지훈
     *
     * @description : 판매물품 등록 페이지 이동
     *
     * @parameters : 
     *
     * @return : String
     *
     * @example 
     */
	@RequestMapping(value = "/{shopid}/products/new", method = RequestMethod.GET)
	public String productsReg(Model model) {
		logger.debug("[GET] productsReg()");
		
		List<CategoriesSortVo> categoryList = service.getCategoriesSort();
		System.out.println(categoryList);
		
		JSONArray jsonArray = new JSONArray();
		
		model.addAttribute("categoryList", jsonArray.fromObject(categoryList));
		
		return "shops/productRegister";
	}

	
	/*
     * @method name : productsReg
     *
     * @date : 2019.06.24
     *
     * @author : 장지훈
     *
     * @description : 판매 물품 등록
     *
     * @parameters : 
     *
     * @return : String
     *
     * @example 
     */
	
	
	@RequestMapping(value = "/{shopid}/products/new", method = RequestMethod.POST)
	public String productsReg(@PathVariable("shopid") String shopid,MultipartHttpServletRequest request,
			ProductsVo productsVo, ProductItemVo productItemVo, OptionListVo optionsVo) throws IllegalStateException, IOException {
		logger.info("[POST] productsReg()");

		//파일
		MultipartFile mf = request.getFile("file");
		if(mf != null) {
			String fileName = mf.getOriginalFilename(); //파일명 얻기
			System.out.println("fileName : " + fileName);
			
			//업로드 파일명을 변경후 저장			
			String uploadedFileName = System.currentTimeMillis() 
					+ UUID.randomUUID().toString()+fileName.substring(fileName.lastIndexOf("."));
		
		    String uploadPath = request.getSession().getServletContext().getRealPath("uploads");
		    System.out.println("uploads : "+ uploadPath);
		    if(mf.getSize() != 0) {	    	
		    	mf.transferTo(new File(uploadPath+"/"+fileName));	 
		    	productsVo.setPhotoFile(fileName);
		    }   
		}
		
		productsVo.setShopid(shopid);
		service.productsRegister(productsVo, productItemVo,optionsVo);

		return "redirect:/";
	}
	
	/*
     * @method name : getProductDetail
     *
     * @date : 2019.06.27
     *
     * @author : 장지훈
     *
     * @description : 상품 상세보기
     *
     * @parameters : 
     *
     * @return : String
     *
     * @example 
     */
	
	@RequestMapping(value = "/{shopid}/products/{productid}", method = RequestMethod.GET)
	public String getProductDetail(@PathVariable("productid") BigInteger productid, Model model) {
		logger.debug("[GET] productDetail()");
		
		ProductDetailVo vo = service.productDetail(productid);
		vo.setOptions(service.getOptions(productid));
				model.addAttribute("vo", vo);
		return "shops/productDetail";
	}
	 
	/*
     * @method name : productsList
     *
     * @date : 2019.06.25
     *
     * @author : 장지훈
     *
     * @description : 카테고리, 태그별 상품
     *
     * @parameters : model
     *
     * @return : String
     *
     * @example 
     */
	
	@RequestMapping(value = "/categories", method = RequestMethod.GET)
	public String productsList(Model model) {
		logger.info("[GET] productCategories()");
		
		List<ProductsVo> list = service.productCategories();
		List<CategoriesSortVo> categories = service.getCategoriesSort();

		HashMap<String, String> map = new HashMap<String, String>();
		map.put("column", "LARGECATEGORYCODE");
		
		List<CategoriesVo> largeCategories = service.getCategories(map);
		System.out.println(largeCategories.toString());
		System.out.println(largeCategories.get(1).getCategoryCode());
		model.addAttribute("list", list);
		model.addAttribute("categories",categories);
		model.addAttribute("largeCategoryCode",largeCategories);
		return "shops/productCategories";
	}
	
	/*
     * @method name : addBuyitems
     *
     * @date : 2019.06.27
     *
     * @author : 장지훈
     *
     * @description : 장바구니 리스트 추가
     *
     * @parameters : 
     *
     * @return : String
     *
     * @example 
     */
	
//	@Transactional
//	@RequestMapping(value="/{userid}/baskets/{productItemid}", method=RequestMethod.POST)
//	public String addBuyitems(@PathVariable("userid") String userid, @PathVariable("productItemid") BigInteger productItemid 
//			) {
////		,double unitPrice, int quantity, @RequestBody OptionsVo optionVo
//		HashMap<String, Object> map = new HashMap<String, Object>();
//
//		System.out.println("구매추가전 ");
//		map.put("deliveryFee", 2500);
//		map.put("usedPoint", 0);
//		map.put("userid", userid);
//		map.put("unitPrice", 3000);
//		map.put("quantity", 2);
//		map.put("productItemId", productItemid);
//		
//		buyService.addBuyitems(map);
//		System.out.println("구매추가후");
//		
//		List<BigInteger> list = buyService.getBuyitemsId(userid);
//		List<OptionsVo> optionList = service.getOption(productItemid);
//		
//		System.out.println(list.toString());
//		System.out.println(optionList.toString());
//		
//		for (int i = 0; i < optionList.size()-1; i++) {
//			selectedOptionVo.setBuyItemsId(list.get(list.size()-1));
//			selectedOptionVo.setOptionCode(optionList.get(i).getOptionCode());
//			selectedOptionVo.setOptionType(optionList.get(i).getOptionType());
//			buyService.addSelectedOption(selectedOptionVo);
//		}
//
//		return "redirect:/";
//	}
	
	
	
	
	
	/*
     * @method name : addTagForm
     *
     * @date : 2019.06.21
     *
     * @author : 정일찬 
     *
     * @description : 태그 추가 입력 
     *
     * @parameters : none
     *
     * @return : String
     *
     * @example : 
     */
	@RequestMapping(value = "/tags/new", method = RequestMethod.GET)
	public String addTagForm() {
		return "tags/addTagForm";
	}

	/*
     * @method name : addTag
     *
     * @date : 2019.06.21
     *
     * @author : 정일찬 
     *
     * @description : 태그 추가 
     *
     * @parameters : String tags
     *
     * @return : String
     *
     * @example : 
     */
	@RequestMapping(value = "/tags/new", method = RequestMethod.POST)
	public String addTag(@RequestParam("tags") String tags) {
		
		tagsLocaleService.addMultiTags(tags); 
		
		return "redirect:/";
	}
	
	@RequestMapping(value="/{shopid}/management", method=RequestMethod.GET)
	public String shopManagement() {
		return "shops/management";
	}
	
	/*
	 * 나의 쇼핑 페이지 이동
	 * 
	 */
	@RequestMapping(value="/{userid}/myshop", method = RequestMethod.GET)
	public String mypage(@PathVariable("userid") String userid, Model model) {
		System.out.println("userid 체크 : " + userid);
		logger.debug("[GET] myshop()");
		List<OrdercodeVo> vo = service.getOrder(userid);
		List<MyOrderVo> li = service.getOrderList(userid);
		
		model.addAttribute("vo", vo);
		model.addAttribute("list", li);
		
		return "shops/myShoppingPage";
	} 

	@RequestMapping(value="/tags", method=RequestMethod.GET)
	public String tagRank() {
		
		// test용 데이터 주입
		// tagsLocaleService.randomInsertPhotoTag();
		return "shops/tagRank";
	}
	
}
