package vo;

import java.math.BigInteger;

import org.springframework.stereotype.Service;

import lombok.Data;

@Service
@Data
public class ProductItemVo {
	private BigInteger productItemid;
	private String productName;
	private double unitPrice;
	private BigInteger productid;
}
