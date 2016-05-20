package iii.team05.Season.model;

public class SeasonVO  implements java.io.Serializable{
	private String seasonId;
	private Float sum;
	private Float average;
	
	public String getSeasonId() {
		return seasonId;
	}
	public void setSeasonId(String seasonId) {
		this.seasonId = seasonId;
	}
	public Float getSum() {
		return sum;
	}
	public void setSum(Float sum) {
		this.sum = sum;
	}
	public Float getAverage() {
		return average;
	}
	public void setAverage(Float average) {
		this.average = average;
	}
	
	
}
