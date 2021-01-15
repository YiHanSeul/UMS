package com.mono.ums.dto;

import java.io.Serializable;

public class ReportDTO implements Serializable{
	
	private static final long serialVersionUID = -1434082131191234279L;

	private int msgid;
	private String sendtype;
	private String schtype;
	private String subject;
	private String msgcnt;
	private String msgcontent;
	private int succ_total;
	private int fail_total;
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
	public String getMsgcontent() {
		return msgcontent;
	}
	public void setMsgcontent(String msgcontent) {
		this.msgcontent = msgcontent;
	}
	public int getSucc_total() {
		return succ_total;
	}
	public void setSucc_total(int succ_total) {
		this.succ_total = succ_total;
	}
	public int getFail_total() {
		return fail_total;
	}
	public void setFail_total(int fail_total) {
		this.fail_total = fail_total;
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
		return "ReportDTO [msgid=" + msgid + ", sendtype=" + sendtype + ", schtype=" + schtype + ", subject=" + subject + ", msgcnt=" + msgcnt
				+ ", msgcontent=" + msgcontent + ", succ_total=" + succ_total + ", fail_total=" + fail_total + ", senddate=" + senddate
				+ ", departnum=" + departnum + ", reserved1=" + reserved1 + "]";
	}
	
	
	

	
	
}
