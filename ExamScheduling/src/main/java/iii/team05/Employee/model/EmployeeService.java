package iii.team05.Employee.model;

import java.util.List;

import iii.team05.Employee.model.EmployeeVO;
import iii.team05.mes.model.MesVO;

public class EmployeeService {

	private EmployeeDAO dao;

	public EmployeeService() {
		dao = new EmployeeDAO();
	}

	
	public EmployeeVO addEmp(Integer empno,String empname,String empemail,Integer position) {
		EmployeeVO empVO = new EmployeeVO();
		
		empVO.setEmpno(empno);
		empVO.setEmpname(empname);
		empVO.setEmpemail(empemail);
		empVO.setPosition(position);
		dao.insert(empVO);
		return empVO;
	}
	public EmployeeVO updateEmp(Integer empno,String empname,String empemail,Integer position) {
		EmployeeVO empVO = new EmployeeVO();
		
		empVO.setEmpno(empno);
		empVO.setEmpname(empname);
		empVO.setEmpemail(empemail);
		empVO.setPosition(position);
		dao.update(empVO);
		return empVO;
	}
	public void deleteEmp(Integer empno) {
		 dao.delete(empno);
		 }
	public EmployeeVO getOneEmp(Integer empno) {
		return dao.findByPrimaryKey(empno);
	}
	public List<EmployeeVO> getAll() {
		return dao.getAll();
	}

	public List<EmployeeVO> getExam() {
		return dao.getExam();
	}
	
	
}
