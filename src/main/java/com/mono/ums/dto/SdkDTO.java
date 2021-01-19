package com.mono.ums.dto;

import java.io.Serializable;

public class SdkDTO implements Serializable{
	//객체 를 파일에 쓰거나 전송하기 위해서 직렬화를 해야함 heap에 위치한 객체를 출력 가능한 상태로 만드는 작업
	private static final long serialVersionUID = 2911675738129359501L;
	
	
	private int msg_id;
	private String sendType;
	private int schType;
	private String subject;
	private String departNum;
	private String nowDate;
	private String sendDate;
	private int msgCnt;
	private String msgContent;
	private String reserved1;
	private String reserved2;
	/*private int succ_count;
	private int fail_count;*/
	DestTempDTO destTempDTO;
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


	public String getReserved1() {
		return reserved1;
	}


	public void setReserved1(String reserved1) {
		this.reserved1 = reserved1;
	}


	public String getReserved2() {
		return reserved2;
	}


	public void setReserved2(String reserved2) {
		this.reserved2 = reserved2;
	}


	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	@Override
	public String toString() {
		return "SdkDTO [msg_id=" + msg_id + ", sendType=" + sendType + ", schType=" + schType + ", subject=" + subject + ", departNum=" + departNum
				+ ", nowDate=" + nowDate + ", sendDate=" + sendDate + ", msgCnt=" + msgCnt + ", msgContent=" + msgContent + ", reserved1=" + reserved1
				+ ", reserved2=" + reserved2 + "]";
	}

	
	
	


	
	}

