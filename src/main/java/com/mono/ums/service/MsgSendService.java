package com.mono.ums.service;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;

import com.mono.ums.dto.DestTempDTO;
import com.mono.ums.dto.SdkDTO;
import com.mono.ums.dto.SendDTO;

public interface MsgSendService {

	void setViewPageSms(Model model)throws Exception;

	void setFormPage(Model model) throws Exception;

	Map<String, String> save(Model model) throws Exception;

	Map<String, String> addSendItem(Model model, DestTempDTO destTempDTO, HttpServletRequest req) throws Exception;

	Map<String, Object> findSendItems(Model model) throws Exception;

	Map<String, Object> send(Model model, SdkDTO sdkDTO, SendDTO sendDTO, HttpServletResponse response) throws Exception;

	Map<String, Object> vmssend(Model model, SdkDTO sdkDTO, SdkDTO sdkDTO2, SendDTO sendDTO, HttpServletResponse response)throws Exception;

	void deleteSendItem()throws Exception;
	//수신자 별 선택 삭제 
	void selectDeleteSendItem(ArrayList<DestTempDTO> data);

	
	

}
