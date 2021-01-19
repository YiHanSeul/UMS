package com.mono.ums.dto;

import java.io.Serializable;

public class SearchDTO implements Serializable {

	private static final long serialVersionUID = -5549159006459385502L;
	private int msgid;
	private String sendtype;
	private String schtype;
	private String subject;
	private String msgcnt;
	private int succcnt;
	private int failcnt;
	private String senddate;
	private String departnum;
	private String reserved1;
	public int getMsgid() {
		return msgid;
	}
	public void setMsgid(int msgid) {
		this.msgid = msgid;
	}
	public String getSendtype() {
		return sendtype;
	}
	public void setSendtype(String sendtype) {
		this.sendtype = sendtype;
	}
	public String getSchtype() {
		return schtype;
	}
	public void setSchtype(String schtype) {
		this.schtype = schtype;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getMsgcnt() {
		return msgcnt;
	}
	public void setMsgcnt(String msgcnt) {
		this.msgcnt = msgcnt;
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
	public String getSenddate() {
		return senddate;
	}
	public void setSenddate(String senddate) {
		this.senddate = senddate;
	}
	public String getDepartnum() {
		return departnum;
	}
	public void setDepartnum(String departnum) {
		this.departnum = departnum;
	}
	public String getReserved1() {
		return reserved1;
	}
	public void setReserved1(String reserved1) {
		this.reserved1 = reserved1;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "SearchDTO [msgid=" + msgid + ", sendtype=" + sendtype + ", schtype=" + schtype + ", subject=" + subject + ", msgcnt=" + msgcnt
				+ ", succcnt=" + succcnt + ", failcnt=" + failcnt + ", senddate=" + senddate + ", departnum=" + departnum + ", reserved1=" + reserved1
				+ "]";
	}
}
