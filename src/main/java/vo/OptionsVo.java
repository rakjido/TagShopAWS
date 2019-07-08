package vo;

import java.math.BigInteger;

import org.springframework.stereotype.Service;

import lombok.Data;

@Service
@Data
public class OptionsVo {
	private BigInteger optionid;
	private String optionCode;
	private String optionType;
	private BigInteger productItemid;
}
