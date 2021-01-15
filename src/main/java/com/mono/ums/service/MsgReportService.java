package com.mono.ums.service;

import java.util.Map;

import org.springframework.ui.Model;

public interface MsgReportService {

	Map<String,Object> reportList(Model model)throws Exception;

	Map<String, Object> reportDetailList(int msgid)throws Exception;
	//전송타입에 따른 결과조회 select 
	Map<String, Object> sendTypeSearch(String sendtype)throws Exception;


}
