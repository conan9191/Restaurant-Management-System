package com.bishe.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bishe.pojo.Accordion;
import com.bishe.pojo.Customer;
import com.bishe.pojo.Menu;
import com.bishe.pojo.Role;
import com.bishe.pojo.User;
import com.bishe.pojo.UserRole;
import com.bishe.pojo.Vip;
import com.bishe.service.SystemService;
import com.bishe.service.VipService;



@Controller
@RequestMapping("/SystemManage")
public class SystemController {
		@Autowired
		private SystemService systemService;
		@Autowired
		private VipService vipService;
	
	@RequestMapping("/UpdateUser")
	@ResponseBody
	public Integer updateUser(Integer uid,Integer rid) {
		User user = systemService.findUserByPrimaryKey(uid);
		user.setPhone("1111111111");
		systemService.updateUser(user, rid);
    	return 1;
	}
	
	@RequestMapping("/getUsers")
	@ResponseBody
	public List<User> getUsers() {
    	return systemService.findAllUser();
	}
	
	@RequestMapping("/getVip")
	@ResponseBody
	public Vip getVip(Integer uid) {
		if(vipService.getVipByUserId(uid)!=null)
    	return vipService.getVipByUserId(uid);
		else return new Vip();
	}
	
	@RequestMapping("/manageCustomer")
	public String manageCustomer(HttpSession session,Model model) {
		Integer error =locateMenus( session,model);
		if(error==-1||error==-2) return "admin/login";
		else {
		Role role = systemService.findRoleByPrimaryKey(2);
		List<User> users = systemService.findAllUsersByRole(role);
		Iterator<User> it = users.iterator();
		List<Customer> customers =  new ArrayList<Customer>();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		while(it.hasNext()) {
			User user = it.next();
			Customer customer = new Customer();
			customer.setId(user.getId());
			customer.setUsername(user.getUsername());
			customer.setNickname(user.getNickname());
			customer.setPhone(user.getPhone());
			customer.setEmail(user.getEmail());
			customer.setCreatedDate(sdf.format(user.getCreated()));
			Vip vip = vipService.getVipByUserId(user.getId());
			if(vip==null) {
				customer.setPoint(0);
				customer.setRankURL(customer.getNullURL());
			}
			else {
				customer.setPoint(vip.getPoint());
				customer.setRankURL(customer.getURL(vip.getRank()));
			}
			customers.add(customer);
		}
		model.addAttribute("customers", customers);
		return "SystemManage/manageCustomer";}
	}
	
	@RequestMapping("/addRole")
	@ResponseBody
	public Integer addRole(Integer[] mid,String name,String description) {
		 Role role = new Role();
		 role.setName(name);
		 role.setDescription(description);
		 systemService.addRole(role, mid);
		 return 1;
	}
	
	@RequestMapping("/addMenu")
	@ResponseBody
	public Integer addMenu(String name,Integer parentId,String description,String url) {
		 Menu menu = new Menu();
		 menu.setName(name);
		 menu.setParentid(parentId);
		 menu.setUrl(url);
		 menu.setDescription(description);
		 menu.setState(false);
		 systemService.addMenu(menu);
		 return 1;
	}
	
	@RequestMapping("/addVip")
	@ResponseBody
	public Integer addVip(Integer rank,Integer point,Integer uid) {
		 vipService.addVip(uid, rank, point);
		 return 1;
	}
	@RequestMapping("/updateVip")
	@ResponseBody
	public Integer updateVip(Integer rank,Integer point,Integer uid) {
		 vipService.updateVipPoint(uid, point);
		 vipService.updateVipRank(uid, rank);
		 return 1;
	}
	
	@RequestMapping("/getParentId")
	@ResponseBody
	public Integer getParentId(HttpSession session) {
		
		 return (Integer) session.getAttribute("parentId");
	}
	
	@RequestMapping("/getMenus")
	@ResponseBody
	public List<Menu> getMenus() {
    	return systemService.findAllMenu();
	}
	
	@RequestMapping("/getMenu")
	@ResponseBody
	public Menu getMenu(Integer id) {
    	return systemService.findMenuByPrimaryKey(id);
	}
	
	@RequestMapping("/manageRole")
	public String getRoles(HttpSession session,Model model) {
		Integer error =locateMenus( session,model);
		if(error==-1||error==-2) return "admin/login";
		else {
		List<Role> roles = systemService.findAllRole();
		model.addAttribute("roles", roles);
		return "SystemManage/manageRole";}
	}
	
	@RequestMapping("/manageMenu")
	public String getMenus(HttpSession session,Model model) {
		Integer error =locateMenus( session,model);
		if(error==-1||error==-2) return "admin/login";
		else {
		if(session.getAttribute("parentId")!=null) {
			session.removeAttribute("parentId");
		}
		List<Menu> menus = systemService.findAllParentMenus();
		model.addAttribute("menus", menus);
		return "SystemManage/manageMenu";
		
		}
	}
	
	@RequestMapping("/manageChildMenu")
	public String manageChildMenu(HttpSession session,Integer mid,Model model) {
		Integer error =locateMenus( session,model);
		if(error==-1||error==-2) return "admin/login";
		else {
		session.setAttribute("parentId", mid);
		List<Menu> childs = systemService.findMenusByParentId(mid);
		model.addAttribute("childs", childs);
		return "SystemManage/manageChildMenu";
		}
	}
	
	@RequestMapping("/updateRole")
	public String update(Model model) {
		List<Role> roles = systemService.findAllRole();
		model.addAttribute("roles", roles);
		return "SystemManage/updateRole";
	}
	
	@RequestMapping("/updateMenu")
	@ResponseBody
	public Menu updateMenu(Integer id,String url) {
		Menu menu = systemService.findMenuByPrimaryKey(id);
		menu.setUrl(url);
		systemService.updateMenu(menu);
		return menu;
	}
	
	@RequestMapping("/deleteRole/{id}")
	public String deleteRole(@PathVariable Integer id) {
		systemService.deleteRole(id);
		return "redirect:/SystemManage/manageRole";
	}
	
	@RequestMapping("/deleteUser/{id}")
	public String deleteUser(@PathVariable Integer id) {
		systemService.deleteUser(id);
		return "redirect:/SystemManage/manageCustomer";
	}
	@RequestMapping("/deleteVip/{id}")
	public String deleteVip(@PathVariable Integer id) {
		vipService.deleteVip(id);
		return "redirect:/SystemManage/manageCustomer";
	}
	
	@RequestMapping("/deleteMenu/{id}")
	public String deleteMenu(@PathVariable Integer id) {
		systemService.deleteMenu(id);
		return "redirect:/SystemManage/manageMenu";
	}
	
	@RequestMapping("/getSubMenus")
	@ResponseBody
	public List<Menu> getSubMenus(Integer parentId) {
		if(Objects.equals(null, parentId)) {
			parentId=0;
		}
    	return systemService.findMenusByParentId(parentId);
	}
	
	@RequestMapping("/getRolesByUserId")
	@ResponseBody
	public List<Role> getRolesByUserId(Integer uid) {
    	return systemService.findUserRolesByUserId(uid);
	}
	
	@RequestMapping("/getMenusByRoleId")
	@ResponseBody
	public List<Menu> getMenusByRoleId(Integer rid) {
    	return systemService.findMenusByRoleId(rid);
	}
	
	@RequestMapping("/updateRoleMenu")
	@ResponseBody
	public Integer updateRoleMenu(Integer rid,Integer[] mid) {
		Integer [] menuId = mid;
		Role role = systemService.findRoleByPrimaryKey(rid);
    	systemService.updateRole(role, menuId);
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
