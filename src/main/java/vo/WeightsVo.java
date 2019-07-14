package vo;

import java.math.BigInteger;

import org.springframework.stereotype.Service;

import lombok.Data;

@Service
@Data
public class WeightsVo {
	private String baseDate;
	private BigInteger weightsid;
	private double wLikes;
	private double wBuyLikes;
	private double wComments;
	private double wBuyCmts;
	private double wRepost;
	private double wFollowing;
}
