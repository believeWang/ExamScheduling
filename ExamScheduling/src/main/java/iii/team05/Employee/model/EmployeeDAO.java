package iii.team05.Employee.model;

import org.hibernate.*;


import iii.team05.hibernate.util.*;

import java.util.*;

public class EmployeeDAO implements EmployeeDAO_interface {
	private static final String GET_ALL_EMP = "from EmployeeVO where position=1 order by empno";
	private static final String GET_ALL_EXAM = "from EmployeeVO where position=0 order by empno";
	private static final String CHECK_MAIL = "from EmployeeVO where empemail = :empemail";							
	@Override
	public void insert(EmployeeVO employeeVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(employeeVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}

	}

	@Override
//	public void update(EmployeeVO employeeVO) {
//		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
//		try {
//			session.beginTransaction();
//			session.saveOrUpdate(employeeVO);
//			session.getTransaction().commit();
//		} catch (RuntimeException ex) {
//			session.getTransaction().rollback();
//			throw ex;
//		}
//
//	}
	public void update(EmployeeVO employeeVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery("update EmployeeVO set position = :position where empno=:empno");
			Integer empno=employeeVO.getEmpno();
			int position=employeeVO.getPosition();
			query.setParameter("empno",empno);
			query.setParameter("position",position);
			query.executeUpdate();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
	}
	@Override
	public void delete(Integer empno) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			EmployeeVO employeeVO = (EmployeeVO) session.get(EmployeeVO.class, empno);
			session.delete(employeeVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}

	}

	@Override
	public EmployeeVO findByPrimaryKey(Integer empno) {
		EmployeeVO deptVO = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			deptVO = (EmployeeVO) session.get(EmployeeVO.class, empno);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return deptVO;
	}

	@Override
	public List<EmployeeVO> getAll() {
		List<EmployeeVO> list = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery(GET_ALL_EMP);
			list = query.list();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return list;
	}	
	
	@Override
	public List<EmployeeVO> getExam() {
		List<EmployeeVO> list = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery(GET_ALL_EXAM);
			list = query.list();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return list;
	}	
	
	public List<EmployeeVO> google(String empemail) {
		List<EmployeeVO> list = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			System.out.println(empemail);
			session.beginTransaction();
			Query query = session.createQuery(CHECK_MAIL);
			query.setParameter("empemail", empemail);			
			list = query.list();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return list;
		
	}

	
	public void insertToken(EmployeeVO emVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery("update EmployeeVO set token = :token where empemail=:empemail");
			String empemail=emVO.getEmpemail();
			String token=emVO.getToken();
			query.setParameter("token",token);
			query.setParameter("empemail",empemail);
			query.executeUpdate();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
	}
//	public static void main(String[] args) {
//		EmployeeDAO dao = new EmployeeDAO();
//		
//		iii.team05.Employee.model.EmployeeVO deptVO = new iii.team05.Employee.model.EmployeeVO(); // 部門POJO
//	
//		
//		
//		List<EmployeeVO> list = dao.getAll();//查詢測試
//		for (EmployeeVO aEmp : list) {
//			System.out.print(aEmp.getEmpno() + ",");
//			System.out.print(aEmp.getEmpname() + ",");
//			System.out.print(aEmp.getEmpemail() + ",");
//			System.out.print(aEmp.getPosition() + ",");
//			
//			System.out.println();
//		}
//		//dao.delete(6);//刪除測試
//				
//	}

	
	
	

		
}
