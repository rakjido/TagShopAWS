package utils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import service.LogsService;


public class LoggerIntercepter implements HandlerInterceptor {

	private static final Logger logger = LoggerFactory.getLogger(LoggerIntercepter.class);
	
	@Autowired
	private LogsService service;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		HttpSession session = request.getSession();
		String userid = "ANONYMOUS";
		if(session.getAttribute("userid")!=null) {
			userid = (String)session.getAttribute("userid");
		}
		String ipAddress = IpAddressUtil.getLocalIPv4Address().toString().replaceAll("/", "");
		logger.info("{" + userid + "@" + IpAddressUtil.getLocalIPv4Address() + " : " + request.getRequestURI() + "}");
		service.addLogs(userid, ipAddress, request.getRequestURI());
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView mv)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception e)
			throws Exception {
		// TODO Auto-generated method stub
		
	}



}
