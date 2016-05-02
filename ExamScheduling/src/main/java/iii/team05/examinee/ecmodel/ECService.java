package iii.team05.examinee.ecmodel;

public class ECService {
	ECHibernateDAO ecDAO;

	public ECService() {
		ecDAO = new ECHibernateDAO();
	}

	public boolean hasAccount(String ecno, String psd) {

		ECVO ecVO = ecDAO.findByPrimaryKey(ecno);
		if (ecVO != null && ecVO.getEcpsd().equals(psd))
			return true;
		else
			return false;

	}

	public ECVO getECVO(String ecno) {

		return ecDAO.findByPrimaryKey(ecno);

	}

}
