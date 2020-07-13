package com.bishe.controller;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bishe.pojo.Accordion;
import com.bishe.pojo.Cart;
import com.bishe.pojo.Item;
import com.bishe.pojo.ItemType;
import com.bishe.pojo.Menu;
import com.bishe.pojo.Payment;
import com.bishe.pojo.Role;
import com.bishe.pojo.User;
import com.bishe.service.ItemService;
import com.bishe.service.SystemService;
/**
 * 页面跳转Controller
 * <p>Title: PageController</p>
 * <p>Description: </p>
 * @author	shizumine
 * @date	2018年3月13日下午1:22:05
 * @version 1.0
 */
@Controller
public class PageController {
	@Autowired
	private SystemService systemService;
	@Autowired
	private ItemService itemService;
	/*
	 * 打开首页
	 */
	@RequestMapping("/")
	public String showIndex(){
		return "index";
	}
	/*
	 * 展示前台页面
	 */
	@RequestMapping("/{page}")
	public String showPage(@PathVariable String page){
		return page;
	}
	/*
	 * 展示后台页面
	 */
	@RequestMapping("/manage/{page}")
	public String showManagePage(@PathVariable String page,HttpSession session,Model model){
		Integer error = locateMenus(session,model);
		if(error==-1||error==-2) return "admin/login";
		else
		return "manage/"+page;
	}
	@RequestMapping("/SeatManage/{page}")
	public String showSeatManagePage(@PathVariable String page,HttpSession session,Model model){
		Integer error = locateMenus(session,model);
		if(error==-1||error==-2) return "admin/login";
		else
		return "SeatManage/"+page;
	}
	@RequestMapping("/SystemManage/{page}")
	public String SystemManagePage(@PathVariable String page,HttpSession session,Model model){
		Integer error = locateMenus(session,model);
		if(error==-1||error==-2) return "admin/login";
		else
		return "SystemManage/"+page;
	}
	/*
	 * 展示登录页面
	 */
	@RequestMapping("/admin/{page}")
	public String showAdminPage(@PathVariable String page){
		return "admin/"+page;
	}
	
	/*
	 * 展示订餐页面
	 */
	@RequestMapping("/order")
	public String showOrderPage(Model model){
		List<ItemType> itemTypes = itemService.findAllItemType();
		model.addAttribute("itemTypes",itemTypes);
		return "order";
	}
	
	@RequestMapping("/orderForPC")
	public String showOrderForPCPage(Model model){
		List<ItemType> itemTypes = itemService.findAllItemType();
		model.addAttribute("itemTypes",itemTypes);
		return "orderForPC";
	}
	
	@RequestMapping("/unfinishOrder")
	public String showOrderForPCPage(HttpSession session){
		User user = (User) session.getAttribute("user");
		Payment payment = (Payment) session.getAttribute("payment"+user.getId());
		if( session.getAttribute("payment"+user.getId())==null) {
				return "redirect:/order";
		}	
		else if( payment.getUid()!=user.getId()) {
			return "redirect:/login";
		}
		if(payment!=null&&payment.getIoid()!=null) {

			return "/itemOrder/StartAlipayForItem?id="+user.getId(); 
		}
		if(payment!=null&&payment.getSoid()!=null) {
		return "/SeatOrder/StartAlipay?id="+user.getId();
		}
		return "redirect:/order";
	}
	/*
	 * 根据菜品种类显示菜品
	 */
	@RequestMapping("/item/getItemByItemType")
	@ResponseBody
	public List<Item> getItemByItemType(Model model,Integer id){
		List<Item> items = itemService.findItemByItemType(id);
		return items;
	}
	/*
	 * 获取所有菜品
	 */
	@RequestMapping("/item/getItems")
	@ResponseBody
	public List<Item> getItems(Model model){
		List<Item> items = itemService.findAllItems();
		return items;
	}
	/*
	 * 添加菜品到购物车
	 */
	@RequestMapping("/item/addCartItem")
	@ResponseBody
	public String addCartItem(Integer id,Integer number,HttpSession session){
		Item item = itemService.findItemByPrimar(id);
		User user = (User) session.getAttribute("user");
		Cart cart = (Cart)session.getAttribute("cart");
		if(cart==null){
			cart = new Cart();
			session.setAttribute("cart",cart);
		}
		//必定有购物车
		cart.addItem(item,number);
		return null;
	}
	/*
	 * 显示购物车
	 */
	@RequestMapping("/item/getCart")
	@ResponseBody
	public Cart getCart(HttpSession session){
		User user = (User) session.getAttribute("user");
		Cart cart = (Cart)session.getAttribute("cart");
		return cart;
	}
	/*
	 * 删除购物项
	 */
	@RequestMapping("/item/removeCartItem")
	@ResponseBody
	public Cart removeCartItem(Integer id,HttpSession session){
		Cart cart = (Cart)session.getAttribute("cart");
		cart.removeItem(id);
		session.setAttribute("cart", cart);
		return cart;
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
