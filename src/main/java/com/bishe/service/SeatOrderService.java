package com.bishe.service;


import javax.servlet.http.HttpSession;

import com.bishe.pojo.SeatOrder;

public interface SeatOrderService {
		//提交订座订单
	    public Integer submitSeatOrder(SeatOrder seatOrder);
	
	    
	    //按ID查找订单
	    public SeatOrder getSeatOrderById(Integer id);
	    
	    //按用户id查找订单
	    
	    //更新订单
	   public void updateSeatOrder(SeatOrder seatOrder);
		
	   //更新相关表
	   public void generateSeatOrder(SeatOrder seatOrder,Integer[] seatId );
	   
	   //删除订单
	   public void deleteSeatOrder(SeatOrder seatOrder);
}
