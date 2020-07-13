package com.bishe.service;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.bishe.mapper.ItemTypeMapper;
import com.bishe.pojo.ItemType;
import com.bishe.pojo.ItemTypeExample;

public class ItemServiceTest {

	@Autowired
	private ItemTypeMapper itemTypeMapper;

	@Test
	public void findAllItemTypeTest() {
		ItemTypeExample example = new ItemTypeExample();
		List<ItemType> list = itemTypeMapper.selectByExample(example);
		System.out.println(list);
	}
}
