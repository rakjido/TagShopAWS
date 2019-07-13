package vo;

import java.math.BigInteger;
import java.util.Date;

import lombok.Data;

@Data
public class BasketsVo {
	private BigInteger basketId;
	private double deliveryFee;
	private double userdPoint;
	private String payTypeCode;
	private Date createDate;
	private Date updateDate;
	private String userid;
}
