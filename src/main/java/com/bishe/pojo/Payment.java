package com.bishe.pojo;

import java.util.Date;

public class Payment {
	private Integer soid;
	private Integer uid;
	private Integer ioid;
	private Cart cart;
	private Integer[] seatId;
	private Date endTime;
	
	
	public Payment(Integer soid, Integer uid, Integer[] seatId,Date endTime) {
		super();
		this.soid = soid;
		this.uid = uid;
		this.seatId = seatId;
	}

	
	public Payment(Integer ioid, Integer uid, Cart cart,Date endTime) {
		super();
		this.ioid = ioid;
		this.cart = cart;
		this.uid = uid;
		
	}
	
	public Integer getSoid() {
		return soid;
	}


	public void setSoid(Integer soid) {
		this.soid = soid;
	}


	public Integer getUid() {
		return uid;
	}


	public void setUid(Integer uid) {
		this.uid = uid;
	}


	public Integer[] getSeatId() {
		return seatId;
	}


	public void setSeatId(Integer[] seatId) {
		this.seatId = seatId;
	}


	public Date getEndTime() {
		return endTime;
	}


	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}


	public Integer getIoid() {
		return ioid;
	}


	public void setIoid(Integer ioid) {
		this.ioid = ioid;
	}


	public Cart getCart() {
		return cart;
	}


	public void setCart(Cart cart) {
		this.cart = cart;
	}

	

	
	
	
}
