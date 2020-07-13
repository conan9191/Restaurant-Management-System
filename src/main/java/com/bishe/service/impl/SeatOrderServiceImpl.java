package com.bishe.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;
import java.util.logging.Logger;

import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

import com.bishe.mapper.SeatMapper;
import com.bishe.mapper.SeatOrderMapper;
import com.bishe.mapper.SeatScheduleMapper;
import com.bishe.mapper.SeatSeatOrderMapper;
import com.bishe.mapper.SeatTypeMapper;
import com.bishe.pojo.ItemItemMaterial;
import com.bishe.pojo.Seat;
import com.bishe.pojo.SeatOrder;
import com.bishe.pojo.SeatOrderExample;
import com.bishe.pojo.SeatSchedule;
import com.bishe.pojo.SeatSeatOrder;
import com.bishe.pojo.SeatType;
import com.bishe.service.SeatOrderService;

@Service
public class SeatOrderServiceImpl implements SeatOrderService {
	
	@Autowired
	private SeatTypeMapper seatTypeMapper;
	@Autowired
	private SeatMapper seatMapper;
	@Autowired
	private SeatOrderMapper seatOrderMapper;
	@Autowired
	private SeatScheduleMapper seatScheduleMapper;
	@Autowired
	private SeatSeatOrderMapper seatSeatOrderMapper;
	
	@Override
	//提交未付款订单
	 public Integer  submitSeatOrder(SeatOrder seatOrder) {
				/*新增订单,返回订单id*/
				seatOrderMapper.insert(seatOrder);
				return seatOrder.getId();
	}
	
	public void generateSeatOrder(SeatOrder seatOrder,Integer[] seatId) {
		
		/*新增订单,返回订单id*/
		/* 将数据存放座位、座位订单关联表当中*/
		
		Integer[] sid = seatId;
		for (int i = 0; i < sid.length; i++) {
		SeatSeatOrder seatSeatOrder = new SeatSeatOrder();
		seatSeatOrder.setSid(sid[i]);
		seatSeatOrder.setSoid(seatOrder.getId());
		seatSeatOrderMapper.insert(seatSeatOrder);
		
		/* 将数据存放座位、座位订单关联表当中*/
		/*添加时间表*/
		SeatSchedule seatSchedule = new SeatSchedule();
		seatSchedule.setSoid(seatOrder.getId());
		seatSchedule.setStarttime(seatOrder.getArrivetime());
		Seat seat =seatMapper.selectByPrimaryKey(sid[i]);
		SeatType st = seatTypeMapper.selectByPrimaryKey(seat.getSeatTypeId());
		seatSchedule.setEndtime(new Date(seatOrder.getArrivetime().getTime()+ 60*1000*st.getDuration()));
		seatSchedule.setSid(sid[i]);
		seatScheduleMapper.insert(seatSchedule);
		}
		
	
	
}
	
	
	
    //按ID查找订单
	@Override
	public SeatOrder getSeatOrderById(Integer id) {
		return seatOrderMapper.selectByPrimaryKey(id);
	}

	@Override
	public void updateSeatOrder(SeatOrder seatOrder) {
		seatOrderMapper.updateByPrimaryKey(seatOrder);
	}

	@Override
	public void deleteSeatOrder(SeatOrder seatOrder) {
		if(seatOrder.getState()==false)
		seatOrderMapper.deleteByPrimaryKey(seatOrder.getId());
	}
	


}
