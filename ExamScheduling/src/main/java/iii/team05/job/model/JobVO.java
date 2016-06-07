package iii.team05.job.model;


import iii.team05.Employee.model.EmployeeVO;

import java.util.HashSet;
import java.util.Set;

/*
drop table Job;

create table Job (
	jobid             int IDENTITY (1,1) not null,
 	jobname            varchar(20) not null,
 
 	constraint Job_jobid_pk primary key (jobid));
*/
public class JobVO  implements java.io.Serializable{
	private Integer jobid;
	private String jobname;
	private Set<EmployeeVO> employee = new HashSet<EmployeeVO>(0);
	
	public Integer getJobid() {
		return jobid;
	}
	public void setJobid(Integer jobid) {
		this.jobid = jobid;
	}
	public Set<EmployeeVO> getEmployee() {
		return employee;
	}
	public void setEmployee(Set<EmployeeVO> employee) {
		this.employee = employee;

	}
	public String getJobname() {
		return jobname;
	}
	public void setJobname(String jobname) {
		this.jobname = jobname;
	}
	
	
}
