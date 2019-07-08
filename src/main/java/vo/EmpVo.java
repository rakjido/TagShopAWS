package vo;

import java.util.Date;

import lombok.Data;

@Data
public class EmpVo {
	private int empno;
	private String ename;
	private String job;
	private int mgr;
	private Date hiredate;
	private int sal;
	private int comm;
	private int deptno;

}
