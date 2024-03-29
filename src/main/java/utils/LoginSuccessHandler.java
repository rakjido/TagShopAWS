package utils;

import java.io.IOException;
import java.util.concurrent.TimeUnit;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.web.servlet.ModelAndView;

import dao.ShopsDao;

public class LoginSuccessHandler implements AuthenticationSuccessHandler {

	//@Autowired
	//private ShopsService shopsService;
	
	private SqlSession sqlSession;    
	public SqlSession getSqlSession() {return sqlSession;    }
	public void setSqlSession(SqlSession sqlSession) {this.sqlSession = sqlSession;}
	
	@Autowired
	private RedisTemplate<String, String> redisTemplate;
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication auth)
			throws IOException, ServletException {
		
		String username="";
		String shopid ="";

		
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if (principal instanceof UserDetails) {
		  username = ((UserDetails)principal).getUsername();
		} else {
		  username = principal.toString();
		}		
		
		ShopsDao dao = sqlSession.getMapper(ShopsDao.class);
		shopid = dao.getShopId(username);
		
		HttpSession session = request.getSession();
		session.setAttribute("userid", username);
		if(shopid !="") {
			session.setAttribute("shopid", shopid);
		}
		
		response.sendRedirect(request.getContextPath() + "/users/login_success");
	}

}
