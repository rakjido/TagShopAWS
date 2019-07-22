package vo;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class FollowingVo {
	
	private String FollowingId;
	private String UsersUserid;

}
