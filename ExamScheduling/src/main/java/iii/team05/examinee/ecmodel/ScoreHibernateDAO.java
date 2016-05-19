package iii.team05.examinee.ecmodel;



import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;



import iii.team05.hibernate.util.*;

public class ScoreHibernateDAO implements ScoreDao_interface{
	private static final String GET_ALL_STMT = "from ScoreVO order by ecno";
	@Override
	public void insert(ScoreVO scoreVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(scoreVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
	}

	@Override
	public void update(ScoreVO scoreVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(scoreVO);
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
			ScoreVO scoreVO = (ScoreVO) session.get(ScoreVO.class, ecno);			
			session.delete(scoreVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		
	}

	@Override
	public ScoreVO findByPrimaryKey(String ecno) {
		ScoreVO scoreVO = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			scoreVO = (ScoreVO) session.get(ScoreVO.class, ecno);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return scoreVO;
	}

	@Override
	public List<ScoreVO> getAll() {
		List<ScoreVO> list = null;
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
