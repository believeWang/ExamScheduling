package iii.team05.exam.model;

import java.util.LinkedHashSet;
import java.util.Set;

public class ExamVO implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	private String examno;
	private String examTitle;
	private Integer quantities;	
	private Integer duration ;
	private byte[] examImg;
	private Set<ExamDetailVO> examDetils = new LinkedHashSet<ExamDetailVO>();
	
	public Set<ExamDetailVO> getExamDetils() {
		return examDetils;
	}
	public void setExamDetils(Set<ExamDetailVO> examDetils) {
		this.examDetils = examDetils;
	}
	public String getExamno() {
		return examno;
	}
	public void setExamno(String examno) {
		this.examno = examno;
	}
	public String getExamTitle() {
		return examTitle;
	}
	public void setExamTitle(String examTitle) {
		this.examTitle = examTitle;
	}
	public Integer getQuantities() {
		return quantities;
	}
	public void setQuantities(Integer quantities) {
		this.quantities = quantities;
	}
	public Integer getDuration() {
		return duration;
	}
	public void setDuration(Integer duration) {
		this.duration = duration;
	}
	public byte[] getExamImg() {
		return examImg;
	}
	public void setExamImg(byte[] examImg) {
		this.examImg = examImg;
	}

}
