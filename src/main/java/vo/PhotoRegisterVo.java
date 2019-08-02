package vo;

import java.math.BigInteger;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class PhotoRegisterVo {
	private BigInteger photoId;
	private String Ax1;
	private String Ax2;
	private String Ay1;
	private String Ay2;
	private String Bx1;
	private String Bx2;
	private String By1;
	private String By2;
	
	private int xAvg;
	private int yAvg;
	private int xBvg;
	private int yBvg;
	
	private BigInteger ARefProductId;
	private String ARefShopid;
	private String ARefLink;
	
	private BigInteger BRefProductId;
	private String BRefShopid;
	private String BRefLink;
}
