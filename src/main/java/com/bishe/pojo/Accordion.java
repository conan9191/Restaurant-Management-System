package com.bishe.pojo;

import java.util.LinkedList;
import java.util.List;

public class Accordion /*implements Comparable<Accordion>*/ {
	
	private Integer id;
	private Integer parentId;
	private String name;
	private String url;
	private List<Accordion> children = new LinkedList<>();
/*	private Integer order;*/
	
	
	
	public Accordion(Integer id, Integer parentId, String name, String url/*, Integer order*/) {
		super();
		this.id = id;
		this.parentId = parentId;
		this.name = name;
		this.url = url;
		/*this.order = order;*/
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getParentId() {
		return parentId;
	}
	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public List<Accordion> getChildren() {
		return children;
	}
	public void setChildren(List<Accordion> children) {
		this.children = children;
	}
/*	public Integer getOrder() {
		return order;
	}
	public void setOrder(Integer order) {
		this.order = order;
	}*/
/*	@Override
	public int compareTo(Accordion o) {
		return this.getOrder()-o.getOrder();
	}*/
	
	
}
