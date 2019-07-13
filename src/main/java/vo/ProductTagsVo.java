package vo;



import java.math.BigInteger;

import org.springframework.stereotype.Service;

import lombok.Data;

@Service
@Data
public class ProductTagsVo {
	private BigInteger tagsId;
	private BigInteger productId;
}
