package com.kosign.wecafe.forms;

import java.math.BigDecimal;

public class RequestForm {
	
	private long reqId;
	private long proId;
	private BigDecimal proQty;
	private long remainQty;
	
	public BigDecimal getProQty() {
		return proQty;
	}
	public void setProQty(BigDecimal proQty) {
		this.proQty = proQty;
	}
	
	public long getProId() {
		return proId;
	}
	public void setProId(long proId) {
		this.proId = proId;
	}
	public long getRemainQty() {
		return remainQty;
	}
	public void setRemainQty(long remainQty) {
		this.remainQty = remainQty;
	}
	public long getReqId() {
		return reqId;
	}
	public void setReqId(long reqId) {
		this.reqId = reqId;
	}
	@Override
	public String toString() {
		return "RequestForm [reqId=" + reqId + ", proId=" + proId + ", proQty=" + proQty + ", remainQty=" + remainQty
				+ "]";
	}
	
	
}
