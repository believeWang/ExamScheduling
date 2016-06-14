package iii.team05.abouteditor;

public class AbouteditorVO implements java.io.Serializable{
	private Integer aboutid;
	private String aboutname;
	private String aboutcontent;
	
	public Integer getAboutid() {
		return aboutid;
	}
	public void setAboutid(Integer aboutid) {
		this.aboutid = aboutid;
	}
	
	public String getAboutname() {
		return aboutname;
	}
	public void setAboutname(String aboutname) {
		this.aboutname = aboutname;
	}
	
	public String getAboutcontent() {
		return aboutcontent;
	}
	public void setAboutcontent(String aboutcontent) {
		this.aboutcontent = aboutcontent;
	}
}

