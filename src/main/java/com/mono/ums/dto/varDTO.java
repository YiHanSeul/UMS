package com.mono.ums.dto;

import java.io.Serializable;

public class varDTO implements Serializable {

	private static final long serialVersionUID = -1077066324008200781L;
	
	private String var1;
	private String var2;
	

	public String getVar2() {
		return var2;
	}

	public void setVar2(String var2) {
		this.var2 = var2;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getVar1() {
		return var1;
	}

	public void setVar1(String var1) {
		this.var1 = var1;
	}
}
