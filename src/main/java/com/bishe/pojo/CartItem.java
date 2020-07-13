package com.bishe.pojo;

import java.io.Serializable;
//购物项
public class CartItem implements Serializable{
	private Item item;
	private Integer quantity;//本项数量
	private Float price;//本项小计
	
	public Float getPrice() {
		return item.getPrice()*quantity;
	}

	public void setPrice(Float price) {
		this.price = price;
	}

	public CartItem(Item item){
		this.item = item;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public Item getItem() {
		return item;
	}
	
}
