package vo;

import java.math.BigInteger;
import java.util.List;

import org.springframework.stereotype.Service;

import lombok.Data;

@Service
@Data
public class OrderedItemsVo {
	private String shopId;
	private BigInteger productId;
	private BigInteger productitemId;
	private BigInteger basketId;
	private BigInteger buyitemsId;
	private double deliveryFee;
	private double usedPoint;
	private String productName;
	private String photoFile;
	private double unitPrice;
	private int quantity;
	private double totalPrice;
	private List<OrderedItemsOptionsVo> options;
}