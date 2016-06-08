package iii.team05.job.model;

import iii.team05.hibernate.util.HibernateUtil;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

public class JobDAO implements JobDAO_interface{
	private static final String GET_ALL_STMT = "FROM JobVO";
	
	@Override
	public void insert(JobVO jobVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();//創建Session()
		try {
			session.beginTransaction();//1
			session.saveOrUpdate(jobVO);
			session.getTransaction().commit();//2.
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();//3
			throw ex;
		}
		
	}

	@Override
	public void update(JobVO jobVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(jobVO);
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
			JobVO jobVO = (JobVO) session.get(JobVO.class, jobid);			
			session.delete(jobVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		
	}

	@Override
	public JobVO findByPrimaryKey(Integer jobid) {
		JobVO jobVO = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			jobVO = (JobVO) session.get(JobVO.class, jobid);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return jobVO;
	}

	@Override
	public List<JobVO> getAll() {
		List<JobVO> list = null;
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
	
	@Override
	public int insert_return_id(JobVO jobVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();//創建Session()
		try {
			session.beginTransaction();//1
			session.saveOrUpdate(jobVO);
			session.getTransaction().commit();//2.
			
			int id = jobVO.getJobid();
			return id;
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();//3
			throw ex;
		}
		
	}

}

