package com.bishe.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bishe.pojo.ItemOrder;
import com.bishe.pojo.SeatOrder;
import com.bishe.pojo.User;
import com.bishe.service.OrderService;

@Controller
public class OrderController {
	@Autowired
	private OrderService orderService;
	
	@RequestMapping("/order/finishOrder")
	public String finishOrder(Model model,HttpSession session) {
		User user = (User)session.getAttribute("user");
		List<ItemOrder> itemOrders = orderService.findFinishItemOrderList(user.getId());
		List<SeatOrder> seatOrders = orderService.findFinishSeatOrderList(user.getId());
		
		model.addAttribute("itemOrders",itemOrders);
		model.addAttribute("seatOrders",seatOrders);
		return "order_finish";
	}
}
