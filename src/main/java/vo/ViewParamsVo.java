package vo;

import java.math.BigInteger;

import org.springframework.stereotype.Service;

import lombok.Data;

@Service
@Data
public class ViewParamsVo {
	private String baseDate;
	private BigInteger photoid;
	private double likes;
	private double buylikes;
	private double comments;
	private double buycmts;
	private double repost;
	private double buyrepost;
	private double following;
}
