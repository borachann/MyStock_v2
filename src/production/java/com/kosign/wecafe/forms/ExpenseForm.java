package com.kosign.wecafe.forms;

import java.math.BigDecimal;

public class ExpenseForm {
	private BigDecimal quantity;
	private String proname;
	private long UnitPrice;
	private String suppliername;
	private String remark;
	private long expId;
	public BigDecimal getQuantity() {
		return quantity;
	}
	public void setQuantity(BigDecimal quantity) {
		this.quantity = quantity;
	}
	public String getProname() {
		return proname;
	}
	public void setProname(String proname) {
		this.proname = proname;
	}
	public long getUnitPrice() {
		return UnitPrice;
	}
	public void setUnitPrice(long unitPrice) {
		UnitPrice = unitPrice;
	}
	public String getSuppliername() {
		return suppliername;
	}
	public void setSuppliername(String suppliername) {
		this.suppliername = suppliername;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public long getExpId() {
		return expId;
	}
	public void setExpId(long expId) {
		this.expId = expId;
	}
	
	
}
