package iii.team05.setting.model;

import iii.team05.setting.model.STVO;
import iii.team05.examinee.ecmodel.ECVO;
import iii.team05.hibernate.util.HibernateUtil;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

public class STHibernateDAO implements STDao_interface{
	private static final String GET_ALL_STMT = "from STVO order by setid";

	@Override
	public void insert(STVO stvo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void update(STVO stVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(stVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
	}

	@Override
	public void delete(String setid) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public STVO findByPrimaryKey(String setid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<STVO> getAll() {
		List<STVO> list = null;
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
	

	/*讀取mail內文*/
	public void querymail(STVO stVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();

			Query query = session.createQuery("from STVO where emailcontent=:emailcontent");
			String emailcontent=stVO.getEmailcontent();
			query.setParameter("emailcontent",emailcontent);
			query.executeUpdate();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		
	}
	
	/*mail主旨更新寫入*/
	public void updatemailsubject(STVO stVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery("update STVO set emailsubject = :emailsubject");
			String emailsubject=stVO.getEmailsubject();
//			Integer setid=stVO.getSetid();
			query.setParameter("emailsubject",emailsubject);
//			query.setParameter("setid",setid);
			query.executeUpdate();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		
	}
	
    /*mail內文更新寫入*/
	public void updatemailcontent(STVO stVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery("update STVO set emailcontent = :emailcontent");
			String emailcontent=stVO.getEmailcontent();
//			Integer setid=stVO.getSetid();
			query.setParameter("emailcontent",emailcontent);

//			query.setParameter("setid",setid);
			query.executeUpdate();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		
	}
}
