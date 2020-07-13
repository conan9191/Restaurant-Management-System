package com.bishe.pojo;

public class Customer extends User{
	
	

	private String rankURL;
	private Integer point;
	private String createdDate;
	private final String RANK0 = "/pic/vip0.png";
	private final String RANK1 = "/pic/vip1.png";
	private final String RANk2 = "/pic/vip2.png";
	private final String RANk3 = "/pic/vip3.png";
	
	public Customer() {
		super();
		
	}
	
	
	
	
	public String getRankURL() {
		return rankURL;
	}
	public void setRankURL(String rankURL) {
		this.rankURL = rankURL;
	}
	public Integer getPoint() {
		return point;
	}
	public void setPoint(Integer point) {
		this.point = point;
	}



	public String getCreatedDate() {
		return createdDate;
	}



	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}
	
	
	public String getURL(Integer rank) {
		if(rank==1) {
			return this.RANK1;
		}else if(rank==2) {
			return this.RANk2;
		}else if(rank==3) {
			return this.RANk3;
		}else 
			return this.RANK0;
	}
	public String getNullURL() {
		return this.RANK0;
	}
	
}

