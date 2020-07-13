package com.bishe.service.impl;

import java.util.Date;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bishe.mapper.ItemOrderMapper;
import com.bishe.mapper.ItemOrderNumMapper;
import com.bishe.pojo.Cart;
import com.bishe.pojo.CartItem;
import com.bishe.pojo.ItemOrder;
import com.bishe.pojo.ItemOrderNum;
import com.bishe.pojo.User;
import com.bishe.service.ItemOrderService;
import com.bishe.util.GenerateOrderCode;

@Service
public class ItemOrderServiceImpl implements ItemOrderService{
	@Autowired
	private ItemOrderMapper itemOrderMapper;
	@Autowired
	private ItemOrderNumMapper itemOrderNumMapper;
	/*
	 * 生成订单 默认未完成
	 */
	public Integer genItemOrder(Cart cart,User user) {
		ItemOrder itemOrder = new ItemOrder();
		
		/*
		 * 生成订单
		 */
		GenerateOrderCode goc = new GenerateOrderCode();
		itemOrder.setName(goc.GenerateNum());
		itemOrder.setTotalQuantity(cart.getTotalQuantity());
		itemOrder.setTotalPrice(cart.getTotalPrice());
		itemOrder.setOrderTime(new Date());
		itemOrder.setState(false);
		itemOrder.setUid(user.getId());
		
		itemOrderMapper.insert(itemOrder);
		
		
		return itemOrder.getId();
		
	}
	@Override
	public void deleteItemOrder(Integer ioid) {
		itemOrderMapper.deleteByPrimaryKey(ioid);
		
	}
	@Override
	public ItemOrder getItemOrder(Integer ioid) {
		return itemOrderMapper.selectByPrimaryKey(ioid);
		
	}
	@Override
	public void updateItemOrderNum(Cart cart,Integer ioid) {
		
		ItemOrder itemOrder = itemOrderMapper.selectByPrimaryKey(ioid);
		ItemOrderNum itemOrderNum = new ItemOrderNum();
		for(Map.Entry<Integer, CartItem> me:cart.getItems().entrySet()){
			itemOrderNum.setItemId(me.getValue().getItem().getId());
			itemOrderNum.setNum(me.getValue().getQuantity());
			itemOrderNum.setPrice(me.getValue().getPrice());
			itemOrderNum.setItemOrderId(itemOrder.getId());
			
			itemOrderNumMapper.insert(itemOrderNum);
		}
		
	}
	@Override
	public void updateItemOrder(ItemOrder itemOrder) {
		itemOrderMapper.updateByPrimaryKey(itemOrder);
	}
	
}
