package com.bishe.pojo;

public class Material {
	private int materialId;
	private int materialNum;
	public int getMaterialId() {
		return materialId;
	}
	public void setMaterialId(int materialId) {
		this.materialId = materialId;
	}
	public int getMaterialNum() {
		return materialNum;
	}
	public void setMaterialNum(int materialNum) {
		this.materialNum = materialNum;
	}
	@Override
	public String toString() {
		return "Material [materialId=" + materialId + ", materialNum=" + materialNum + "]";
	}
}
