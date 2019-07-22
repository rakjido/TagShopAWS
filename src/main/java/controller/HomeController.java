package controller;

import java.math.BigInteger;
import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

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

import service.BuyService;
import service.ProfileService;
import service.ShopsService;
import vo.CodeVo;
import vo.OrderedItemsOptionsVo;
import vo.OrderedItemsVo;
import vo.ProductsVo;
import vo.ProfileVo;
import vo.SelectedOptionVo;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private BuyService buyService;
	
	@Autowired
	private ProfileService profileService;
	
	@Autowired
	private List<OrderedItemsVo> itemList;
	
	@Autowired
	private List<OrderedItemsOptionsVo> optionList;
	
	@Autowired
	private SelectedOptionVo selectedOptionVo;
	
	@Autowired
	private ProfileVo profileVo;
	
	@Autowired
	private ShopsService shopsService;
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		List<ProductsVo> list = shopsService.productCategories("200400020");
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("list", list);
		model.addAttribute("serverTime", formattedDate );
		
		return "index";
	}

	@RequestMapping(value= "/{userid}/orders", method=RequestMethod.GET)
	//public String order(@PathVariable("userid") String userid, Model model) {
	public String order(@PathVariable("userid") String userid, HttpSession session) {	
		itemList = buyService.getBuyitems(userid);
		
		for (int i = 0; i < itemList.size(); i++) {
			itemList.get(i).setOptions(buyService.getOptions(userid, itemList.get(i).getBuyitemsId()));
		}
		
		ProfileVo profileVo = profileService.getProfile(userid);
		List<CodeVo> bankList = buyService.getBankCode();
		List<CodeVo> payTypeList = buyService.getPayTypeCode();
		
//		model.addAttribute("itemList", itemList);
//		model.addAttribute("profileVo", profileVo);
//		model.addAttribute("bankList", bankList);
//		model.addAttribute("payTypeList", payTypeList);
		
		session.setAttribute("itemList", itemList);
		session.setAttribute("profileVo", profileVo);
		session.setAttribute("bankList", bankList);
		session.setAttribute("payTypeList", payTypeList);

		
		return "shops/order";
	}

	@Transactional
	@RequestMapping(value= "/{userid}/orders", method=RequestMethod.POST)
	public String orderProcess(@PathVariable("userid") String userid
			                 , @RequestParam("usedPoint") double usedPoint
			                 , @RequestParam("deliveryFee") double deliveryFee
			                 , @RequestParam("basketId") BigInteger basketId
			                 , @RequestParam("recipientName") String recipientName
			                 , @RequestParam("address1") String address1
			                 , @RequestParam("address2") String address2
			                 , @RequestParam("postalCode") String postalCode
			                 , @RequestParam("deliveryMemo") String deliveryMemo
			                 , @RequestParam("point") double point
			                 , @RequestParam("repostNumber") double repostNumber
			                 , HttpSession session) {
		
		System.out.println(usedPoint);
		System.out.println(deliveryFee);
		System.out.println(basketId);
		
		profileVo.setUserid(userid);
		profileVo.setRecipientName(recipientName);
		profileVo.setAddress1(address1);
		profileVo.setAddress2(address2);
		profileVo.setPostalCode(postalCode);
		profileVo.setDeliveryMemo(deliveryMemo);
		profileVo.setPoint((int)point);
		profileVo.setRepostNumber((int)repostNumber);
		
		buyService.updateBakset(basketId, deliveryFee, usedPoint);
		buyService.changeOrderStatus(basketId, "OR03");
		profileService.updateShoppingInfo(profileVo);
		
		return "redirect:/";
	}

	
//	@RequestMapping(value= "/{userid}/orders", method=RequestMethod.POST)
//	public String orderProcess(@PathVariable("userid") String userid, ProfileVo profileVo, HttpSession session) {
//		System.out.println(profileVo);
//		profileService.updateShoppingInfo(profileVo);
//		return "redirect:/";
//	}
	
	// 임시 : 장바구니에 물건 추가
	@Transactional
	@RequestMapping(value="/{userid}/temp", method=RequestMethod.GET)
	public String addBuyitems(@PathVariable("userid") String userid) {
		HashMap<String, Object> map = new HashMap<String, Object>();

		System.out.println("구매추가전 ");
		map.put("deliveryFee", 3500);
		map.put("usedPoint", 0);
		map.put("userid", userid);
		map.put("unitPrice", 25000);
		map.put("quantity", 3);
		map.put("productItemId", 13);
		
		buyService.addBuyitems(map);
		System.out.println("구매추가후");
		
		//selectedOptionVo.setBuyItemsId(buyService.getBuyitemsId(userid));
		selectedOptionVo.setOptionType("SIZE");
		selectedOptionVo.setOptionCode("M");
		
		buyService.addSelectedOption(selectedOptionVo);

		selectedOptionVo.setOptionType("COLOR");
		selectedOptionVo.setOptionCode("WHITE");

		buyService.addSelectedOption(selectedOptionVo);
		
		return "redirect:/";
	}

}
