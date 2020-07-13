package com.bishe.service;

import com.bishe.pojo.User;

public interface UserService {

	public User login(String username, String password);

	public void register(User user);

	public User findUserByUsername(String username);
	
	public void editUser(User user);

}
