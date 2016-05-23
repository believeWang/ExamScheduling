package iii.team05.section.model;
/*
drop table Section;

create table Section (

sectiontime            time not null,  --改用這個來當PK 不需要流水號ID
sectionStatus       float not null,
 
constraint Section_sectionid_pk primary key (sectiontime));


*/
public class SectionVO  implements java.io.Serializable{
	private java.sql.Time sectiontime;
	private Double sectionStatus;
	
	public java.sql.Time getSectiontime() {
		return sectiontime;
	}
	public void setSectiontime(java.sql.Time sectiontime) {
		this.sectiontime = sectiontime;
	}
	public Double getSectionStatus() {
		return sectionStatus;
	}
	public void setSectionStatus(Double sectionStatus) {
		this.sectionStatus = sectionStatus;
	}
	
	
}
