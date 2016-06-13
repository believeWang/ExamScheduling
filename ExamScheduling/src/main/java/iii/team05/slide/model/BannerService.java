package iii.team05.slide.model;




public class BannerService {
	BannerHibernateDAO bannerDAO;
	public BannerService() {
		bannerDAO = new BannerHibernateDAO();
	}
	public void insertBanner(BannerVO bannerVO) {
		bannerDAO.insert(bannerVO);
	}
	
	
//	public BannerVO insertBanner(byte[] slidephoto) 
//	   {
//		BannerVO baVO = new BannerVO();
//		baVO.setSlidephoto(slidephoto);
//		bannerDAO.insert(baVO);
//		return baVO;
//	   }
	
	
}