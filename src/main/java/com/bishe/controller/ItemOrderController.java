package com.bishe.controller;

import java.text.DecimalFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bishe.pojo.Cart;
import com.bishe.pojo.Payment;
import com.bishe.pojo.SeatOrder;
import com.bishe.pojo.User;
import com.bishe.pojo.Vip;
import com.bishe.pojo.VipRank;
import com.bishe.service.ItemOrderService;
import com.bishe.service.VipService;
import com.bishe.timer.OrderTimer;

@Controller
@RequestMapping("/itemOrder")
public class ItemOrderController {
	@Autowired
	private ItemOrderService itemOrderService;
	@Autowired
	private VipService vipService;
	
	@RequestMapping("/orderCommit")
	@ResponseBody
	public Integer orderCommit(HttpSession session){
		Integer status;
		// 判断是否登录 若没有登录则跳转登录页面
		User user = (User)session.getAttribute("user");
		//没有登录
		if(user==null){
			status = 0;
			System.out.println("未登录");
			return status;
			
		}
		Cart cart = (Cart)session.getAttribute("cart");
		
		//购物车没有内容
		if(cart==null){
			status = -1;
			System.out.println("空");
			return status;
		}
		Integer ioid = itemOrderService.genItemOrder(cart,user);
		
		//生成支付订单对象
		Date endTime = new Date(new Date().getTime()+60*1000*10);
		Payment payment = new Payment(ioid,user.getId(), cart,endTime);
		payment.setEndTime(endTime);
		session.setAttribute("payment"+user.getId(), payment);
		//付款等待时间，订单锁定
		OrderTimer orderTimer = new OrderTimer(session,"payment"+user.getId(),endTime);
		orderTimer.getTimer().schedule(orderTimer, 60*1000*10);
		
		return user.getId();
	}
	
	@RequestMapping("/StartAlipayForItem")
	public String StartAlipay(Integer id ,Model model,HttpSession session) {
		User user = (User) session.getAttribute("user");
		Payment payment = (Payment) session.getAttribute("payment"+id);
		if( session.getAttribute("payment"+id)==null) {
				return "redirect:/order";
		}	
		else if( payment.getUid()!=user.getId()) {
			return "redirect:/login";
		}
		else {
		model.addAttribute("soid",itemOrderService.getItemOrder(payment.getIoid()).getName());
		DecimalFormat df = new DecimalFormat("0.00");//格式化小数   
		String money= df.format(payment.getCart().getTotalPrice());
		model.addAttribute("money", money);
		model.addAttribute("name", "菜品订单"+payment.getIoid());
		Vip vip = vipService.getVipByUserId(user.getId());
		
		if(vip==null) {
			model.addAttribute("discount",1);
		}else {
		VipRank vipRank = vipService.getVipRank(vip.getRank());
			model.addAttribute("discount",vipRank.getDiscount() );
		}
		return "/SeatOrder/StartAlipayForItem";
		}
	}
	
	@RequestMapping("/CloseItemOrder")
	@ResponseBody
	public Integer closeOrder(HttpSession session) {
		User user =(User) session.getAttribute("user");
		if(session.getAttribute("payment"+user.getId())==null)
			return 0;
		else {
		Payment payment = (Payment) session.getAttribute("payment"+user.getId());
		itemOrderService.deleteItemOrder(payment.getIoid());
		session.removeAttribute("payment"+user.getId());
		return 1;
		}
	}
}
