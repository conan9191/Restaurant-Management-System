package com.bishe.service.impl;



import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bishe.mapper.SeatMapper;
import com.bishe.mapper.SeatScheduleMapper;
import com.bishe.mapper.SeatTypeMapper;
import com.bishe.pojo.Seat;
import com.bishe.pojo.SeatExample;
import com.bishe.pojo.SeatSchedule;
import com.bishe.pojo.SeatScheduleExample;
import com.bishe.pojo.SeatType;
import com.bishe.pojo.SeatTypeExample;
import com.bishe.service.SeatService;

@Service
public class SeatServiceImpl implements SeatService {
	
	@Autowired
	private SeatMapper seatMapper;
	@Autowired
	private SeatTypeMapper seatTypeMapper;
	@Autowired
	private SeatScheduleMapper seatScheduleMapper;
	
	@Override
	/*管理员查看当前所有座位信息*/
	public List<Seat> getSeatsList() {
		
		SeatExample example = new SeatExample();
		
		//同步当前正在被占用的座子状态
		this.SynchronizeCurrentOccupiedSeat();
		
		return seatMapper.selectByExample(example);
	}
	
	@Override
	/*用户或管理员查询某一时刻所有可预定座位列表*/
	public List<Seat> getAvailableSeatsList(Date getByTime) {
		//获取所有座位
				SeatExample seatexample = new SeatExample();
				List<Seat> seatList = seatMapper.selectByExample(seatexample);
					
				//筛选不能预定的座位
				//获取就餐时间点
				Iterator<Seat> it = seatList.iterator();
				Date startTime = getByTime;
				while(it.hasNext()) {
					//获取座位预定时间表列表
					SeatScheduleExample scheduleexample = new SeatScheduleExample();
					Seat seat = seatMapper.selectByPrimaryKey(it.next().getId());
					//最大允许就餐时间，由座位类型属性决定
					int duration = this.getTypeDuration(seat);
					//预计就餐结束时间
					Date endTime = new Date(startTime.getTime() + 60000*duration);
			
					//空闲条件一
					SeatScheduleExample.Criteria criteria =  scheduleexample.createCriteria();
					criteria.andSidEqualTo(seat.getId());
					criteria.andEndtimeLessThan(startTime);
					//空闲条件二
					SeatScheduleExample.Criteria criteria2 =  scheduleexample.or();
			     	criteria2.andIdEqualTo(seat.getId());
			     	criteria2.andStarttimeGreaterThan(endTime);
					int num = seatScheduleMapper.countByExample( scheduleexample);

					if(num==0){
						//查看是否有该座位有关的时间表
						SeatScheduleExample scheduleexample2 = new SeatScheduleExample();
						List<SeatSchedule> seatScheduleList =  seatScheduleMapper.selectByExample(scheduleexample2);
						Iterator<SeatSchedule> it2 = seatScheduleList.iterator();
						int exist = 0;
						while(it2.hasNext()) {
							if(it2.next().getSid() ==seat.getId())
								exist++;
						}
						//时间表中没有该座位，将该作为状态置为可用
						if(exist==0) {
							seat.setState(true);
							seatMapper.updateByPrimaryKey(seat);
						}else if(exist>0) {
						//时间表冲突，将该作为状态置为不可用
						seat.setState(false);
						seatMapper.updateByPrimaryKey(seat);
						}
					}
					//时间表未冲突，将该作为状态置为可用
					else if(num!=0) {
						seat.setState(true);
						seatMapper.updateByPrimaryKey(seat);
					}
				}
					
				//筛选不可用座位列表
				SeatExample.Criteria seatcriteria = seatexample.createCriteria();
				seatcriteria.andStateEqualTo(true);
				
				return seatMapper.selectByExample(seatexample);

	}
	
	@Override
	/*用户或管理员查询某一时刻所有已被预定座位列表*/
	public List<Seat> getOccupiedSeatsList(Date getByTime){
		//获取所有座位
		SeatExample seatexample = new SeatExample();
		List<Seat> seatList = seatMapper.selectByExample(seatexample);
			
		//筛选不能预定的座位
		//获取就餐时间点
		Iterator<Seat> it = seatList.iterator();
		Date startTime = getByTime;
		while(it.hasNext()) {
			//获取座位预定时间表列表
			SeatScheduleExample scheduleexample = new SeatScheduleExample();
			Seat seat = seatMapper.selectByPrimaryKey(it.next().getId());
			//最大允许就餐时间，由座位类型属性决定
			int duration = this.getTypeDuration(seat);
			//预计就餐结束时间
			Date endTime = new Date(startTime.getTime() + 60000*duration);
	
			//空闲条件一
			SeatScheduleExample.Criteria criteria =  scheduleexample.createCriteria();
			criteria.andSidEqualTo(seat.getId());
			criteria.andEndtimeLessThan(startTime);
			//空闲条件二
			SeatScheduleExample.Criteria criteria2 =  scheduleexample.or();
	     	criteria2.andIdEqualTo(seat.getId());
	     	criteria2.andStarttimeGreaterThan(endTime);
			int num = seatScheduleMapper.countByExample( scheduleexample);

			if(num==0){
				//查看是否有该座位有关的时间表
				SeatScheduleExample scheduleexample2 = new SeatScheduleExample();
				List<SeatSchedule> seatScheduleList =  seatScheduleMapper.selectByExample(scheduleexample2);
				Iterator<SeatSchedule> it2 = seatScheduleList.iterator();
				int exist = 0;
				while(it2.hasNext()) {
					if(it2.next().getSid() ==seat.getId())
						exist++;
				}
				//时间表中没有该座位，将该作为状态置为可用
				if(exist==0) {
					seat.setState(true);
					seatMapper.updateByPrimaryKey(seat);
				}else if(exist>0) {
				//时间表冲突，将该作为状态置为不可用
				seat.setState(false);
				seatMapper.updateByPrimaryKey(seat);
				}
			}
			//时间表未冲突，将该作为状态置为可用
			else if(num!=0) {
				seat.setState(true);
				seatMapper.updateByPrimaryKey(seat);
			}
		}
	
		//筛选不可用座位列表
		SeatExample.Criteria seatcriteria = seatexample.createCriteria();
		seatcriteria.andStateEqualTo(false);
		
		return seatMapper.selectByExample(seatexample);

	}
	
	@Override
	/*根据id获取某一座位当前信息*/
	public Seat getById(Integer id) {
		
		//同步当前正在被占用的座子状态
		SynchronizeCurrentOccupiedSeat();
		return seatMapper.selectByPrimaryKey(id);
	}
	
	@Override
	public Seat getByPlace(String place) {
		SeatExample example = new SeatExample();
		SeatExample.Criteria criteria = example.createCriteria();
		criteria.andPlaceEqualTo(place);
		SynchronizeCurrentOccupiedSeat();
		return seatMapper.selectByExample(example).get(0);
	}
	
	@Override
	/*增加新座位*/
	public void addSeat(Seat seat) {
		seatMapper.insert(seat);
	}

	@Override
	/*按主键删除某一座位*/
	public void deleteSeat(Integer id) {
		seatMapper.deleteByPrimaryKey(id);
	}

	@Override
	/*按主键更新某一座位*/
	public void updateSeat(Seat seat) {
		seatMapper.updateByPrimaryKey(seat);
	}

	
	@Override
	/*查询所有作为类型列表*/
	public List<SeatType> getSeatTypesList() {
		SeatTypeExample example = new SeatTypeExample();
		return seatTypeMapper.selectByExample(example);
	}

	@Override
	/*按主键查找某一座位类型*/
	public SeatType getSeatType(Integer id) {
		return seatTypeMapper.selectByPrimaryKey(id);
	}

	@Override
	/*增加新的作为类型*/
	public void addSeatType(SeatType seatType) {
		seatTypeMapper.insert(seatType);
	}

	@Override
	/*按主键删除某一座位类型*/
	public void deleteSeatType(Integer id) {
		// 删除以该类型为座位类型的所有座位
		SeatExample example = new SeatExample();
		SeatExample.Criteria criteria = example.createCriteria();
		criteria.andSeatTypeIdEqualTo(id);
		seatMapper.deleteByExample(example);
		// 删除该座位类型
		seatTypeMapper.deleteByPrimaryKey(id);
	}

	@Override
	/*更新座位类型*/
	public void updateSeatType(SeatType seatType) {
		seatTypeMapper.updateByPrimaryKey(seatType);
	}

	@Override
	/*获取所有座位时间表记录*/
	public List<SeatSchedule> getSeatScheduleList() {
		SeatScheduleExample example = new SeatScheduleExample();
		return seatScheduleMapper.selectByExample(example);
	}

	@Override
	/*按座位id获取所有座位时间表记录*/
	public List<SeatSchedule> getSeatScheduleListBySeatId(Integer sid) {
		SeatScheduleExample example = new SeatScheduleExample();
		SeatScheduleExample.Criteria criteria = example.createCriteria();
		criteria.andSidEqualTo(sid);
		return seatScheduleMapper.selectByExample(example);
	}

	@Override
	/*按座位订单id获取所有座位时间表记录*/
	public List<SeatSchedule> getSeatScheduleListByUserId(Integer soid) {
		SeatScheduleExample example = new SeatScheduleExample();
		SeatScheduleExample.Criteria criteria = example.createCriteria();
		criteria.andSoidEqualTo(soid);
		return seatScheduleMapper.selectByExample(example);
	}

	@Override
	/*按给定时间段获取所有座位时间表记录*/
	public List<SeatSchedule> getSeatScheduleListByTime(Date startTime, Date endTime) {
		SeatScheduleExample example = new SeatScheduleExample();
		SeatScheduleExample.Criteria criteria = example.createCriteria();
		criteria.andEndtimeLessThanOrEqualTo(endTime);
		criteria.andStarttimeGreaterThanOrEqualTo(startTime);
		return seatScheduleMapper.selectByExample(example);
	}

	@Override
	/*增加新的时间表记录*/
	public void addSeatSchedule(SeatSchedule seatSchedule) {
		seatScheduleMapper.insert(seatSchedule);
	}

	@Override
	/*删除新的时间表记录*/
	public void deleteSeatSchedule(Integer id) {
		seatScheduleMapper.deleteByPrimaryKey(id);
	}

	@Override
	/*更新新的时间表记录*/
	public void updateSeatSchedule(SeatSchedule seatSchedule) {
		seatScheduleMapper.updateByPrimaryKey(seatSchedule);
	}
	
	/*	同步当前正在被占用的座子状态*/
	private void SynchronizeCurrentOccupiedSeat(){
			
			SeatScheduleExample example = new SeatScheduleExample();
			//获取当前时间
			Date nowTime = new Date();
			//获取所有座位时间表中的记录
			List<SeatSchedule> list = seatScheduleMapper.selectByExample(example);
			//若当前时间有某一座位的相关记录，就修改这个座位的状态属性
			Iterator<SeatSchedule> occupiedList = list.iterator();
			while(occupiedList.hasNext()) {
				SeatSchedule ss = occupiedList.next();
				if(nowTime.getTime()>=ss.getStarttime().getTime()&&nowTime.getTime()<=ss.getEndtime().getTime()){
					int sid = ss.getSid();
					Seat s =seatMapper.selectByPrimaryKey(sid);
					s.setState(false);
					seatMapper.updateByPrimaryKey(s);
				}
				else{
					int sid = ss.getSid();
					Seat s =seatMapper.selectByPrimaryKey(sid);
					s.setState(true);
					seatMapper.updateByPrimaryKey(s);
				}
			}
	}
	
	
	 /*获取某一类型座位允许的最大就餐时间*/
	private int getTypeDuration(Seat seat){
			SeatType st = seatTypeMapper.selectByPrimaryKey(seat.getSeatTypeId());
			return st.getDuration();
	}


		  
	/*更新座位状态
	private void updateSeatState(Seat seat){
			if(seat.getState()==true)
				seat.setState(false);
			else if(seat.getState()==false)
				seat.setState(true);
			seatMapper.updateByPrimaryKey(seat);
	}*/
}
