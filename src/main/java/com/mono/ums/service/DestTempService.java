package com.mono.ums.service;

import com.mono.ums.dto.DestTempDTO;

public interface DestTempService {
	//수신자 목록 추가
	public void destAdd(DestTempDTO DestTempDTO) throws Exception;
	
	//수신자 목록 삭제
	public void destDelete(DestTempDTO DestTempDTO) throws Exception;
}
