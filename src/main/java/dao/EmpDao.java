package dao;

import java.util.List;

import vo.EmpVo;

public interface EmpDao {
	
	public void insertEmp(EmpVo dto) throws Exception;
	
	public List<EmpVo> getEmpList() throws Exception;
	
	public EmpVo getEmpByEmpNo(int empno) throws Exception;
	
	public void updateEmp(EmpVo dto) throws Exception;
	
	public void deleteEmp(int empno) throws Exception;
	
}
