package com.mono.ums.mapper;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.mono.ums.dto.ReportDTO;

public interface MsgReportMapper {
	//send테이블 report테이블 조인
	ArrayList<ReportDTO> sendSdktJoin(ReportDTO reportDTO);
	
	ArrayList<ReportDTO> sendSdktJoinVMS(ReportDTO reportDTO);
	
	//send테이블 업데이트
	void updateSend(ReportDTO report);
	
	//send테이블  List 해서 SELECT 
	ArrayList<ReportDTO> sendList();

	//list Select하기
	List<Map<String, Object>> sendList(Map<String, Object> paramMap);
	
	//MSGCNT 뽑아오기
	int sendListCnt(Map<String, Object> paramMap);

	List<Map<String, Object>> reportDetailJoin(int msgid);
	List<Map<String, Object>> reportDeailJoinVMS(int msgid);

	//void updateDest(ReportDetailDTO detail);
	//destList select하기
	//List<Map<String, Object>> destList(Map<String, Object> paramMap);

	//int destListCnt(Map<String, Object> paramMap);

	int destListCnt(int msgid);

	List<Map<String, Object>> destList(int msgid);

	List<Map<String, Object>> reportDetailSend(int msgid);

	

	

	
}
