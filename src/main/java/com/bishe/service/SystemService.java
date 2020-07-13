package com.bishe.service;

import java.util.List;

import com.bishe.pojo.Menu;
import com.bishe.pojo.Role;
import com.bishe.pojo.User;

public interface SystemService {

	/*
	 * 查找所以用户
	 */
	public List<User> findAllUser();
	
	/*
	 * 查找某一角色所有用户
	 */
	public List<User> findAllUsersByRole(Role role);
	
	/*
	 * 根据主键查找用户
	 */
	public User findUserByPrimaryKey(Integer id);
	/*
	 * 修改用户信息
	 */
	public void updateUser(User user,Integer rid);
	/*
	 * 根据主键删除用户
	 */
	public void deleteUser(Integer id);
	
	/*
	 * 查看某一用用户全部的角色
	 */
	public List<Role> findUserRolesByUserId(Integer uid);
	
	/*
	 * 添加角色
	 */
	public void addRole(Role role,Integer[] mid);
	/*
	 * 查找角色
	 */
	public List<Role> findAllRole();
	/*
	 * 根据主键查找角色
	 */
	public Role findRoleByPrimaryKey(Integer id);
	/*
	 * 修改角色信息
	 */
	public void updateRole(Role role,Integer[] mid);

	/*
	 * 根据主键删除角色
	 */
	public void deleteRole(Integer id);
	
	
	/*
	 * 添加菜单
	 */
	public void addMenu(Menu menu);
	/*
	 * 查找菜单
	 */
	public List<Menu> findAllMenu();
	/*
	 * 查找父级菜单
	 */
	public List<Menu> findAllParentMenus();
	/*
	 * 根据主键查找菜单
	 */
	public Menu findMenuByPrimaryKey(Integer id);
	/*
	 * 修改菜单
	 */
	public void updateMenu(Menu menu);
	/*
	 * 根据主键删除菜单
	 */
	public void deleteMenu(Integer id);
	
	/*
	 * 根据父节点查找其下所有菜单
	 */
	public List<Menu> findMenusByParentId(Integer parentId);
	
	/*
	 * 根据角色Id查找所有菜单
	 */
	public List<Menu> findMenusByRoleId(Integer rid);
	
}
