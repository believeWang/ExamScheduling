package iii.team05.setting.model;

import iii.team05.examinee.ecmodel.ECVO;

import java.util.List;



public class STService {
	STHibernateDAO stDAO;

	public STService() {
		stDAO = new STHibernateDAO();
	}

	public boolean hasAccount(String setid, String psd) {

		STVO stVO = stDAO.findByPrimaryKey(setid);
		if (stVO != null && stVO.getSetid().equals(setid))
			return true;
		else
			return false;

	}

	public List<STVO> query() {

		return stDAO.getAll();

	}



	public STVO updateMailsubject(String emailsubject) {
			
				STVO stVO = new STVO();
				stVO.setEmailsubject(emailsubject);
				stDAO.updatemailsubject(stVO);
				return stVO;
			}
	
	public STVO updateMailcontent(String emailcontent) {
		
				STVO stVO = new STVO();
				stVO.setEmailcontent(emailcontent);
				stDAO.updatemailcontent(stVO);
				return stVO;
	        }

	
}
	
		
	

