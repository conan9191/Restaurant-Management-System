package com.bishe.service;

import com.bishe.pojo.Cart;
import com.bishe.pojo.ItemOrder;
import com.bishe.pojo.User;

public interface ItemOrderService {

	Integer genItemOrder(Cart cart,User user);
	
	void deleteItemOrder(Integer ioid);
	
	ItemOrder getItemOrder(Integer ioid);
	
	void updateItemOrderNum(Cart cart,Integer ioid);
	
	void updateItemOrder(ItemOrder itemOrder);
}
