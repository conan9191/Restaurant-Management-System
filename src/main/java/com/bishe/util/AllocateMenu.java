package com.bishe.util;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.bishe.pojo.Accordion;
import com.bishe.pojo.Menu;
import com.bishe.pojo.Role;
import com.bishe.pojo.User;

public class AllocateMenu {
	/*//获取菜单方法
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
				}*/
}
