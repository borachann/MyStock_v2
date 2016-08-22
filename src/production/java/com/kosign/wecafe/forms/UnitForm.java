package com.kosign.wecafe.forms;

import java.math.BigDecimal;

import org.springframework.web.multipart.MultipartFile;

public class UnitForm {
	private Long unitId;	
	private String unitName;	
	private BigDecimal unitqty;	
	private String unittype;
	public Long getUnitId() {
		return unitId;
	}
	public void setUnitId(Long unitId) {
		this.unitId = unitId;
	}
	public String getUnitName() {
		return unitName;
	}
	public void setUnitName(String unitName) {
		this.unitName = unitName;
	}
	public BigDecimal getUnitqty() {
		return unitqty;
	}
	public void setUnitqty(BigDecimal unitqty) {
		this.unitqty = unitqty;
	}
	public String getUnittype() {
		return unittype;
	}
	public void setUnittype(String unittype) {
		this.unittype = unittype;
	}
	
	
	
}
