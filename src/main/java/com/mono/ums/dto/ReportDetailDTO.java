package com.mono.ums.dto;

import java.io.Serializable;

public class ReportDetailDTO implements Serializable {

	private static final long serialVersionUID = -262833007609160189L;
	
	private int msg_id;
	private String dest_name;
	private String phone_number;
	private String now_date;
	private String send_date;
	private String send_status;
	private String tcs_result;
	private int reserved1;
	private int succ_count;
	private int fail_count;
	public int getSucc_count() {
		return succ_count;
	}
	public void setSucc_count(int succ_count) {
		this.succ_count = succ_count;
	}
	public int getFail_count() {
		return fail_count;
	}
	public void setFail_count(int fail_count) {
		this.fail_count = fail_count;
	}
	public int getMsg_id() {
		return msg_id;
	}
	public void setMsg_id(int msg_id) {
		this.msg_id = msg_id;
	}
	public String getDest_name() {
		return dest_name;
	}
	public void setDest_name(String dest_name) {
		this.dest_name = dest_name;
	}
	public String getPhone_number() {
		return phone_number;
	}
	public void setPhone_number(String phone_number) {
		this.phone_number = phone_number;
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
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "ReportDetailDTO [msg_id=" + msg_id + ", dest_name=" + dest_name + ", phone_number=" + phone_number + ", now_date=" + now_date
				+ ", send_date=" + send_date + ", send_status=" + send_status + ", tcs_result=" + tcs_result + ", reserved1=" + reserved1
				+ ", succ_count=" + succ_count + ", fail_count=" + fail_count + "]";
	}
	
	
}
