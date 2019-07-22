package vo;

import java.util.Date;

import lombok.Data;

@Data
public class MyOrderVo {
	private String productname;
	private int buyitemsid;
	private String orderstatuscode;
	private int quantity;
	private int unitprice;
	private Date createdate;
	private String photofile;
}
