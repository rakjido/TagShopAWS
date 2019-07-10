package controller;

import java.math.BigInteger;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import service.AuthoritiesService;
import service.BuyService;
import service.ShopsService;
import service.UserMailSendService;
import service.UsersService;
import vo.AuthoritiesVo;
import vo.OptionListVo;
import vo.OptionsVo;
import vo.SelectedOptionVo;
import vo.UsersVo;

@Controller
@RequestMapping(value = "/users")
public class UsersController {

	private static final Logger logger = LoggerFactory.getLogger(UsersController.class);

	@Autowired
	private UsersService service;
	
	@Autowired
	private AuthoritiesService authService;
	
	@Autowired
	private BuyService buyService;
	
	@Autowired
	AuthoritiesVo authVo;
	
	@Autowired
	private ShopsService shopsService;
	
	@Autowired
	private SelectedOptionVo selectedOptionVo;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@Autowired
	private UserMailSendService mailsender;
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		logger.debug("[GET] login()");

		return "users/signIn";
	}

//	@RequestMapping(value = "/login", method = RequestMethod.POST)
//	public String getUsers(String userid, String password, HttpSession session) {
//		System.out.println(userid);
//		System.out.println(password);
//		int loginCheck = service.checkLoginId(userid, password);
//		System.out.println(loginCheck);
//		if (loginCheck == 1) {
//			session.setAttribute("userid", userid);
//			return "redirect:/";
//		} else {
//			return "redirect:/users/login";
//		}
//	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

	@RequestMapping(value = "accessDenied", method = RequestMethod.GET)
	public String accessDenied() {
		return "users/accessDenied";
	}
	
	@RequestMapping(value="/signup", method = RequestMethod.GET)
	public String signup() {
		logger.info("[GET] signup()");
		return "users/signUp";
	}
	
	//@Transactional
	@RequestMapping(value="/signup", method = RequestMethod.POST)
	public String signupok(UsersVo vo, HttpServletRequest request) {
		logger.info("[POST] signup()");
		
		vo.setPassword(this.bCryptPasswordEncoder.encode(vo.getPassword()));
		service.addUsers(vo);
		
		mailsender.mailSendWithUserKey(vo.getEmail(), vo.getUserid(), request);



		// 2019.06.19 @transactional 대신 mysql의 trigger를 적용  
		// @Transactional로 transaction 적용 

//		authVo.setUserid(vo.getUserid());
//		authVo.setAuthority("ROLE_USER");
//		authService.addAuthorities(authVo);
		
		return "redirect:/";
	}
	
	@Transactional
	@RequestMapping(value="/{userid}/baskets/{productItemid}", method=RequestMethod.POST)
	public String addBuyitems(@PathVariable("userid") String userid, @PathVariable("productItemid") BigInteger productItemid 
			,double unitPrice, int quantity, @ModelAttribute OptionListVo optionListVo) {

		HashMap<String, Object> map = new HashMap<String, Object>();

		System.out.println("구매추가전 ");
		map.put("deliveryFee", 2500);
		map.put("usedPoint", 0);
		map.put("userid", userid);
		map.put("unitPrice", unitPrice);
		map.put("quantity", quantity);
		map.put("productItemId", productItemid);
		
		buyService.addBuyitems(map);
		System.out.println("구매추가후");
		
		List<BigInteger> list = buyService.getBuyitemsId(userid);
		List<OptionsVo> optionList = shopsService.getOption(productItemid);
		
		
		for (int i = 0; i < optionListVo.getOptionList().size(); i++) {
			String str = optionListVo.getOptionList().get(i).getOption();

			String typeStr = str.substring(0,str.lastIndexOf(":")); //color
			String codeStr = str.substring(str.lastIndexOf(":")+1); //blue,red
			
			
			selectedOptionVo.setBuyItemsId(list.get(list.size()-1));
			selectedOptionVo.setOptionCode(codeStr);
			selectedOptionVo.setOptionType(typeStr);
			buyService.addSelectedOption(selectedOptionVo);
		}
		
/*		for(int i = 0; i < optionListVo.getOptionList().size(); i++) {
			String str = optionListVo.getOptionList().get(i).getOption();

			String typeStr = str.substring(0,str.lastIndexOf(":")); //color
			String codeStr = str.substring(str.lastIndexOf(":")+1); //blue,red
			
			System.out.println("typeStr"+typeStr);
			System.out.println("codeStr" +codeStr);
				
			optionsVo.setOptionCode(codeStr);
			optionsVo.setOptionType(typeStr);
			

		}*/

		
		return "redirect:/";
	}
	
	// e-mail 인증 컨트롤러
		@RequestMapping(value = "/key_alter", method = RequestMethod.GET)
		public String key_alterConfirm(@RequestParam("user_id") String user_id, @RequestParam("user_key") String key) {

			mailsender.alter_userKey_service(user_id, key); // mailsender의 경우 @Autowired

			return "users/regSuccess";
		}
		
		@RequestMapping(value="/googleLogin", method = RequestMethod.GET)
		public String googleLogin() {
			return "users/googleLogin";
		}

}
