package vo;

import java.math.BigInteger;

import org.springframework.stereotype.Service;

import lombok.Data;

@Service
@Data
public class PhotoLikePhotosVo {

	private BigInteger photoId;
	private String fileName;
	private int cnt_Like;
	private String userId;
	
}