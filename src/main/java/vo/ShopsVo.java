package vo;

import java.math.BigInteger;
import java.util.Date;

import org.springframework.stereotype.Service;

import lombok.Data;
@Service
@Data
public class ShopsVo {
	private String shopid;
	private String corporateName;
	private String corporateRegisterNumber;
	private String brandName;
	
	private String phone;
	private String phone1;
	private String phone2;
	private String phone3;
	
	private boolean enabled;
	private String bankCode;
	
	private String bankAccount;
	
	private Date createDate;
	private Date UpdateDate;
	
	private String userid;
	
	
	
}
