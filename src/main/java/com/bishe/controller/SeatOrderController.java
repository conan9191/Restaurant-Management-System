package com.bishe.controller;

import java.text.DecimalFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bishe.pojo.Accordion;
import com.bishe.pojo.Menu;
import com.bishe.pojo.Payment;
import com.bishe.pojo.Role;
import com.bishe.pojo.SeatOrder;
import com.bishe.pojo.User;
import com.bishe.service.SeatOrderService;
import com.bishe.service.SystemService;
import com.bishe.timer.OrderTimer;
import com.bishe.util.GenerateOrderCode;


@Controller
@RequestMapping("/SeatOrder")
public class SeatOrderController {
	
	@Autowired
	private SeatOrderService seatOrderService;
	@Autowired
	private SystemService systemService;
	

	
	//跳转选座页面
			@RequestMapping("/SelectSeats")
			public String SelectSeats(HttpSession session,Model model) {
				Integer error =locateMenus( session,model);
				if(error==-1||error==-2) return "admin/login";
				else
				return "SeatOrder/SelectSeats";
			 }
	
	//提交订单
			@RequestMapping("/SubmitSeatOrder")
			@ResponseBody
			public Integer submitSeatOrder(Integer[] sid,@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss") Date arrivetime,												
														Integer duration,Integer num,Integer cash,HttpSession session) {
				
				Integer status;
				// 判断是否登录 若没有登录则跳转登录页面
				User user = (User)session.getAttribute("user");
				//没有登录
				if(user==null){
					status = 0;
					System.out.println("未登录");
					return status;
					
				}else {
				
				Integer [] seatId = sid;
				SeatOrder seatOrder = new SeatOrder();
				GenerateOrderCode generateOrderCode = new GenerateOrderCode();
				seatOrder.setName(generateOrderCode.GenerateNum());
				Date nowTime = new Date();
				seatOrder.setOrdertime(nowTime);
				seatOrder.setArrivetime(arrivetime);
				Date leavetime =  new Date(arrivetime.getTime() + 60*1000*duration);
				seatOrder.setLeavetime(leavetime);
				seatOrder.setDuration(duration);
				seatOrder.setNum(num);
				seatOrder.setCash(cash);
				
				seatOrder.setUid(user.getId());
				seatOrder.setState(false);
				String code = generateOrderCode.GenerateCode();
				seatOrder.setConfirm(code);
				Integer soid = seatOrderService.submitSeatOrder(seatOrder);
				Date endTime = new Date(nowTime.getTime()+60*1000*10);
				Payment payment = new Payment(soid, user.getId(), seatId,endTime);
				payment.setEndTime(endTime);
				session.setAttribute("payment"+user.getId(), payment);
				//付款等待时间，座位锁定
				OrderTimer orderTimer = new OrderTimer(session,"payment"+user.getId(),endTime);
				orderTimer.getTimer().schedule(orderTimer, 60*1000*10);
				return user.getId();
				}
			}
			
			
			@RequestMapping("/StartAlipay")
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
				SeatOrder seatOrder = seatOrderService.getSeatOrderById(payment.getSoid());
				model.addAttribute("soid", seatOrder.getName());
				DecimalFormat df = new DecimalFormat("0.00");//格式化小数   
				String money= df.format(seatOrder.getCash());
				model.addAttribute("money", money);
				model.addAttribute("name", "座位预订"+String.valueOf(seatOrder.getId()));
					
				return "/SeatOrder/StartAlipay";
				}
			}
			
			@RequestMapping("/CloseSeatOrder")
			@ResponseBody
			public Integer closeOrder(HttpSession session) {
				User user =(User) session.getAttribute("user");
				if(session.getAttribute("payment"+user.getId())==null)
					return 0;
				else {
				Payment payment = (Payment) session.getAttribute("payment"+user.getId());
				seatOrderService.deleteSeatOrder(seatOrderService.getSeatOrderById(payment.getSoid()));
				session.removeAttribute("payment"+user.getId());
				return 1;
				}
			}
			
			@RequestMapping("/getPayment")
			@ResponseBody
			public Payment getPayment(HttpSession session) {
				User user =(User) session.getAttribute("user");
				Payment payment = (Payment) session.getAttribute("payment"+user.getId());
				return payment;
				
			}
			
			
		

			
			
			
			//获取菜单方法
			private List<Accordion> getAccordions(boolean isAdmin,Integer uid) {
				Set<String> permissionUrls = new HashSet<>();		
				Set<Integer> rootFunctionIdSet =  new HashSet<>();		
				if(!isAdmin) {
						List<Role> roles = systemService.findUserRolesByUserId(uid);
						Iterator<Role> it = roles.iterator();
						while(it.hasNext()) {
							List<Menu> menus = systemService.findMenusByRoleId(it.next().getId());
								Iterator<Menu> it2 = menus.iterator();
								while(it2.hasNext()) {
									Menu menu = it2.next();
									if(menu.getParentid()==0) {
										rootFunctionIdSet.add(menu.getId());
									}else {
										permissionUrls.add(menu.getUrl());
									}
								}
						}
				}
				Map<Integer,Accordion> accordionMap = new HashMap<>();		
				List<Accordion> permissionAccordionSet = new LinkedList<>();
				List<Menu> menus = systemService.findAllMenu();
				List<Accordion>rootAccordionSet = new LinkedList<>();
				Iterator<Menu> it3 = menus.iterator();
				while(it3.hasNext()) {
					Menu menu = it3.next();
					Accordion accordion = new Accordion(menu.getId(), menu.getParentid(), menu.getName(), menu.getUrl());
					accordionMap.put(menu.getId(), accordion );
					if(!isAdmin) {
						if(permissionUrls.contains(menu.getUrl())) {
							permissionAccordionSet.add(accordion);
						}
						if(rootFunctionIdSet.contains(menu.getId())) {
							rootAccordionSet.add(accordion);
						}
					}else {
						permissionAccordionSet.add(accordion);
						if(menu.getParentid()==0) {
							rootAccordionSet.add(accordion);
						}
					}
				}
				
				for(Accordion accordion : rootAccordionSet) {
					competeAccordion(permissionAccordionSet,accordion);
				}
				return rootAccordionSet;
			}
			
			//构建子菜单
			private void competeAccordion(List<Accordion> permissionAccordionSet, Accordion rootAccordionSet) {
				for(Accordion accordion : permissionAccordionSet) {
					if(accordion.getParentId()==rootAccordionSet.getId()) {
						 rootAccordionSet.getChildren().add(accordion);
					}
				}
			}
			
			//分配菜单方法
				private Integer locateMenus(HttpSession session,Model model) {
					//根据角色分配菜单
					User user=(User) session.getAttribute("user");
					if(user==null){
						 return -1;
					 }
					 List<Role> roles =systemService.findUserRolesByUserId(user.getId());
					 if(roles==null||roles.size()==0){
						 return -2;
					 }
					 Integer admin = 0;//记录角色类型
				
					 Iterator<Role> it = roles.iterator();
					 while(it.hasNext()) {
						 Integer rid = it.next().getId();
						 if(rid==1) //为管理员
							 admin=1;
					 }
					 if(admin==1) {
						 model.addAttribute("accordions",  getAccordions(true,null));
					 }else {
						 model.addAttribute("accordions",  getAccordions(false,user.getId()));
					 }
					 return 0;
				}
}
