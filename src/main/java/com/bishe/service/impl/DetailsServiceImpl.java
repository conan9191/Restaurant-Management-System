package com.bishe.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bishe.mapper.DetailMapper;
import com.bishe.pojo.Detail;
import com.bishe.pojo.DetailExample;
import com.bishe.service.DetailsService;

@Service
public class DetailsServiceImpl implements DetailsService {
	@Autowired
	private DetailMapper detailsMapper;
	
	@Override
	public List<Detail> getDetailsList() {
		
		DetailExample example = new DetailExample();
		return detailsMapper.selectByExample(example);
	}

	@Override
	public List<Detail> getDetailsByPage(int beginNum, int pageSize) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getMaxPage(int pageSize) {
		// TODO Auto-generated method stub
		int count = detailsMapper.getDetailsCount();
		return count % pageSize == 0 ? count / pageSize : count / pageSize + 1;
	}

}
