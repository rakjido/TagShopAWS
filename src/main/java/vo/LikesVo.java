package vo;

import java.math.BigInteger;
import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class LikesVo {
	private BigInteger photoId;
	private String usersUserId;
	private Boolean likeYn;
	private Boolean buyYn;
}
