package com.mono.ums.mapper;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.mono.ums.dto.DestTempDTO;
import com.mono.ums.dto.SdkDTO;
import com.mono.ums.dto.SendDTO;

public interface MsgSendMapper {

	List<Map<String, Object>> findSendItems(Map<String, Object> paramMap);

	long getSendItemTotalCnt(Map<String, Object> paramMap);

	void addSendItem(DestTempDTO destTempDTO);
	
	void send(SdkDTO sdkDTO);

	void destCopy(SdkDTO sdkDTO);

	void deleteTemp(SdkDTO sdkDTO);

	ArrayList<SendDTO> tJoin(int msg_id);
	/*ArrayList<SendDTO> tJoin(SdkDTO sdkDTO);*/

	void insertSDK(SendDTO sendDTO);

	void insertSDK2(SendDTO sendDTO);
	
	
	//sdk_vms에 넣는 maapper
	void insertSDKVMS(SendDTO sendDTO);

	void insertSDKVMS2(SendDTO sendDTO);

	void sendVMS(SdkDTO sdkDTO);

	void deleteSendItem();

	void selectDeleteSendItem(String string);


}
