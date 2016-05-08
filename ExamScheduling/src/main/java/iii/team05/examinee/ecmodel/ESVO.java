package iii.team05.examinee.ecmodel;

import java.sql.Date;

public class ESVO implements java.io.Serializable{

	private static final long serialVersionUID = 1L;
	private String ecno;
	private ECVO eCVO;
	private Integer esteam;
	private Integer esbirth;
	
	private String esschool;
	private Boolean essex;
	private Date eshiredate;
	private Integer essalary;
	private Integer esranking;
	private String esremark2;
	public ECVO geteCVO() {
		return eCVO;
	}

	public void seteCVO(ECVO eCVO) {
		this.eCVO = eCVO;
	}
	public String getEcno() {
		return ecno;
	}
	
	public void setEcno(String ecno) {
		this.ecno = ecno;
	}
	public Integer getEsteam() {
		return esteam;
	}
	public void setEsteam(Integer esteam) {
		this.esteam = esteam;
	}
	public Integer getEsbirth() {
		return esbirth;
	}
	public void setEsbirth(Integer esbirth) {
		this.esbirth = esbirth;
	}
	public String getEsschool() {
		return esschool;
	}
	public void setEsschool(String esschool) {
		this.esschool = esschool;
	}
	public Boolean getEssex() {
		return essex;
	}
	public void setEssex(Boolean essex) {
		this.essex = essex;
	}
	public Date getEshiredate() {
		return eshiredate;
	}
	public void setEshiredate(Date eshiredate) {
		this.eshiredate = eshiredate;
	}
	public Integer getEssalary() {
		return essalary;
	}
	public void setEssalary(Integer essalary) {
		this.essalary = essalary;
	}
	public Integer getEsranking() {
		return esranking;
	}
	public void setEsranking(Integer esranking) {
		this.esranking = esranking;
	}
	public String getEsremark2() {
		return esremark2;
	}
	public void setEsremark2(String esremark2) {
		this.esremark2 = esremark2;
	}
	
		
	
	
	
}
