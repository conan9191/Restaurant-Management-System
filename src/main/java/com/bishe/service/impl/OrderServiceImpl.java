package com.bishe.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bishe.mapper.ItemOrderMapper;
import com.bishe.mapper.SeatOrderMapper;
import com.bishe.pojo.ItemItemTypeExample;
import com.bishe.pojo.ItemOrder;
import com.bishe.pojo.ItemOrderExample;
import com.bishe.pojo.SeatOrder;
import com.bishe.pojo.SeatOrderExample;
import com.bishe.service.OrderService;
@Service
public class OrderServiceImpl implements OrderService {
	
	@Autowired
	private ItemOrderMapper itemOrderMapper;
	@Autowired
	private SeatOrderMapper seatOrderMapper;
	
	public List<ItemOrder> findFinishItemOrderList(Integer uid) {
		ItemOrderExample example = new ItemOrderExample();
		ItemOrderExample.Criteria criteria = example.createCriteria();
		criteria.andStateEqualTo(true);
		criteria.andUidEqualTo(uid);
		
		List<ItemOrder> items = itemOrderMapper.selectByExample(example);
		return items;
	}

	public List<SeatOrder> findFinishSeatOrderList(Integer uid) {
		SeatOrderExample example = new SeatOrderExample();
		SeatOrderExample.Criteria criteria = example.createCriteria();
		criteria.andStateEqualTo(true);
		criteria.andUidEqualTo(uid);
		
		List<SeatOrder> items = seatOrderMapper.selectByExample(example);
		return items;
	}


}
