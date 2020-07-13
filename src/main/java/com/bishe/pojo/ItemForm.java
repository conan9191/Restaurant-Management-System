package com.bishe.pojo;
/*
 * 连同菜品种类一起查询所有菜品
 */
public class ItemForm extends Item {
	private String typeName;

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	
}
