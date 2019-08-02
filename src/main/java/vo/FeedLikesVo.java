package vo;

import java.math.BigInteger;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class FeedLikesVo {
	private BigInteger photoId;
	private int cnt;
}
