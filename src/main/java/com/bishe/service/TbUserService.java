package com.bishe.service;

import java.util.List;

import com.bishe.pojo.TbUser;

public interface TbUserService {
	/*
	 * 根据Id返回TbUser
	 */
	TbUser getUserById(int id);
	/*
	 * 注册新的用户
	 */
	void regist(TbUser tbUser);
	/*
	 * 登录
	 */
	TbUser login(String username,String password);
}
