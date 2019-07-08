package vo;

import java.util.Date;

import lombok.Data;

@Data
public class RolesVo {
	private String authority;
	private String rolename;
	private Date createDate;
	private Date updateDate;
}
