package iii.team05.examinee.ecmodel;



import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;



import iii.team05.hibernate.util.*;

public class ESHibernateDAO implements ESDao_interface{
	private static final String GET_ALL_STMT = "from ESVO order by ecno";
	@Override
	public void insert(ESVO examineeSubVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(examineeSubVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
	}

	@Override
	public void update(ESVO examineeSubVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(examineeSubVO);
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
			ESVO examineeSubVO = (ESVO) session.get(ESVO.class, ecno);			
			session.delete(examineeSubVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		
	}

	@Override
	public ESVO findByPrimaryKey(String ecno) {
		ESVO examineeSubVO = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			examineeSubVO = (ESVO) session.get(ESVO.class, ecno);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return examineeSubVO;
	}

	@Override
	public List<ESVO> getAll() {
		List<ESVO> list = null;
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
