package service;

import java.util.HashMap;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import dao.UsersDao;

@Service
public class UserMailSendService {
	
	@Autowired
	private JavaMailSender mailSender;

	@Autowired
	private SqlSession sqlsession;
	
	
	// 이메일 난수 만드는 메서드
		private String init() {
			Random ran = new Random();
			StringBuffer sb = new StringBuffer();
			int num = 0;

			do {
				num = ran.nextInt(75) + 48;
				if ((num >= 48 && num <= 57) || (num >= 65 && num <= 90) || (num >= 97 && num <= 122)) {
					sb.append((char) num);
				} else {
					continue;
				}

			} while (sb.length() < size);
			if (lowerCheck) {
				return sb.toString().toLowerCase();
			}
			return sb.toString();
		}

		// 난수를 이용한 키 생성
		private boolean lowerCheck;
		private int size;

		public String getKey(boolean lowerCheck, int size) {
			this.lowerCheck = lowerCheck;
			this.size = size;
			return init();
		}

		// 회원가입 발송 이메일(인증키 발송)
		public void mailSendWithUserKey(String e_mail, String user_id, HttpServletRequest request) {
			
			String key = getKey(false, 20);
			UsersDao dao = sqlsession.getMapper(UsersDao.class);
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("userid", user_id);
			map.put("emailkey", key);
			
			dao.updateKey(map);
			
			MimeMessage mail = mailSender.createMimeMessage();
			String htmlStr = "<h2>안녕하세요 TAG # 입니다!</h2><br><br>" 
					+ "<h3>" + user_id + "님</h3>" + "<p>인증하기 버튼을 누르시면 로그인을 하실 수 있습니다 : " 
					+ "<a href='http://localhost:8080" + request.getContextPath() + "/users/key_alter?user_id="+ user_id +"&user_key="+key+"'>인증하기</a></p>"
					+ "(혹시 잘못 전달된 메일이라면 이 이메일을 무시하셔도 됩니다)";
			try {
				mail.setSubject("[본인인증] MS :p 민수르님의 인증메일입니다", "utf-8");
				mail.setText(htmlStr, "utf-8", "html");
				mail.addRecipient(RecipientType.TO, new InternetAddress(e_mail));
				mailSender.send(mail);
			} catch (MessagingException e) {
				e.printStackTrace();
			}
			
			// 아마존 주소 : http://54.180.117.142/MS/user/key_alter?user_id=
			
		}
		
		// 인증 확인 메서드 (Y 값으로 바꿔주는 메서드)
		public int alter_userKey_service(String userid, String emailkey) {
			
			int resultCnt = 0;
			
			UsersDao dao = sqlsession.getMapper(UsersDao.class);
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("userid", userid);
			map.put("emailkey", emailkey);
			
			resultCnt = dao.alter_userKey(map);
			
			return resultCnt;
		}
}
