package vo;

import org.springframework.stereotype.Service;

import lombok.Data;

@Service
@Data
public class ManagementVo {
	String dateTimes;
//	String recipientName;
	String userid;
	double deliveryFee;
//	String postalCode;
//	String address;
//	double usedPoint;
//	String payTypeCode;
//	String productId;
	String productName;
//	String buyItemsId;
	double unitPrice;
	int quantity;
	String orderStatusCode;
}