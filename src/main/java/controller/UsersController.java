package controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import service.AuthoritiesService;
import service.UsersService;
import vo.AuthoritiesVo;
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
	AuthoritiesVo authVo;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

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
	public String signupok(UsersVo vo) {
		logger.info("[POST] signup()");
		
		vo.setPassword(this.bCryptPasswordEncoder.encode(vo.getPassword()));
		service.addUsers(vo);

		// 2019.06.19 @transactional 대신 mysql의 trigger를 적용  
		// @Transactional로 transaction 적용 

//		authVo.setUserid(vo.getUserid());
//		authVo.setAuthority("ROLE_USER");
//		authService.addAuthorities(authVo);
		
		return "redirect:/";
	}

}
