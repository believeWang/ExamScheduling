package iii.team05.examinee.ecmodel;

public class ECVO implements java.io.Serializable{
	private String ecno;
	private String ecname;
	private String ecemail;
	private byte[] ecpsd;
	private Boolean ecstatus;
	private String ecremark1;

	private String ecclass;
	public String getEcclass() {
		return ecclass;
	}
	public void setEcclass(String ecclass) {
		this.ecclass = ecclass;
	}

	private ESVO eSVO;
	private ScoreVO scoreVO;
	
	public String getEcno() {
		return ecno;
	}
	public void setEcno(String ecno2) {
		this.ecno = ecno2;
	}
	public ESVO geteSVO() {
		return eSVO;
	}
	public void seteSVO(ESVO eSVO) {
		this.eSVO = eSVO;
	}
	public ScoreVO getScoreVO() {
		return scoreVO;
	}
	public void setScoreVO(ScoreVO scoreVO) {
		this.scoreVO = scoreVO;
	}
	public String getEcname() {
		return ecname;
	}
	public void setEcname(String ecname) {
		this.ecname = ecname;
	}
	public String getEcemail() {
		return ecemail;
	}
	public void setEcemail(String ecmail) {
		this.ecemail = ecmail;
	}
	public byte[] getEcpsd() {
		return ecpsd;
	}
	public void setEcpsd(byte[] ecpsd) {
		this.ecpsd = ecpsd;
	}
	public Boolean getEcstatus() {
		return ecstatus;
	}
	public void setEcstatus(Boolean ecstatus) {
		this.ecstatus = ecstatus;
	}
	public String getEcremark1() {
		return ecremark1;
	}
	public void setEcremark1(String ecremark1) {
		this.ecremark1 = ecremark1;
	}
	@Override
	public String toString(){
		String str="{"+"\"esteam\":\""+eSVO.getEsteam()+
				"\",ecremark1:\""+ecremark1+
				"\",ecno:\""+ecno+
				"\",ecname:"+ecname+
				",esbirth:"+eSVO.getEsbirth()+				
				",esschool:"+eSVO.getEsschool()+
				",essex:"+eSVO.getEssex()+
				",ecemail:"+ecemail+
				",ecstatus:"+ecstatus+
				",lab:"+scoreVO.getLab()+
				",labtime:"+scoreVO.getLabtime()+
				",interview:"+scoreVO.getInterview()+
				",onlineex:"+scoreVO.getOnlineex()+
				//"total"+
				",eshiredat:"+eSVO.getEshiredate()+
				",essalary:"+eSVO.getEssalary()+
				",esranking:"+eSVO.getEsranking()+
				",esremark2:"+eSVO.getEsremark2()+
				"}";
		
				
		return str;
	}
}
