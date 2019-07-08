package service;

import java.util.List;

import vo.EmpVo;

public interface EmpService {

	public void registerEmp(EmpVo dto) throws Exception;
	
	public EmpVo readEmp(int empno) throws Exception;
	
	public List<EmpVo> listEmp() throws Exception;
	
	public void updateEmp(EmpVo dto) throws Exception;
	
	public void removeEmp(int empno) throws Exception;
	
}
