package vo;

import java.math.BigInteger;

import org.springframework.stereotype.Service;

import lombok.Data;

@Service
@Data
public class SelectedOptionVo {
	private BigInteger optionId;
	private String optionType;
	private String optionCode;
	private BigInteger buyItemsId;
}
