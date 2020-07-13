package com.bishe.service;

import java.util.List;

import com.bishe.pojo.User;
import com.bishe.pojo.Vip;
import com.bishe.pojo.VipRank;

public interface VipService {
	
	List<User> getAllVipUsers();
	
	Vip getVipByUserId(Integer uid);
	
	void addVip(Integer uid,Integer rank,Integer point);
	
	void deleteVip(Integer uid);
	
	void updateVipRank(Integer uid,Integer rank);
	
	void updateVipPoint(Integer uid,Integer point);
	
	VipRank getVipRank(Integer rank);
}
