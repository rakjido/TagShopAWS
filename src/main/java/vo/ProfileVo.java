package vo;

import org.springframework.stereotype.Service;

import lombok.Data;

@Service
@Data
public class ProfileVo {
	private String userid;
	private String introduction;
	private String website;
	private String photoName;
	private String recipientName;
	private String address1;
	private String address2;
	private String postalCode;
	private String countryCode;
	private String deliveryMemo;
	private int point;
	private int repostNumber;
}
