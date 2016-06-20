package iii.team05.examinee.ecmodel;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class ScoreVO implements java.io.Serializable{

	private static final long serialVersionUID = 1L;
	private String ecno;

	private ECVO eCVO;
	private Integer lab;//上機考分數
	private Integer interview; //面試分數
	private Integer labtime; //上機考時間(分鐘)
	private Integer onlineex;  //線上測驗分數
	
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
	public Integer getLab() {
		return lab;
	}
	public void setLab(Integer lab) {
		this.lab = lab;
	}
	public Integer getInterview() {
		return interview;
	}
	public void setInterview(Integer interview) {
		this.interview = interview;
	}
	public Integer getLabtime() {
		return labtime;
	}
	public void setLabtime(Integer labtime) {
		this.labtime = labtime;
	}
	public Integer getOnlineex() {
		return onlineex;
	}
	public void setOnlineex(Integer onlineex) {
		this.onlineex = onlineex;
	}


	public void notNullVO(){
		if(this.lab==null)this.lab=0;
		if(this.interview==null)this.interview=0;
		if(this.labtime==null)this.labtime=0;
		if(this.onlineex==null)this.onlineex=0;
	
		
	
		
	}
	
		
	
	
	
}
