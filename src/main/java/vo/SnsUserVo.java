package vo;

import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class SnsUserVo {
	private String userid;
	private String password;
	private Boolean enabled;
	private String email;
	private Date createDate;
	private Date updateDate;
	
}