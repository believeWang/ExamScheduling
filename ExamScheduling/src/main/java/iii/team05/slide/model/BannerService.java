package iii.team05.slide.model;

import iii.team05.Employee.model.EmployeeVO;
import iii.team05.setting.model.STVO;

import java.io.UnsupportedEncodingException;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;




public class BannerService {
	BannerHibernateDAO bannerDAO;
	public BannerService() {
		bannerDAO = new BannerHibernateDAO();
	}
	public void insertBanner(BannerVO bannerVO) {
		bannerDAO.insert(bannerVO);
	}
	public List<BannerVO> getAll() {
		return bannerDAO.getAll();
	}
	
	public String byteTobase64(byte[] slidephoto) {
		if (slidephoto == null)
			return null;
		StringBuilder sb = new StringBuilder();
		sb.append("data:image/png;base64,");

		try {
			sb.append(new String(Base64.getEncoder().encode(slidephoto),
					"UTF-8"));
		} catch (UnsupportedEncodingException e) {

			e.printStackTrace();
		}
		return sb.toString();
	}
	public void delete(Integer slideid) {
		bannerDAO.delete(slideid);
	}
	
	public static Map queryImag(){
	//讀取並轉base64檔圖片至JSP
	BannerService baSvc = new BannerService();
	List<BannerVO> banner = baSvc.getAll();
	byte[] slidephoto = null;
	Map list= new HashMap();
	for (BannerVO s : banner) {
		slidephoto =s.getSlidephoto();
		String img= baSvc.byteTobase64(slidephoto);
		int slideid = s.getSlideid();
		
	list.put(slideid,img);
	
	}
	return list;
}
	
	
}