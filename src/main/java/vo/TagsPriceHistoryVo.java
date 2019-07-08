package vo;

import java.math.BigInteger;

import lombok.Data;

@Data
public class TagsPriceHistoryVo {

	private String baseDate;
	private BigInteger tagsId;
	private double price;
	private String currencyCode;
}
