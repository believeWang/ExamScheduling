package iii.team05.Employee.model;


import iii.team05.job.model.JobVO;

import java.util.HashSet;
import java.util.Set;

public class EmployeeVO  implements java.io.Serializable{
	private Integer empno;
	private String empname;
	private String empemail;
	private Integer position;
	private Set<JobVO> job = new HashSet<JobVO>(0);
	private String token;
	
	public Set<JobVO> getJob() {
		return job;
	}
	public void setJob(Set<JobVO> job) {
		this.job = job;
	}


	public Integer getEmpno() {
		return empno;
	}
	public void setEmpno(Integer empno) {
		this.empno = empno;
	}
	public String getEmpname() {
		return empname;
	}
	public void setEmpname(String empname) {
		this.empname = empname;
	}
	public String getEmpemail() {
		return empemail;
	}
	public void setEmpemail(String empemail) {
		this.empemail = empemail;
	}
	public Integer getPosition() {
		return position;
	}
	public void setPosition(Integer position) {
		this.position = position;
	}
	
	public String getToken() {
		return token;
	}
	public void setToken(String token) {
		this.token = token;
	}
	
}
