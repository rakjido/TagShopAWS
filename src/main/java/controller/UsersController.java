package controller;

import java.io.IOException;
import java.math.BigInteger;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.BasicResponseHandler;
import org.apache.http.impl.client.HttpClientBuilder;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import service.AuthoritiesService;
import service.BuyService;
import service.ShopsService;
import service.UserMailSendService;
import service.UsersService;
import utils.VerifyRecaptcha;
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
	
	@Autowired
	private RedisTemplate<String, String> redisTemplate;
	
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
	@ResponseBody
	@RequestMapping(value="/signup", method = RequestMethod.POST)
	public int signupok(UsersVo vo, @RequestParam("g-recaptcha-response") String recaptcha, HttpServletRequest request) {
		logger.info("[POST] signup()");
		
        VerifyRecaptcha.setSecretKey("6LeNoKgUAAAAAHE6-GzKInsXCj2P5Y7g3smNsOn-");
        String gRecaptchaResponse = recaptcha;
        System.out.println(gRecaptchaResponse);
        try {
            if(VerifyRecaptcha.verify(gRecaptchaResponse)){
            	
            	vo.setPassword(this.bCryptPasswordEncoder.encode(vo.getPassword()));
            	service.addUsers(vo);
            	
            	mailsender.mailSendWithUserKey(vo.getEmail(), vo.getUserid(), request);
            	
            	return 0;
            }
            else return 1;
        } catch (IOException e) {
            e.printStackTrace();
            return -1;
        }
		
		



		// 2019.06.19 @transactional 대신 mysql의 trigger를 적용  
		// @Transactional로 transaction 적용 

//		authVo.setUserid(vo.getUserid());
//		authVo.setAuthority("ROLE_USER");
//		authService.addAuthorities(authVo);
		
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
			logger.info("[GET] key_alterConfirm");
			mailsender.alter_userKey_service(user_id, key); // mailsender의 경우 @Autowired

			return "users/regSuccess";
		}

		
		@RequestMapping(value = "/login_success", method = RequestMethod.GET)
		public String login_Success(HttpServletRequest request, HttpServletResponse response) {
//				HttpSession session = request.getSession();
//				System.out.println(">>>>> has : " + session.getAttribute("userid")); // key 존재
//				String userid = (String)session.getAttribute("userid");
//				redisTemplate.opsForValue().set(userid, userid); // 20초 만료
//				String value = redisTemplate.opsForValue().get(userid);
//				System.out.println(">>>>> redis value : " + value);
				
				return "redirect:/";
		}
		
		//김동현이가 만든 페이스북 로그인 *********삭제될지도모름**********
		
		@RequestMapping(value = "/facebookSignin.do")
        public String getfacebookSigninCode(HttpSession session) {
            logger.debug("facebookSignin");

            String facebookUrl = "https://www.facebook.com/v3.3/dialog/oauth?"+
                    "client_id="+"694347417654617"+
                    "&redirect_uri=http://localhost:8090/tagshop/users/facebookAccessToken.do"+
                    "&scope=public_profile,email";
                    
                            
            return "redirect:" + facebookUrl;
        
        }
        
        //Facebook 토큰으로 요청
        @RequestMapping(value = "/facebookAccessToken.do")
        public String getFacebookSignIn(String code, HttpSession session, String state) throws Exception {
            logger.debug("facebookAccessToken / code : "+code);
            
            String accessToken = requestFaceBooktAccesToken(session, code);
            facebookUserDataLoadAndSave(accessToken, session);
            
            return "redirect:/";
        }
        
        //Facebook 토큰으로 요청한 값 받아와서 리턴
        private String requestFaceBooktAccesToken(HttpSession session, String code) throws Exception {
            String facebookUrl = "https://graph.facebook.com/v3.3/oauth/access_token?"+
                                 "client_id="+"694347417654617"+
                                 "&redirect_uri="+"http://localhost:8090/tagshop/users/facebookAccessToken.do"+
                                 "&client_secret="+"e7c980c946ccaaf63948de8116d86e2e"+
                                 "&code="+code;
            
            HttpClient client = HttpClientBuilder.create().build();
            HttpGet getRequest = new HttpGet(facebookUrl);
            String rawJsonString = client.execute(getRequest, new BasicResponseHandler());
            logger.debug("facebookAccessToken / raw json : "+rawJsonString);
            
            JSONParser jsonParser = new JSONParser();
            JSONObject jsonObject = (JSONObject) jsonParser.parse(rawJsonString);
            String faceBookAccessToken = (String) jsonObject.get("access_token");
            logger.debug("facebookAccessToken / accessToken : "+faceBookAccessToken);
            
            session.setAttribute("faceBookAccessToken", faceBookAccessToken);
            
            return faceBookAccessToken;
        }
        
        //Facebook Json으로 저장 / Facebook에 요청할 데이터
        private void facebookUserDataLoadAndSave(String accessToken, HttpSession session) throws Exception {
            String facebookUrl = "https://graph.facebook.com/me?"+
                                    "access_token="+accessToken+
                                    "&fields=id,name,email";
            
            System.out.println("@@@@@@확인용@@@@@@" + facebookUrl);
            
            HttpClient client = HttpClientBuilder.create().build();
            HttpGet getRequest = new HttpGet(facebookUrl);
            String rawJsonString = client.execute(getRequest, new BasicResponseHandler());
            logger.debug("facebookAccessToken / rawJson! : "+rawJsonString);

            JSONParser jsonParser = new JSONParser();
            JSONObject jsonObject = (JSONObject) jsonParser.parse(rawJsonString);
            
            logger.debug("facebookUserDataLoadAndSave / raw json : "+jsonObject);
            System.out.println("@@@@@@@@@@@제이슨입니당@@@@@@@@@@@" + jsonObject);
            
//            HashMap<String, Object> userData = new HashMap<String, Object>();
        }

}
