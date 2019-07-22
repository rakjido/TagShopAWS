package vo;

import java.math.BigInteger;

import org.springframework.stereotype.Service;

import lombok.Data;

@Service
@Data
public class PhotoTagsJoinVo {
	
	private BigInteger photoId;
	private BigInteger tagsId;
	private String tagsNameKo;
}
