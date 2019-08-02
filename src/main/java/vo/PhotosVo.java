package vo;

import java.math.BigInteger;
import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class PhotosVo {
	
	private BigInteger photoId;
	private String fileName;
	private String descripTion;
	private BigInteger refPhotoid;
	private BigInteger refProductid;
	private String refShopid;
	private String refLink;
	private Date createDate;
	private String dateDiff;
	private Date updateDate;
	private String userId;
	
}
