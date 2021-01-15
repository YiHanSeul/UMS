package com.mono.ums.service;

import java.util.Map;

import org.springframework.ui.Model;

public interface MsgReportService {

	Map<String,Object> reportList(Model model)throws Exception;

	Map<String, Object> reportDetailList(int msgid);


}
