package com.bishe.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bishe.mapper.UserMapper;
import com.bishe.mapper.UserRoleMapper;
import com.bishe.pojo.User;
import com.bishe.pojo.UserExample;
import com.bishe.pojo.UserRole;
import com.bishe.service.UserService;
import com.bishe.util.MD5ConvertUtil;
@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper userMapper;
	@Autowired
	private UserRoleMapper userRoleMapper;
	
	public User login(String username, String password){
		UserExample example = new UserExample();
		UserExample.Criteria criteria = example.createCriteria();
		criteria.andUsernameEqualTo(username);
		criteria.andPasswordEqualTo(MD5ConvertUtil.convert(password));
		List<User> list = userMapper.selectByExample(example);
		
		User user = new User();
		if(list.size()>0){
			user = list.get(0);
		}
		return user;
	}

	public void register(User user) {
		Date date = new Date();
		user.setCreated(date);
		user.setUpdated(date);
		user.setPassword(MD5ConvertUtil.convert(user.getPassword()));
		//将user插入数据库
		userMapper.insert(user);
		//并且为user设置一个默认角色 rid = 2 默认为顾客
		System.out.println(user.getId());
		
		UserRole userRole = new UserRole();
		userRole.setUid(user.getId());
		userRole.setRid(2);
		userRoleMapper.insert(userRole);
	}

	public User findUserByUsername(String username) {
		UserExample example = new UserExample();
		UserExample.Criteria criteria = example.createCriteria();
		criteria.andUsernameEqualTo(username);
		List<User> list = userMapper.selectByExample(example);
		
		User user = null;
		if(list.size()>0){
			user = list.get(0);
		}
		return user;
	}

	public void editUser(User user) {
		userMapper.updateByPrimaryKey(user);
	}

}
