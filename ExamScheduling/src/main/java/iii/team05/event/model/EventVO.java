package iii.team05.event.model;
/*
 drop table Event_Exist;

 create table Event_Exist (
	 eventid             int IDENTITY (1,1) not null,
	 empno               int not null,
	 starttime           datetime not null,
	 endtime             datetime not null,
	 bgcolor             varchar(20) null,
	 title               varchar(20) not null,
	 ecno                varchar(30) not null,
	 eventremark         text null,
 
	 --constraint Event_erid_fk foreign key (erid) references Examiner (erid),  --
	 --constraint Event_ecno_fk foreign key (ecno) references Examinee_Cat (ecno),  --
	 constraint Event_eventid_pk primary key (eventid)
 );
*/
public class EventVO  implements java.io.Serializable{
	private Integer eventid;
	private Integer empno;
	private java.sql.Timestamp starttime;
	private java.sql.Timestamp endtime;
	private String bgcolor;
	private String title;
	private String ecno;
	private String eventremark;
	
	public Integer getEventid() {
		return eventid;
	}
	public void setEventid(Integer eventid) {
		this.eventid = eventid;
	}
	public Integer getEmpno() {
		return empno;
	}
	public void setEmpno(Integer empno) {
		this.empno = empno;
	}
	public java.sql.Timestamp getStarttime() {
		return starttime;
	}
	public void setStarttime(java.sql.Timestamp starttime) {
		this.starttime = starttime;
	}
	public java.sql.Timestamp getEndtime() {
		return endtime;
	}
	public void setEndtime(java.sql.Timestamp endtime) {
		this.endtime = endtime;
	}
	public String getBgcolor() {
		return bgcolor;
	}
	public void setBgcolor(String bgcolor) {
		this.bgcolor = bgcolor;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getEcno() {
		return ecno;
	}
	public void setEcno(String ecno) {
		this.ecno = ecno;
	}
	public String getEventremark() {
		return eventremark;
	}
	public void setEventremark(String eventremark) {
		this.eventremark = eventremark;
	}

}
