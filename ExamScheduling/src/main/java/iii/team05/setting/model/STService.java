package iii.team05.setting.model;

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
	
		
	
}
