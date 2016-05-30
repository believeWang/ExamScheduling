package iii.team05.examinee.ecmodel;

import iii.team05.mes.model.MesVO;

import java.util.List;

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

	/*email驗證*/
	public List<ECVO> check(String ecemail) {

		return ecDAO.mailcheck(ecemail);

	}
	/*寫入密碼*/
	public ECVO updatePsd(String ecno,String ecpsd
			) {
			
				ECVO ecVO = new ECVO();
				ecVO.setEcno(ecno);
//				ecVO.setEcname(ecname);
//				ecVO.setEcemail(ecemail);
				ecVO.setEcpsd(ecpsd);
//				ecVO.setEcstatus(ecstatus);
//				ecVO.setEcremark1(ecremark1);
				ecDAO.updatepsd(ecVO);
				return ecVO;
			}
		
}
