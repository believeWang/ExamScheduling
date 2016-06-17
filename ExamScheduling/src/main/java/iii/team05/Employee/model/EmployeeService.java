package iii.team05.Employee.model;

import java.util.List;
import iii.team05.Employee.model.EmployeeVO;


public class EmployeeService {

	private EmployeeDAO dao;

	public EmployeeService() {
		dao = new EmployeeDAO();
	}

	public EmployeeVO addEmp(String empname, String empemail,
			Integer position,String token) {
		EmployeeVO empVO = new EmployeeVO();

	
		empVO.setEmpname(empname);
		empVO.setEmpemail(empemail);
		empVO.setPosition(position);
		empVO.setToken(token);
		dao.insert(empVO);
		return empVO;
	}

	public EmployeeVO updateEmp(Integer empno, String empname, String empemail,
			Integer position) {
		EmployeeVO empVO = new EmployeeVO();
		empVO.setEmpno(empno);
		empVO.setEmpname(empname);
		empVO.setEmpemail(empemail);
		empVO.setPosition(position);
		dao.update(empVO);
		return empVO;

	}

	public EmployeeVO updateEmp2(Integer empno,Integer position) {
		EmployeeVO newVO = new EmployeeVO();
		newVO.setEmpno(empno);
		newVO.setPosition(position);
		
		
		dao.update(newVO);
		return newVO;
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
	public List<EmployeeVO> getEmp() {
		return dao.getEmp();

	}

	public List<EmployeeVO> check(String ecemail) {

		return dao.google(ecemail);

	}

	public EmployeeVO insertToken(String empemail, String token) {

		EmployeeVO empVO = new EmployeeVO();
		empVO.setEmpemail(empemail);
		empVO.setToken(token);
		dao.insertToken(empVO);
		return empVO;
	}
}
