package com.bishe.service;

import java.util.Iterator;

import com.bishe.pojo.ItemForm;
import com.bishe.pojo.Seat;
import com.bishe.pojo.SeatType;
import com.bishe.service.impl.ItemServiceImpl;
import com.bishe.service.impl.SeatServiceImpl;


public class seatServiceTest {


	public static void main(String[] args) {
		ItemServiceImpl ssl = new ItemServiceImpl();
		
		Iterator<ItemForm> it = ssl.findAllItem().iterator();
		while(it.hasNext()) {
		  System.out.println(it.next());
		}
	}
}
