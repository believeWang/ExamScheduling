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


	
	public STVO updateMail(String emailtemplate) {
			
				STVO stVO = new STVO();
				stVO.setEmailtemplate(emailtemplate);
				stDAO.updatemail(stVO);
				return stVO;
			}
	
}
	
		
	

