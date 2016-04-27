package iii.team05.examinee.ecmodel;



import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;



import iii.team05.hibernate.util.*;

public class ECHibernateDAO implements ExamineeCatDao_interface{
	private static final String GET_ALL_STMT = "from ExamineeCatVO order by ecno";
	@Override
	public void insert(ExamineeCatVO examineecatVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(examineecatVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
	}

	@Override
	public void update(ExamineeCatVO examineecatVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(examineecatVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		
	}

	@Override
	public void delete(String ecno) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			ExamineeCatVO examineecatVO = (ExamineeCatVO) session.get(ExamineeCatVO.class, ecno);			
			session.delete(examineecatVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		
	}

	@Override
	public ExamineeCatVO findByPrimaryKey(String ecno) {
		ExamineeCatVO examineecatVO = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			examineecatVO = (ExamineeCatVO) session.get(ExamineeCatVO.class, ecno);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return examineecatVO;
	}

	@Override
	public List<ExamineeCatVO> getAll() {
		List<ExamineeCatVO> list = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery(GET_ALL_STMT);
			list = query.list();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return list;
		
	}

}
