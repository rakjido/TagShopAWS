package vo;

import java.math.BigInteger;
import java.sql.Date;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class CommentsPhotoIdjoinVo {
	
	private BigInteger photoId;
	private String fileName;
	private String descripTion;
	private BigInteger refPhotoid;
	private BigInteger refProductid;
	private Date createDate;
	private Date updateDate;
	private String userId;
	private int dateDiff;

}
