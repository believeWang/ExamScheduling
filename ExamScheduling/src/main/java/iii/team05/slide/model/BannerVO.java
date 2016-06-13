package iii.team05.slide.model;

public class BannerVO {
	private Integer slideid;
	private byte[] slidephoto;
	private String slideurl;
	
	public Integer getSlideid() {
		return slideid;
	}
	public void setSlideid(Integer slideid) {
		this.slideid = slideid;
	}
	public byte[] getSlidephoto() {
		return slidephoto;
	}
	public void setSlidephoto(byte[] slidephoto) {
		this.slidephoto = slidephoto;
	}
	public String getSlideurl() {
		return slideurl;
	}
	public void setSlideurl(String slideurl) {
		this.slideurl = slideurl;
	}

	
}