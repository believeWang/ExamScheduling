package iii.team05.jober.model;

import iii.team05.Employee.model.EmployeeVO;
/*
drop table Job;

create table Job (
	jobid             int IDENTITY (1,1) not null,
 	jobname            varchar(20) not null,
 
 	constraint Job_jobid_pk primary key (jobid));
*/
import iii.team05.job.model.JobVO;

public class JobErVO  implements java.io.Serializable{
	private Integer joberid;
	private Integer jobid;
	private Integer empno;
	
//	private JobVO job;
//	private EmployeeVO employee;
//	
//	public JobVO getJob() {
//		return job;
//	}
//	public void setJob(JobVO job) {
//		this.job = job;
//	}
//	public EmployeeVO getEmployee() {
//		return employee;
//	}
//	public void setEmployee(EmployeeVO employee) {
//		this.employee = employee;
//	}
	
	public Integer getJoberid() {
		return joberid;
	}
	public void setJoberid(Integer joberid) {
		this.joberid = joberid;
	}
	public Integer getJobid() {
		return jobid;
	}
	public void setJobid(Integer jobid) {
		this.jobid = jobid;
	}
	public Integer getEmpno() {
		return empno;
	}
	public void setEmpno(Integer empno) {
		this.empno = empno;
	}
	
	
}
