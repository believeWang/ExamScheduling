package iii.team05.slide.model;


import iii.team05.hibernate.util.HibernateUtil;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

public class BannerHibernateDAO implements BannerDao_interface{
	private static final String GET_ALL_STMT = "from BannerVO order by slideid";
	@Override
	public void insert(BannerVO BannerVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(BannerVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
	}

	@Override
	public void update(BannerVO BannerVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(BannerVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		
	}

	@Override

	public void delete(Integer slideid) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			BannerVO examineecatVO = (BannerVO) session.get(BannerVO.class, slideid);			
			session.delete(examineecatVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		
	}

	@Override
	public BannerVO findByPrimaryKey(String slideid) {
		BannerVO examineecatVO = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			examineecatVO = (BannerVO) session.get(BannerVO.class, slideid);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return examineecatVO;
	}

	@Override
	public List<BannerVO> getAll() {
		List<BannerVO> list = null;
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

	public void updatslidephoto(BannerVO baVO) {
		
		
	}
}
