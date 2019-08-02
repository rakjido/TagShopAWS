package vo;

import java.math.BigInteger;
import java.sql.Date;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class CommentsVo {
	
	private BigInteger commentsId;
	private String comments;
	private Boolean buyYn;
	private Date createDate;
	private Date updateDate;
	private BigInteger photoId;
	private String usersUserid;
	
}
