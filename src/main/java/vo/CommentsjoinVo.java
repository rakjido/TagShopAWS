package vo;

import java.math.BigInteger;
import java.sql.Date;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class CommentsjoinVo {
	
	private BigInteger commentsId;
	private String comments;
	private boolean buyYn;
	private Date createDate;
	private int dateDiff;
	private Date updateDate;
	private BigInteger photoId;
	private String usersUserId;
	private String photoName;

}
