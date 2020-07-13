package com.bishe.pojo;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

//购物车
public class Cart implements Serializable {
	Map<Integer, CartItem> items = new HashMap<Integer, CartItem>();
	private Integer totalQuantity;// 总数量
	private float totalPrice;// 总金额

	public Map<Integer, CartItem> getItems() {
		return items;
	}

	public Integer getTotalQuantity() {
		return totalQuantity;
	}

	public void setTotalQuantity(Integer totalQuantity) {
		this.totalQuantity = totalQuantity;
	}

	public Float getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(Float totalPrice) {
		this.totalPrice = totalPrice;
	}

	// 向购物车添加n个菜品
	public void addItem(Item item, Integer number) {
		if (items.containsKey(item.getId())) {
			// 有对应的购物项
			CartItem cartItem = items.get(item.getId());
			cartItem.setQuantity(cartItem.getQuantity() + number);
		} else {
			CartItem cartItem = new CartItem(item);
			cartItem.setQuantity(number);
			items.put(item.getId(), cartItem);
		}

		// 为总数量 和总金额 赋值
		int quantity = 0;
		float price = 0;

		for (Map.Entry<Integer, CartItem> me : items.entrySet()) {
			quantity += me.getValue().getQuantity();
			price += me.getValue().getPrice();
		}

		this.totalQuantity = quantity;
		this.totalPrice = price;
	}

	public void removeItem(Integer id) {
		this.totalPrice -= items.get(id).getPrice();
		this.totalQuantity -= items.get(id).getQuantity();
		items.remove(id);
	}

	public void DecreaseItem(Integer id) {
		CartItem cartItem = items.get(id);
		if(cartItem.getQuantity() <= 1){
			cartItem.setQuantity(1);
		}else{
			cartItem.setQuantity(cartItem.getQuantity() - 1);
		}

		// 为总数量 和总金额 赋值
		int quantity = 0;
		float price = 0;

		for (Map.Entry<Integer, CartItem> me : items.entrySet()) {
			quantity += me.getValue().getQuantity();
			price += me.getValue().getPrice();
		}

		this.totalQuantity = quantity;
		this.totalPrice = price;
	}
}
