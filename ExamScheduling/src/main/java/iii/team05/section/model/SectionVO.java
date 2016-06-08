package iii.team05.section.model;
/*
drop table Section;

create table Section (

sectiontime            time not null,  --改用這個來當PK 不需要流水號ID
sectionStatus       bit not null,
 
constraint Section_sectionid_pk primary key (sectiontime));


*/
public class SectionVO  implements java.io.Serializable{
	private Integer sectionid;
	private java.sql.Time sectiontime;
	private Boolean sectionStatus;
	
	public Integer getSectionid() {
		return sectionid;
	}
	public void setSectionid(Integer sectionid) {
		this.sectionid = sectionid;
	}
	public java.sql.Time getSectiontime() {
		return sectiontime;
	}
	public void setSectiontime(java.sql.Time sectiontime) {
		this.sectiontime = sectiontime;
	}
	public Boolean getSectionStatus() {
		return sectionStatus;
	}
	public void setSectionStatus(Boolean sectionStatus) {
		this.sectionStatus = sectionStatus;
	}
	
	
}
