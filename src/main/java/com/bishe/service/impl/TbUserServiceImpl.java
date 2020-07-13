package com.bishe.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bishe.mapper.TbUserMapper;
import com.bishe.mapper.UserRoleMapper;
import com.bishe.pojo.TbUser;
import com.bishe.pojo.TbUserExample;
import com.bishe.pojo.TbUserExample.Criteria;
import com.bishe.pojo.UserRole;
import com.bishe.service.TbUserService;
import com.bishe.util.MD5ConvertUtil;

@Service
public class TbUserServiceImpl implements TbUserService {

	@Autowired
	private TbUserMapper tbUserMapper;
	@Autowired
	private UserRoleMapper userRoleMapper;

	public TbUser getUserById(int id) {
		return tbUserMapper.selectByPrimaryKey(id);
	}

	public void regist(TbUser tbUser) {
		tbUser.setPassword(MD5ConvertUtil.convert(tbUser.getPassword()));
		Date date = new Date();
		tbUser.setCreated(date);
		tbUser.setUpdated(date);
		tbUserMapper.insert(tbUser);
		
		//更新用户角色表（默认注册用户都为顾客角色(rid=2)）
		UserRole userRole = new UserRole();
		userRole.setUid(tbUser.getId());
		userRole.setRid(2);
		userRoleMapper.insert(userRole);
	}

	public TbUser login(String username, String password) {
		TbUserExample example = new TbUserExample();
		Criteria criteria = example.createCriteria();
		criteria.andUsernameEqualTo(username);
		criteria.andPasswordEqualTo(MD5ConvertUtil.convert(password));
		List<TbUser> list = tbUserMapper.selectByExample(example);
		TbUser tbuser = list.get(0);
		return tbuser;
	}
	
}
