package iii.team05.jober.model;

import iii.team05.hibernate.util.HibernateUtil;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

public class JobErDAO implements JobErDAO_interface{
	private static final String GET_ALL_STMT = "from Job_Er order by empno";
	@Override
	public void insert(JobErVO jobErVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();//創建Session()
		try {
			session.beginTransaction();//1
			session.saveOrUpdate(jobErVO);
			session.getTransaction().commit();//2
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();//3
			throw ex;
		}
		
	}

	@Override
	public void update(JobErVO jobErVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(jobErVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		
	}

	@Override
	public void delete(Integer jobid) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			JobErVO jobErVO = (JobErVO) session.get(JobErVO.class, jobid);			
			session.delete(jobErVO);
			System.out.println(session);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		
	}

	@Override
	public JobErVO findByPrimaryKey(Integer id) {
		JobErVO jobErVO = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			jobErVO = (JobErVO) session.get(JobErVO.class, id);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return jobErVO;
	}

	@Override
	public List<JobErVO> getAll() {
		List<JobErVO> list = null;
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
