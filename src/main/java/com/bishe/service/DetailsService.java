package com.bishe.service;

import java.util.List;



import com.bishe.pojo.Detail;

//座位管理服务接口
public interface DetailsService {
		
		//查询所有座位记录
		public List<Detail> getDetailsList();
		
		List<Detail> getDetailsByPage(int beginNum, int pageSize);
		int getMaxPage(int pageSize);
		
	
}
