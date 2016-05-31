package iii.team05.abouteditor;


import iii.team05.hibernate.util.HibernateUtil;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

public class AbouteditorDAO implements AbouteditorInterface{
	private static final String GET_ALL_STMT = "from STVO order by setid";

	@Override
	public void insert(AbouteditorVO abvo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void update(AbouteditorVO abVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(abVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
	}

	@Override
	public void delete(Integer aboutid) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public AbouteditorVO findByPrimaryKey(Integer aboutid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<AbouteditorVO> getAll() {
		List<AbouteditorVO> list = null;
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
	

	/*讀取about內文*/
	public void queryabout(AbouteditorVO abVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery("from AbouteditorVO where aboutcontent=:aboutcontent");
			String aboutcontent=abVO.getAboutcontent();
			query.setParameter("aboutcontent",aboutcontent);
			query.executeUpdate();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		
	}
	
    /*about內文更新寫入*/
	public void updateabout(AbouteditorVO abVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery("update AbouteditorVO set aboutcontent = :aboutcontent");
			String aboutcontent=abVO.getAboutcontent();
//			Integer aboutid=AbouteditorVO.getaboutid();
			query.setParameter("aboutcontent", aboutcontent);
//			query.setParameter("aboutid", aboutid);
			query.executeUpdate();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		
	}
}
