package com.mono.ums.dto;

import java.io.Serializable;

public class ReportDetailSendDTO implements Serializable{

	private static final long serialVersionUID = -462899809189375593L;
	
	private String subject;
	private String msgcontent;
	private String sendtype;
	private String departnum;
	private String nowdate;
	private String senddate;
	private String attachfile;
	private String reserved1;
	private int msgid;
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getMsgcontent() {
		return msgcontent;
	}
	public void setMsgcontent(String msgcontent) {
		this.msgcontent = msgcontent;
	}
	public String getSendtype() {
		return sendtype;
	}
	public void setSendtype(String sendtype) {
		this.sendtype = sendtype;
	}
	public String getDepartnum() {
		return departnum;
	}
	public void setDepartnum(String departnum) {
		this.departnum = departnum;
	}
	public String getNowdate() {
		return nowdate;
	}
	public void setNowdate(String nowdate) {
		this.nowdate = nowdate;
	}
	public String getSenddate() {
		return senddate;
	}
	public void setSenddate(String senddate) {
		this.senddate = senddate;
	}
	public String getAttachfile() {
		return attachfile;
	}
	public void setAttachfile(String attachfile) {
		this.attachfile = attachfile;
	}
	public String getReserved1() {
		return reserved1;
	}
	public void setReserved1(String reserved1) {
		this.reserved1 = reserved1;
	}
	public int getMsgid() {
		return msgid;
	}
	public void setMsgid(int msgid) {
		this.msgid = msgid;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "ReportDetailSendDTO [subject=" + subject + ", msgcontent=" + msgcontent + ", sendtype=" + sendtype + ", departnum=" + departnum
				+ ", nowdate=" + nowdate + ", senddate=" + senddate + ", attachfile=" + attachfile + ", reserved1=" + reserved1 + ", msgid=" + msgid
				+ "]";
	}
}
