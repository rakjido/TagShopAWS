package controller;

import java.io.File;
import java.io.IOException;
import java.math.BigInteger;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;
import net.sf.json.JSONArray;
import service.AuthoritiesService;
import service.BuyService;
import service.ShopsService;
import service.TagsLocaleService;
import utils.RandomValueUtil;
import utils.VisionUtil;
import vo.AuthoritiesVo;
import vo.CategoriesSortVo;
import vo.CategoriesVo;
import vo.CodeVo;
import vo.ManagementVo;
import vo.MyOrderVo;
import vo.OptionListVo;
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
	
	@ResponseBody
	@Transactional
	@RequestMapping(value="/new", method = RequestMethod.POST)
	public String sellerRegister(ShopsVo shopsVo, HttpSession session, @RequestParam("midCategoryCode") String midCategoryCode) {
		
		
		logger.info("[POST] sellerRegister()");
		
		SelectedCategoriesVo scVo = new SelectedCategoriesVo();
		
		
		authVo.setUserid((String)session.getAttribute("userid"));
		authVo.setAuthority("ROLE_SELLER");
		
		shopsVo.setUserid((String)session.getAttribute("userid"));	
		scVo.setShopid(shopsVo.getShopid());
		scVo.setMidCategoryCode(midCategoryCode);
		System.out.println(scVo);
		
		authService.addAuthorities(authVo);
		service.sellerRegister(shopsVo);
		service.insertCategories(scVo);
		
		return "success";
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
		    	try {
					String color = VisionUtil.detectDominantColor(uploadPath+"/"+fileName);
					System.out.println("color : " + color.toUpperCase());
					productsVo.setMainColor(color.toUpperCase());
				} catch (Exception e) {
					e.printStackTrace();
				}
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


		JSONArray jsonArray = new JSONArray();
				
	    model.addAttribute("options", jsonArray.fromObject(vo.getOptions()));
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

		model.addAttribute("list", list);
		model.addAttribute("categories",categories);
		model.addAttribute("largeCategoryCode",largeCategories);
		
		
		JSONArray jsonArray = new JSONArray();
		
		model.addAttribute("categoryList", jsonArray.fromObject(categories));
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
    public String shopManagement(Model model) {
		
		SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy-MM-dd");
		Date time = new Date();
		String time1 = format1.format(time);
		System.out.println(time1);
		
		String orderStatusCode = "TOTL";
		List<ManagementVo> managementVo = service.getManagementList(time1, time1, "");
		System.out.println(managementVo);
		model.addAttribute("managementVo",managementVo);
		
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
	
	/*
     * @method name : sellerList
     *
     * @date : 2019.06.25
     *
     * @author : 김동현
     *
     * @description : 개별 Shop홈페이지 해당 샵의 제품목록을 출력
     *
     * @parameters : Model model
     *
     * @return : String
     *
     * @example 
     */
	
	@RequestMapping(value="/{shopid}/productList", method=RequestMethod.GET)
	public String sellerList(Model model, HttpSession session) {
		logger.info("[GET] getSellerList()");
		try {
			List<ProductsVo> ProductsList = service.getSellerList();
			model.addAttribute("productsList", ProductsList);
			session.setAttribute("shopid", "value");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "shops/sellerHome";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	@ResponseBody
	@RequestMapping(value = "/sendsms", method=RequestMethod.POST)
	  public String sendSms(HttpServletRequest request, @RequestParam("phonenum")String phonenum) throws Exception {

	    String api_key = "NCSCMCA8CMEQZXB8";
	    String api_secret = "7POX2FCN4NK5HDSJZB0KQW65MKSWL9BA";
	    Message coolsms = new Message(api_key, api_secret);
	    
	    String smsKey = RandomValueUtil.getSmsKey();
	    String smsconntent = "TagShop# 판매자 등록 인증번호 [" + smsKey + "]";

	    HashMap<String, String> set = new HashMap<String, String>();
	    set.put("to", phonenum); // 수신번호
	    set.put("from", "01028015067"); // 발신번호
	    set.put("text", smsconntent); // 문자내용
	    set.put("type", "SMS"); // 문자 타입

	    
	    try {
			
	    	JSONObject result = coolsms.send(set); // 보내기&전송결과받기
	    	System.out.println(result.toString());
		} catch (CoolsmsException e) {
			System.out.println(e.getMessage());
			System.out.println(e.getCode());
		}



	    return smsKey;
	  }
	
}
