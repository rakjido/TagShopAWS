package vo;

import java.io.Serializable;
import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class UsersVo implements Serializable{
	private String userid;
	private String password;
	private Boolean enabled;
	private String email;
	private String phone;
	private Date createDate;
	private Date updateDate;
	
}
