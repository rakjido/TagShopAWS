package vo;

import java.math.BigInteger;

import org.springframework.stereotype.Service;

import lombok.Data;

@Service
@Data
public class Back_OrderedItemsVo {
	private BigInteger productId;
	private BigInteger productitemId;
	private BigInteger basketId;
	private BigInteger buyitemsId;
	private String productName;
	private String photoFile;
	private double unitPrice;
	private int quantity;
	private double totalPrice;
}
