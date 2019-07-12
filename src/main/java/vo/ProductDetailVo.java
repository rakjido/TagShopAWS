package vo;

import java.math.BigInteger;
import java.util.List;

import org.apache.ibatis.annotations.Options;
import org.springframework.stereotype.Service;

import lombok.Data;
@Service
@Data
public class ProductDetailVo {
	
	private String shopid;
	private String productName;
	private Double unitPrice;
	private String photoFile;
	private BigInteger productid;
	private BigInteger productItemid;
	private String description;
	private List<OptionsVo> options;
}
