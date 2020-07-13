package com.bishe.controller;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bishe.pojo.Accordion;
import com.bishe.pojo.Item;
import com.bishe.pojo.ItemType;
import com.bishe.pojo.Menu;
import com.bishe.pojo.Payment;
import com.bishe.pojo.Role;
import com.bishe.pojo.Seat;
import com.bishe.pojo.SeatSchedule;
import com.bishe.pojo.SeatType;
import com.bishe.pojo.User;
import com.bishe.service.SeatService;
import com.bishe.service.SystemService;

@Controller
@RequestMapping("/SeatManage")
public class SeatController {
	@Autowired
	private SeatService seatService;
	@Autowired
	private SystemService systemService;
	
	
	//跳转座位管理页面
	@RequestMapping("/ManageSeats")
	public String manageSeats(HttpSession session,Model model) {
		
			Integer error =locateMenus( session,model);
			if(error==-1||error==-2) return "admin/login";
			else
		 	return "SeatManage/ManageSeats";
	}
	
	
	//跳转添加座位页面
		@RequestMapping("/addSeats")
		public String addSeats(HttpSession session,Model model) {
			Integer error =locateMenus( session,model);
			if(error==-1||error==-2) return "admin/login";
			else
			return "SeatManage/addSeats";
		}
	
	//查询所有座位
	@RequestMapping("/getSeatsList")
	@ResponseBody
	public List<Seat> getSeatsList(HttpSession session) {
		List<Seat> lists = seatService.getSeatsList();
        Enumeration enumeration = session.getAttributeNames();
		List<Integer> needUpdateId = new ArrayList<>();
		while(enumeration.hasMoreElements()){
			String name = enumeration.nextElement().toString();
			  if(name.indexOf("payment")!=-1){
				  Payment payment=(Payment)session.getAttribute(name);
				  Integer[] seatId = payment.getSeatId();
				  for(int i =0;i<seatId.length;i++) {
					needUpdateId.add(seatId[i]);  
				  }
			  }
		}
		Iterator<Seat> it = lists.iterator();
		while(it.hasNext()) {
			Seat s = it.next();
			if(needUpdateId.contains(s.getId())) {
				s.setState(false);
			}
		}
		return lists;
	}
	
	//按某一时间点查询所有可预订座位
	@RequestMapping("/getAvailableSeatsListByTime")
	@ResponseBody
	public List<Seat> getAvailableSeatsList(HttpSession session,@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")Date startTime)  {
		List<Seat> lists = seatService.getAvailableSeatsList(startTime);
		   Enumeration enumeration = session.getAttributeNames();
			List<Integer> needUpdateId = new ArrayList<>();
			while(enumeration.hasMoreElements()){
				String name = enumeration.nextElement().toString();
				  if(name.indexOf("payment")!=-1){
					  Payment payment=(Payment)session.getAttribute(name);
					  Integer[] seatId = payment.getSeatId();
					  for(int i =0;i<seatId.length;i++) {
						needUpdateId.add(seatId[i]);  
					  }
				  }
			}
			Iterator<Seat> it = lists.iterator();
			while(it.hasNext()) {
				Seat s = it.next();
				if(needUpdateId.contains(s.getId())) {
					lists.remove(seatService.getById(s.getId()));
				}
			}
		return lists;
	}
	
	//按某一时间点查询所有已被预订座位
	@RequestMapping("/getOccupiedSeatsListByTime")
	@ResponseBody
	public List<Seat> getOccupiedSeatsList(HttpSession session,@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")Date startTime)  {
		List<Seat> lists = seatService.getOccupiedSeatsList(startTime);
		Enumeration enumeration = session.getAttributeNames();
		
		while(enumeration.hasMoreElements()){
			String name = enumeration.nextElement().toString();
			  if(name.indexOf("payment")!=-1){
				  Payment payment=(Payment)session.getAttribute(name);
				  Integer[] seatId = payment.getSeatId();
				  for(int i =0;i<seatId.length;i++) {
					lists.add(seatService.getById(seatId[i])); 
				  }
			  }
		}
		return lists;
	}
	
	//按ID查询某一座位
	@RequestMapping("/getSeat")
	@ResponseBody
	public Seat getSeat(Integer id){
		return seatService.getById(id);
	}
	
	//按位置号查询某一座位
	@RequestMapping("/getSeatByPlace")
	@ResponseBody
	public Seat getSeat(String place){
		return seatService.getByPlace(place);
	}
	
	
	//添加座位
		@RequestMapping("/addSeat")
		@ResponseBody
		public Integer addSeat(Integer id,String name,Integer seatTypeId,Boolean state,String place) {
			Seat seat = new Seat();
			seat.setId(id);
			seat.setName(name);
			seat.setSeatTypeId(seatTypeId);
			seat.setState(state);
			seat.setPlace(place);
			seatService.addSeat(seat);
			return 1;
		}
/*	//添加座位提交
		@RequestMapping("/addSeatCommit")
		public String addSeatCommit(Seat seat) {
			seatService.addSeat(seat);
			return "redirect:/SeatManage/ManageSeats";
		}*/
		
	//按ID查询某一座位类型
		@RequestMapping("/getSeatType")
		@ResponseBody
		public SeatType getSeatType(Integer id){
			return seatService.getSeatType(id);
		}
//按ID查询某一座位类型
		@RequestMapping("/getSeatTypeBySeatId")
		@ResponseBody
		public SeatType getSeatTypeBySeatId(Integer sid){
			int id =seatService.getById(sid).getSeatTypeId();
			return seatService.getSeatType(id);
		}
				
		
	//按座位ID查询座位时间表
		@RequestMapping("/getSeatScheduleListBySeatId")
		@ResponseBody
		public List<SeatSchedule>  getSeatScheduleListBySeatId(Integer sid){
			return seatService.getSeatScheduleListBySeatId(sid);
		}
		
		//修改座位
		@RequestMapping("/editSeat")
		@ResponseBody
		public Seat editSeat(Integer sid) {
			return seatService.getById(sid);
		}
		//修改座位提交
		@RequestMapping("/editSeatCommit")
		@ResponseBody
		public Integer editSeatCommit(Integer id,String name, Integer seatTypeId,Boolean state) {
			Seat seat = seatService.getById(id);
			seat.setName(name);
			seat.setSeatTypeId(seatTypeId);
			seat.setState(state);
	    	seatService.updateSeat(seat);
	    		return 1;
		}
		
		//查询所有座位类型
		@RequestMapping("/getSeatTypesList")
		@ResponseBody
		public List<SeatType> getSeatTypesList() {
			List<SeatType> lists = seatService.getSeatTypesList();
			return lists;
		}
		
		//删除座位
				@RequestMapping("/deleteSeat")
				@ResponseBody
				public Integer deleteSeat(Integer id) {
						seatService.deleteSeat(id);
			    		return 1;
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
