package iii.team05.Season.model;


import iii.team05.hibernate.util.HibernateUtil;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;



public class SeasonDAO implements SeasonDAO_interface {
	
	private static final String GET_ALL_SEA = "from SeasonVO order by seasonId";

	@Override
	public void insert(SeasonVO seasonVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(seasonVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		
	}

	@Override
	public void update(SeasonVO seasonVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(seasonVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
	}

	@Override
	public void delete(String seasonId) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			SeasonVO seasonVO = (SeasonVO) session.get(SeasonVO.class, seasonId);
			session.delete(seasonVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		
	}

	@Override
	public SeasonVO findByPrimaryKey(String seasonId) {
		SeasonVO deptVO = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			deptVO = (SeasonVO) session.get(SeasonVO.class, seasonId);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return deptVO;
	}

	@Override
	public List<SeasonVO> getAll() {
		List<SeasonVO> list = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery(GET_ALL_SEA);
			list = query.list();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return list;
	}
	
	public static void main(String[] args) {
		SeasonDAO dao = new SeasonDAO();
		
		iii.team05.Season.model.SeasonVO seaVO = new iii.team05.Season.model.SeasonVO(); // 部門POJO
	
		
		
		List<SeasonVO> list = dao.getAll();//查詢測試
		for (SeasonVO aSea : list) {
			System.out.print(aSea.getSeasonId());
			System.out.print(aSea.getSum() + ",");
			System.out.print(aSea.getAverage());
			
			System.out.println();
		}
		//dao.delete(6);//刪除測試
				
	}
	
}