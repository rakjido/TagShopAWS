package service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import dao.EmpDao;
import vo.EmpVo;

@Service
public class EmpServiceImpl implements EmpService {

	@Inject
	private EmpDao dao;
	
	@Override
	public void registerEmp(EmpVo dto) throws Exception {
		dao.insertEmp(dto);
	}

	@Override
	public EmpVo readEmp(int empno) throws Exception {
		return dao.getEmpByEmpNo(empno);
	}

	@Override
	public List<EmpVo> listEmp() throws Exception {
		return dao.getEmpList();
	}

	@Override
	public void updateEmp(EmpVo dto) throws Exception {
		dao.updateEmp(dto);
	}

	@Override
	public void removeEmp(int empno) throws Exception {
		dao.deleteEmp(empno);	
	}

}
