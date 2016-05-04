package iii.team05.Job.model;
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
	
	public Integer getJobid() {
		return jobid;
	}
	public void setJobid(Integer jobid) {
		this.jobid = jobid;
	}
	public String getJobname() {
		return jobname;
	}
	public void setJobname(String jobname) {
		this.jobname = jobname;
	}
	
	
}
