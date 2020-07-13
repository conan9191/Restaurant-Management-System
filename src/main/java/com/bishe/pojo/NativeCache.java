package com.bishe.pojo;

import javax.annotation.PostConstruct;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bishe.service.SystemService;

@Service
public class NativeCache {
	
	private Map<Integer,Menu> menuMap = new HashMap<>();

	private Map<Integer,Role> userRoleMap = new HashMap<>();
	
	@Autowired
	private SystemService systemService;
	
	@PostConstruct
	public void init() {
		List<Menu> menuList = systemService.findAllMenu();
		Iterator<Menu> iterator = menuList.iterator();
			while (iterator.hasNext()) {
				Menu menu =   iterator.next();
				menuMap.put(menu.getId(),menu);
			}
	}
	
	public List<Menu> getMenus(){
		if(menuMap.isEmpty()) {
			init();
		}
		return new ArrayList<>(menuMap.values());
	}
	
	public void  addMenu(Menu menu){
		menuMap.put(menu.getId(), menu);
	}
	
	public void  replaceMenu(Menu menu){
		if(menuMap.containsKey(menu.getId())) {
			menuMap.remove(menu.getId());
			menuMap.put(menu.getId(),menu);
		}
	}
	
	public void removeMenu(Integer mid){
		if(menuMap.containsKey(mid)) {
			menuMap.remove(mid);
		}
	}
	
	public void setRole(Integer uid,Role role) {
		userRoleMap.put(uid, role);
	}
	
	public 	Role getRole(Integer uid) {
		return userRoleMap.get(uid);
	}
	
	public 	Menu getMenu(Integer mid) {
		return menuMap.get(mid);
	}
}
