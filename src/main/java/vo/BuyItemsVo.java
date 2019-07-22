package vo;

import java.math.BigInteger;

import lombok.Data;

@Data
public class BuyItemsVo {
	private BigInteger buyItemsId;
	private double unitPrice;
	private int quantity;
	private String orderStatusCode;
	private BigInteger basketId;
	private BigInteger productItemId;
}
