package com.bishe.service.impl;

import java.util.Iterator;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bishe.mapper.UserMapper;
import com.bishe.mapper.VipMapper;
import com.bishe.mapper.VipRankMapper;
import com.bishe.pojo.User;
import com.bishe.pojo.UserExample;
import com.bishe.pojo.Vip;
import com.bishe.pojo.VipExample;
import com.bishe.pojo.VipRank;
import com.bishe.service.VipService;


@Service
public class VipServiceImpl implements VipService {
	@Autowired
	private UserMapper userMapper;
	@Autowired
	private VipMapper vipMapper;
	@Autowired
	private VipRankMapper vipRankMapper;
	
	@Override
	public List<User> getAllVipUsers() {
		VipExample vipExample = new VipExample();
		List<Vip> vips = vipMapper.selectByExample(vipExample);
		
		UserExample userExample = new UserExample();
		Iterator<Vip> it = vips.iterator();
		while(it.hasNext()) {
			UserExample.Criteria userCriteria = userExample.or();
			userCriteria.andIdEqualTo(it.next().getUid());
		}
		return userMapper.selectByExample(userExample);
	}

	@Override
	public Vip getVipByUserId(Integer uid) {
		VipExample vipExample = new VipExample();
		VipExample.Criteria vipCriteria = vipExample.createCriteria();
		vipCriteria.andUidEqualTo(uid);
		List<Vip> vips = vipMapper.selectByExample(vipExample);
		if(vips.isEmpty()||vips.size()==0)
			 return null;
		else return vipMapper.selectByExample(vipExample).get(0);
	}

	@Override
	public void addVip(Integer uid,Integer rank,Integer point) {
		
		Vip vip = new Vip();
		 Random random=new Random(); 
	     String name =String.valueOf(random.nextInt(9)+1);
	        //长度为几就循环几次
	        for(int i=0; i<2; ++i){
	          //产生0-9的数字
	          int number=random.nextInt(9);
	          name=name+String.valueOf(number);
	        }
	    vip.setName(name);
	    vip.setPoint(point);
	    vip.setRank(rank);
	    vip.setUid(uid);
	    vipMapper.insert(vip);
	}

	@Override
	public void deleteVip(Integer uid) {
		VipExample vipExample = new VipExample();
		VipExample.Criteria vipCriteria = vipExample.createCriteria();
		vipCriteria.andUidEqualTo(uid);
		vipMapper.deleteByExample(vipExample);
	}

	@Override
	public void updateVipRank(Integer uid,Integer rank) {
		VipExample vipExample = new VipExample();
		VipExample.Criteria vipCriteria = vipExample.createCriteria();
		vipCriteria.andUidEqualTo(uid);
		Vip vip = vipMapper.selectByExample(vipExample).get(0);
		vip.setRank(rank);
		vipMapper.updateByPrimaryKey(vip);
	}

	@Override
	public void updateVipPoint(Integer uid,Integer point) {
		
		VipExample vipExample = new VipExample();
		VipExample.Criteria vipCriteria = vipExample.createCriteria();
		vipCriteria.andUidEqualTo(uid);
		Vip vip = vipMapper.selectByExample(vipExample).get(0);
		vip.setPoint(point);
		vipMapper.updateByPrimaryKey(vip);
	}

	@Override
	public VipRank getVipRank(Integer rank) {
		return vipRankMapper.selectByPrimaryKey(rank);
		
	}

}
