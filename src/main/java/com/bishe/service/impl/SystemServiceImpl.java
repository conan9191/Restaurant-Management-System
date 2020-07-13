package com.bishe.service.impl;

import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bishe.mapper.ItemTypeMapper;
import com.bishe.mapper.MenuMapper;
import com.bishe.mapper.RoleMapper;
import com.bishe.mapper.RoleMenuMapper;
import com.bishe.mapper.UserMapper;
import com.bishe.mapper.UserRoleMapper;
import com.bishe.mapper.VipMapper;
import com.bishe.pojo.ItemItemMaterialExample;
import com.bishe.pojo.ItemType;
import com.bishe.pojo.ItemTypeExample;
import com.bishe.pojo.Menu;
import com.bishe.pojo.MenuExample;
import com.bishe.pojo.Role;
import com.bishe.pojo.RoleExample;
import com.bishe.pojo.RoleMenu;
import com.bishe.pojo.RoleMenuExample;
import com.bishe.pojo.Seat;
import com.bishe.pojo.User;
import com.bishe.pojo.UserExample;
import com.bishe.pojo.UserRole;
import com.bishe.pojo.UserRoleExample;
import com.bishe.pojo.VipExample;
import com.bishe.service.SystemService;

@Service
public class SystemServiceImpl implements SystemService {
	
	@Autowired
	private UserMapper userMapper;
	@Autowired
	private RoleMapper roleMapper;
	@Autowired
	private MenuMapper menuMapper;
	@Autowired
	private UserRoleMapper userRoleMapper;
	@Autowired
	private RoleMenuMapper roleMenuMapper;
	@Autowired
	private VipMapper vipMapper;
	
	@Override
	public List<User> findAllUser() {
		UserExample example = new UserExample();
		List<User> list = userMapper.selectByExample(example);
		return list;
	}
	
	@Override
	public List<User> findAllUsersByRole(Role role) {
		UserRoleExample userRoleExample = new UserRoleExample();
		UserRoleExample.Criteria criteria =userRoleExample.createCriteria();
		criteria.andRidEqualTo(role.getId());
		List<UserRole> userRole = userRoleMapper.selectByExample(userRoleExample);
		
		UserExample userExample = new UserExample();
		Iterator<UserRole> it = userRole.iterator();
		while(it.hasNext()) {
			UserExample.Criteria userCriteria = userExample.or();
			userCriteria.andIdEqualTo(it.next().getUid());
		}
		
		
		return userMapper.selectByExample(userExample);
	}

	@Override
	public User findUserByPrimaryKey(Integer id) {
		return userMapper.selectByPrimaryKey(id);
	}

	@Override
	public void updateUser(User user,Integer rid) {
		userMapper.updateByPrimaryKey(user);
		UserRoleExample userRoleExample = new UserRoleExample();
		UserRoleExample.Criteria criteria =userRoleExample.createCriteria();
		criteria.andUidEqualTo(user.getId());
		userRoleMapper.deleteByExample(userRoleExample);
		UserRole userRole = new UserRole();
		userRole.setRid(rid);
		userRole.setUid(user.getId());
	    userRoleMapper.insert(userRole);
	
	}

	@Override
	public void deleteUser(Integer id) {
		// 删除用户角色关联表中的数据
		UserRoleExample userRoleExample = new UserRoleExample();
		UserRoleExample.Criteria criteria =userRoleExample.createCriteria();
		criteria.andUidEqualTo(id);
		userRoleMapper.deleteByExample(userRoleExample);
		// 删除vip关联表中的数据
		VipExample vipExample = new VipExample();
		VipExample.Criteria vipCriteria = vipExample.createCriteria();
		vipCriteria.andUidEqualTo(id);
		vipMapper.deleteByExample(vipExample);
		// 删除User
		userMapper.deleteByPrimaryKey(id);
	}
	
	@Override
	public List<Role> findUserRolesByUserId(Integer uid) {
		UserRoleExample userRoleExample = new UserRoleExample();
		UserRoleExample.Criteria criteria =userRoleExample.createCriteria();
		criteria.andUidEqualTo(uid);
		List<UserRole> userRole = userRoleMapper.selectByExample(userRoleExample);
		if(userRole.isEmpty()||userRole.size()==0)return null;
		RoleExample roleExample = new RoleExample();
		Iterator<UserRole> it = userRole.iterator();
		while(it.hasNext()) {
		RoleExample.Criteria criteria2 =roleExample.createCriteria();
		criteria2.andIdEqualTo(it.next().getRid());
		roleExample.or(criteria2);  
		}
		return roleMapper.selectByExample(roleExample);
	}

	@Override
	public void addRole(Role role,Integer[] mid) {
	
		roleMapper.insert(role);

		//更新角色菜单表
		for(int i=0;i<mid.length;i++) {
		RoleMenu roleMenu = new RoleMenu();
		roleMenu.setRid(role.getId());
		roleMenu.setMid(mid[i]);
		roleMenuMapper.insert(roleMenu);
		}
	
	}

	@Override
	public List<Role> findAllRole() {
		RoleExample example = new RoleExample();
		List<Role> list = roleMapper.selectByExample(example);
		return list;
	}

	@Override
	public Role findRoleByPrimaryKey(Integer id) {
		return roleMapper.selectByPrimaryKey(id);
	}

	@Override
	public void updateRole(Role role,Integer[] mid) {
	    roleMapper.updateByPrimaryKey(role);
	    
	    //删除旧的角色菜单表
	    RoleMenuExample roleMenuExample = new   RoleMenuExample();
	    RoleMenuExample.Criteria criteria =roleMenuExample.createCriteria();
		criteria.andRidEqualTo(role.getId());
		roleMenuMapper.deleteByExample(roleMenuExample);
		
		//更新角色菜单表
		for(int i=0;i<mid.length;i++) {
		RoleMenu roleMenu = new RoleMenu();
		roleMenu.setRid(role.getId());
		roleMenu.setMid(mid[i]);
		roleMenuMapper.insert(roleMenu);
		}
	}

	@Override
	public void deleteRole(Integer id) {
		// 删除用户角色关联表中的数据
		UserRoleExample userRoleExample = new UserRoleExample();
		UserRoleExample.Criteria criteria =userRoleExample.createCriteria();
		criteria.andRidEqualTo(id);
		userRoleMapper.deleteByExample(userRoleExample);
		
		// 删除角色菜单关联表中的数据
		 RoleMenuExample roleMenuExample = new   RoleMenuExample();
		 RoleMenuExample.Criteria criteria2 =roleMenuExample.createCriteria();
	     criteria2.andRidEqualTo(id);
		 roleMenuMapper.deleteByExample(roleMenuExample);
			
		// 删除User
		roleMapper.deleteByPrimaryKey(id);
	}

	@Override
	public void addMenu(Menu menu) {
		menuMapper.insert(menu);
	}

	@Override
	public List<Menu> findAllMenu() {
		MenuExample example = new MenuExample();
		List<Menu> list = menuMapper.selectByExample(example);
		return list;
	}

	@Override
	public Menu findMenuByPrimaryKey(Integer id) {
		 
		return menuMapper.selectByPrimaryKey(id);
	}

	@Override
	public void updateMenu(Menu menu) {
		menuMapper.updateByPrimaryKey(menu);
	}

	@Override
	public void deleteMenu(Integer id) {
		
		if(menuMapper.selectByPrimaryKey(id).getParentid()==0) {
			
		 	//删除子集菜单
			MenuExample menuExample = new   MenuExample();
			MenuExample.Criteria menuCriteria =menuExample.createCriteria();
			menuCriteria.andParentidEqualTo(id);
			
			List<Menu> menus = menuMapper.selectByExample(menuExample);
			Iterator<Menu> it = menus.iterator();
			while(it.hasNext()) {
				//删除子集菜单角色菜单关联表
				 RoleMenuExample roleMenuExample = new  RoleMenuExample();
				 RoleMenuExample.Criteria roleMenuCriteria =roleMenuExample.createCriteria();
				 roleMenuCriteria.andMidEqualTo(it.next().getId());
				 roleMenuMapper.deleteByExample(roleMenuExample);
				 
			}
			//删除子集菜单
			menuMapper.deleteByExample(menuExample);
			
		}
		
		
		// 删除角色菜单关联表中的数据
		 RoleMenuExample roleMenuExample = new   RoleMenuExample();
		 RoleMenuExample.Criteria criteria =roleMenuExample.createCriteria();
	     criteria.andMidEqualTo(id);
		 roleMenuMapper.deleteByExample(roleMenuExample);
			
		// 删除菜单
		menuMapper.deleteByPrimaryKey(id);
		

	}

	@Override
	public List<Menu> findMenusByParentId(Integer parentId) {
		MenuExample menuExample = new MenuExample();
		MenuExample.Criteria criteria =menuExample.createCriteria();
		criteria.andParentidEqualTo(parentId);
		return menuMapper.selectByExample(menuExample);
	}

	@Override
	public List<Menu> findMenusByRoleId(Integer rid) {
		RoleMenuExample roleMenuExample = new RoleMenuExample();
		RoleMenuExample.Criteria criteria =roleMenuExample.createCriteria();
		criteria.andRidEqualTo(rid);
		List<RoleMenu> roleMenu = roleMenuMapper.selectByExample(roleMenuExample);
		if(roleMenu.isEmpty()||roleMenu.size()==0)return null;
		MenuExample menuExample = new MenuExample();
		Iterator<RoleMenu> it = roleMenu.iterator();
		while(it.hasNext()) {
		MenuExample.Criteria criteria2 =menuExample.createCriteria();
		criteria2.andIdEqualTo(it.next().getMid());
		menuExample.or(criteria2);  
		}
		return menuMapper.selectByExample(menuExample);
	}

	@Override
	public List<Menu> findAllParentMenus() {
		MenuExample menuExample = new MenuExample();
		MenuExample.Criteria criteria =menuExample.createCriteria();
		criteria.andParentidEqualTo(0);
		return menuMapper.selectByExample(menuExample);
	}


	

}
