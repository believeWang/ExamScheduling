package iii.team05.examinee.ecmodel;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

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
	public void notNullVO(){
		if(this.esteam==null)this.esteam=1;
		if(this.esbirth==null)this.esbirth=80;
		//欲轉換的日期字串
		String dateString = "2016-07-04";
		//設定日期格式
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		//進行轉換
		java.util.Date date=null;
		try {
			date = sdf.parse(dateString);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		if(this.eshiredate==null)this.eshiredate=new Date(date.getTime());
		if(this.essalary==null)this.essalary=38000;
		if(this.esranking==null)this.esranking=0;
		if(this.esremark2==null)this.esremark2="無";
		
	
		
	}
	
	
	
}
