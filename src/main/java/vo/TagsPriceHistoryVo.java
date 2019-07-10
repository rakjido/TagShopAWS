package vo;

import java.math.BigInteger;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class TagsPriceHistoryVo {

	private String baseDate;
	private BigInteger tagsId;
	private double price;
	private String currencyCode;
}
