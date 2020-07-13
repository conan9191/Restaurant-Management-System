package com.bishe.service;


import java.util.Date;
import java.util.List;

import com.bishe.pojo.Seat;
import com.bishe.pojo.SeatSchedule;
import com.bishe.pojo.SeatType;

//座位管理服务接口
public interface SeatService {
		
	//查询所有座位记录
	public List<Seat> getSeatsList();
		
	//按指定时间查询可用座位
	public List<Seat> getAvailableSeatsList(Date getByTime);
		
	//按指定时间查询不可用座位
	public List<Seat> getOccupiedSeatsList(Date getByTime);
		
		//按主键查询单个座位记录
		public Seat getById(Integer id);
		
		//按位置号查询单个座位记录
		public Seat getByPlace(String place);
		
		//添加一个新座位
		public void addSeat(Seat seat);
		
		//按主键删除座位
		public void deleteSeat(Integer id);
		
		//更改座位
		public void updateSeat(Seat seat);
		
		
		//查询所有座位种类
		public List<SeatType> getSeatTypesList();
		
		//按主键查找座位种类
		public SeatType getSeatType(Integer id);
		
		//添加一个新座位种类
		public void addSeatType(SeatType seatType);
		
		//按主键删除座位种类
		public void deleteSeatType(Integer id);
		
		//更改座位
		public void updateSeatType(SeatType seatType);
				
		//查看所有座位时间表
		public List<SeatSchedule> getSeatScheduleList();
		
		//按座位id查找座位时间表
		public List<SeatSchedule> getSeatScheduleListBySeatId(Integer sid);
		
		//按订单id查找座位时间表
		public List<SeatSchedule> getSeatScheduleListByUserId(Integer soid);
		
		//按时间段查找座位时间表
		public List<SeatSchedule> getSeatScheduleListByTime(Date startTime, Date endTime);
		
		//添加加新的时间表记录
		public void addSeatSchedule(SeatSchedule seatSchedule);
		
		//按主键删除时间表记录
		public void deleteSeatSchedule(Integer id);
		
		//更改时间表记录
		public void updateSeatSchedule(SeatSchedule seatSchedule);
		
}
