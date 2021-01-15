package com.mono.ums.dto;

import java.io.Serializable;

public class ReportDetailDestDTO implements Serializable {

	private static final long serialVersionUID = -4483471773759709062L;
	
	private int msgid;
	private String destNm;
	private String destNum;
	private String now_date;
	private String send_date;
	private String send_status;
	private String tcs_result;
	private int reserved1;
	private int succcnt;
	private int failcnt;
	
	public int getMsgid() {
		return msgid;
	}

	public void setMsgid(int msgid) {
		this.msgid = msgid;
	}

	public String getDestNm() {
		return destNm;
	}

	public void setDestNm(String destNm) {
		this.destNm = destNm;
	}

	public String getDestNum() {
		return destNum;
	}

	public void setDestNum(String destNum) {
		this.destNum = destNum;
	}

	public String getNow_date() {
		return now_date;
	}

	public void setNow_date(String now_date) {
		this.now_date = now_date;
	}

	public String getSend_date() {
		return send_date;
	}

	public void setSend_date(String send_date) {
		this.send_date = send_date;
	}

	public String getSend_status() {
		return send_status;
	}

	public void setSend_status(String send_status) {
		this.send_status = send_status;
	}

	public String getTcs_result() {
		return tcs_result;
	}

	public void setTcs_result(String tcs_result) {
		this.tcs_result = tcs_result;
	}

	public int getReserved1() {
		return reserved1;
	}

	public void setReserved1(int reserved1) {
		this.reserved1 = reserved1;
	}

	public int getSucccnt() {
		return succcnt;
	}

	public void setSucccnt(int succcnt) {
		this.succcnt = succcnt;
	}

	public int getFailcnt() {
		return failcnt;
	}

	public void setFailcnt(int failcnt) {
		this.failcnt = failcnt;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "ReportDetailDestDTO [msgid=" + msgid + ", destNm=" + destNm + ", destNum=" + destNum + ", now_date=" + now_date + ", send_date="
				+ send_date + ", send_status=" + send_status + ", tcs_result=" + tcs_result + ", reserved1=" + reserved1 + ", succcnt=" + succcnt
				+ ", failcnt=" + failcnt + ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}
	
	
	
}
