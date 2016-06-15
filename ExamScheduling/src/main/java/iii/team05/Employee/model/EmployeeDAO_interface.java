package iii.team05.Employee.model;


import java.util.*;

public interface EmployeeDAO_interface {
          public void insert(EmployeeVO employeeVO);
          public void update(EmployeeVO employeeVO);
          public void delete(Integer empno);
          public EmployeeVO findByPrimaryKey(Integer empno);
          public List<EmployeeVO> getAll();
          public List<EmployeeVO> getExam();
          public List<EmployeeVO> getEmp();
		public List<EmployeeVO> getAllEmp();
		

         
		
}
