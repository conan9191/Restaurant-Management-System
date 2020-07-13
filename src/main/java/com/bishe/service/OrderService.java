package com.bishe.service;

import java.util.List;

import com.bishe.pojo.ItemOrder;
import com.bishe.pojo.SeatOrder;

public interface OrderService {
	/*
	 * 查看所有已完成订餐订单
	 */
	List<ItemOrder> findFinishItemOrderList(Integer uid);
	/*
	 * 查看所有已完成订座订单
	 */
	List<SeatOrder> findFinishSeatOrderList(Integer uid);
}
