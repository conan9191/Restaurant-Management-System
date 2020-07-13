package com.bishe.timer;

import java.util.Date;
import java.util.Timer;
import java.util.TimerTask;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.bishe.pojo.Payment;
import com.bishe.pojo.SeatOrder;
import com.bishe.service.SeatOrderService;


public class OrderTimer extends TimerTask{

	
	 private Timer timer;
	 private HttpSession session;
	 private String name;
	 private Date endTime;
	 
	public OrderTimer(HttpSession session,String name,Date endTime) {
		this.timer = new Timer();		
		this.session = session;
		this.name=name;
		this.endTime=endTime;
	}
	
	

	public Timer getTimer() {
		return timer;
	}

	

	public Date getEndTime() {
		return endTime;
	}



	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}



	public void setTimer(Timer timer) {
		this.timer = timer;
	}



	@Override
	public void run() {

		  this.session.removeAttribute(name);
		  this.timer.cancel();
	}

}
