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
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.scribejava.core.model.OAuth2AccessToken;

import service.AuthoritiesService;
import service.BuyService;
import service.ProfileService;
import service.ShopsService;
import service.UserMailSendService;
import service.UsersService;
import utils.NaverLoginBO;
import utils.RandomValueUtil;
import utils.VerifyRecaptcha;
import vo.AuthoritiesVo;
import vo.CodeVo;
import vo.OptionListVo;
import vo.OptionsVo;
import vo.OrderedItemsVo;
import vo.ProfileVo;
import vo.SelectedOptionVo;
import vo.SnsUserVo;
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
	
	@Autowired
	private NaverLoginBO naverLoginBO;
	
	@Autowired
	private ProfileService profileService;
	
	private String apiResult;
	
	@Value("${facebook.CLIENT_ID}")
	private String FACEBOOK_ID;
	
	@Value("${facebook.CLIENT_SECRET}")
	private String FACEBOOK_SECRET;
	
	@Value("${recaptcha.CLIENT_SECRET}")
	private String RECAPTCHA_SECRET;
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Model model, HttpSession session) {
		logger.debug("[GET] login()");
		
		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		//https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
		//redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
		System.out.println("네이버:" + naverAuthUrl);
		//네이버
		model.addAttribute("url", naverAuthUrl);

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
        
       VerifyRecaptcha.setSecretKey(RECAPTCHA_SECRET);
       System.out.println(RECAPTCHA_SECRET);
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
			,double unitPrice, int quantity, @ModelAttribute OptionListVo optionListVo, String addtocart) {

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

		if(addtocart.equals("basket")) {
			return "redirect:/";
		} else {
			return "redirect:/" + userid + "/orders";
		}
		
	}
	
	// e-mail 인증 컨트롤러
		@RequestMapping(value = "/key_alter", method = RequestMethod.GET)
		public String key_alterConfirm(@RequestParam("user_id") String user_id, @RequestParam("user_key") String key) {

			mailsender.alter_userKey_service(user_id, key); // mailsender의 경우 @Autowired

			return "users/regSuccess";
		}

		
		@RequestMapping(value = "/login_success", method = RequestMethod.GET)
		public String login_Success(HttpServletRequest request, HttpServletResponse response) {
				HttpSession session = request.getSession();
				System.out.println(">>>>> has : " + session.getAttribute("userid")); // key 존재
				String userid = (String)session.getAttribute("userid");
				redisTemplate.opsForValue().set(userid, userid); // 20초 만료
				String value = redisTemplate.opsForValue().get(userid);
				System.out.println(">>>>> redis value : " + value);
				
				
				return "redirect:/";
		}
		
		//김동현이가 만든 페이스북 로그인 *********삭제될지도모름**********
		
		@RequestMapping(value = "/facebookSignin.do")
        public String getfacebookSigninCode(HttpSession session) {
            logger.debug("facebookSignin");

            String facebookUrl = "https://www.facebook.com/v3.3/dialog/oauth?"+
                    "client_id="+FACEBOOK_ID+
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
        	System.out.println("페북 api : " +FACEBOOK_ID);
        	System.out.println("페북 api : " +FACEBOOK_SECRET);
            String facebookUrl = "https://graph.facebook.com/v3.3/oauth/access_token?"+
                                 "client_id="+FACEBOOK_ID+
                                 "&redirect_uri="+"http://localhost:8090/tagshop/users/facebookAccessToken.do"+
                                 "&client_secret="+FACEBOOK_SECRET+
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
            
            String id = (String)jsonObject.get("id");
            String email = (String)jsonObject.get("email");
            String name = (String)jsonObject.get("name");
            
            int result = service.emailCheck(email);
            System.out.println("페북로그인 이메일 비교한다.");
            if(result == 0) {
            	System.out.println("DB에 이메일 XXX");
            	SnsUserVo sns = new SnsUserVo();
            	sns.setUserid(id);
            	sns.setEmail(email);
            	sns.setPassword(this.bCryptPasswordEncoder.encode(RandomValueUtil.getSmsKey()));
            	sns.setEnabled(true);
            	service.addSNS(sns);
            }
            else if(result!=0) {
            	System.out.println("DB에 이메일 OOO");
            }
            session.setAttribute("userid", id); //세션 생성
    		System.out.println("세션 : "+session);
    		System.out.println("userid : "+session.getAttribute("userid"));
    		
        }
        
    	//네이버 로그인 성공시 callback호출 메소드
    	@RequestMapping(value = "/callback", method = { RequestMethod.GET, RequestMethod.POST })
    	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session) throws IOException, ParseException {
    		System.out.println("여기는 callback");
    		OAuth2AccessToken oauthToken;
    		oauthToken = naverLoginBO.getAccessToken(session, code, state);
    		//1. 로그인 사용자 정보를 읽어온다.
    		apiResult = naverLoginBO.getUserProfile(oauthToken); //String형식의 json데이터
    		System.out.println("--아래는 네이버api 결과값--");
    		System.out.println(apiResult);
    		//2. String형식인 apiResult를 json형태로 바꿈
    		JSONParser parser = new JSONParser();
    		Object obj = parser.parse(apiResult);
    		JSONObject jsonObj = (JSONObject) obj;
    		
    		//3. 데이터 파싱
    		//Top레벨 단계 _response 파싱
    		JSONObject response_obj = (JSONObject)jsonObj.get("response");
    		//response의 nickname값 파싱
    		String id = (String)response_obj.get("id");
    		String nickname = (String)response_obj.get("nickname");
    		String email = (String)response_obj.get("email");
    		System.out.println("id : "+id);
    		System.out.println("nickname : "+nickname);
    		System.out.println("email : "+email);
    		
    		int result = service.emailCheck(email);
    		System.out.println("네이버로그인 이메일 비교한다.");
    		if(result==0) {
    			System.out.println("DB에 이메일 XXX");
	    		SnsUserVo sns = new SnsUserVo();
	    		sns.setUserid(id);
	    		sns.setEmail(email);
	    		sns.setPassword(this.bCryptPasswordEncoder.encode(RandomValueUtil.getSmsKey()));
	    		sns.setEnabled(true);
	    		service.addSNS(sns);
	    		
    		}
    		else if(result!=0){
    			System.out.println("DB에 이메일 OOO");
    			
    		}
    		
    		
    		//4.파싱 닉네임 세션으로 저장
    		session.setAttribute("userid", id); //세션 생성
    		model.addAttribute("result", apiResult);
    		System.out.println("세션 : "+session);
    		System.out.println("userid : "+session.getAttribute("userid"));
    		
    		return "redirect:/";
    	}
    	

}