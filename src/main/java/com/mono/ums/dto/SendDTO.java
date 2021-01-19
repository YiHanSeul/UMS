package com.mono.ums.dto;

import java.io.Serializable;

public class SendDTO implements Serializable {
	
	private static final long serialVersionUID = -3785302758805778415L;
	
	
	private int msg_id;
	private String sendType;
	private int schType;
	private String subject;
	private String departNum;
	private String nowDate;
	private String sendDate;
	private int msgCnt;
	private String msgContent;
	private String destNm;
	private String destNum;
	private String destInfo;
	private int reserved1;
	private String var1;
	private String var2;
	private String var3;
	private String var4;
 	
	public String getVar1() {
		return var1;
	}
	public void setVar1(String var1) {
		this.var1 = var1;
	}
	public String getVar2() {
		return var2;
	}
	public void setVar2(String var2) {
		this.var2 = var2;
	}
	public String getVar3() {
		return var3;
	}
	public void setVar3(String var3) {
		this.var3 = var3;
	}
	public String getVar4() {
		return var4;
	}
	public void setVar4(String var4) {
		this.var4 = var4;
	}
	public int getReserved1() {
		return reserved1;
	}
	public void setReserved1(int reserved1) {
		this.reserved1 = reserved1;
	}
	public String getDestInfo() {
		return destInfo;
	}
	public void setDestInfo(String destInfo) {
		this.destInfo = destInfo;
	}
	public int getMsg_id() {
		return msg_id;
	}
	public void setMsg_id(int msg_id) {
		this.msg_id = msg_id;
	}
	public String getSendType() {
		return sendType;
	}
	public void setSendType(String sendType) {
		this.sendType = sendType;
	}
	public int getSchType() {
		return schType;
	}
	public void setSchType(int schType) {
		this.schType = schType;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getDepartNum() {
		return departNum;
	}
	public void setDepartNum(String departNum) {
		this.departNum = departNum;
	}
	public String getNowDate() {
		return nowDate;
	}
	public void setNowDate(String nowDate) {
		this.nowDate = nowDate;
	}
	public String getSendDate() {
		return sendDate;
	}
	public void setSendDate(String sendDate) {
		this.sendDate = sendDate;
	}
	public int getMsgCnt() {
		return msgCnt;
	}
	public void setMsgCnt(int msgCnt) {
		this.msgCnt = msgCnt;
	}
	public String getMsgContent() {
		return msgContent;
	}
	public void setMsgContent(String msgContent) {
		this.msgContent = msgContent;
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
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "SendDTO [msg_id=" + msg_id + ", sendType=" + sendType + ", schType=" + schType + ", subject=" + subject + ", departNum=" + departNum
				+ ", nowDate=" + nowDate + ", sendDate=" + sendDate + ", msgCnt=" + msgCnt + ", msgContent=" + msgContent + ", destNm=" + destNm
				+ ", destNum=" + destNum + ", destInfo=" + destInfo + ", reserved1=" + reserved1 + "]";
	}
	
	
	
	
	

}
