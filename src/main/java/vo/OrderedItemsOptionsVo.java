package vo;

import java.math.BigInteger;

import org.springframework.stereotype.Service;

import lombok.Data;

@Service
@Data
public class OrderedItemsOptionsVo {
	private BigInteger buyitemsId;
	private String optionType;
	private String optionCode;
}
