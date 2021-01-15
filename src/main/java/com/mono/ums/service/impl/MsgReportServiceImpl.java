package com.mono.ums.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.mono.ums.dto.ReportDTO;
import com.mono.ums.dto.SelectMsgDTO;
import com.mono.ums.mapper.MsgReportMapper;
import com.mono.ums.service.MsgReportService;

@Service
@Transactional
public class MsgReportServiceImpl implements MsgReportService {
	@Autowired
	private MsgReportMapper msgReportMapper;

	@Override
	public Map<String, Object> reportList(Model model) throws Exception {
		Map<String,Object> resultMap = new HashMap<String, Object>();
		ReportDTO reportDTO =new ReportDTO();
		ArrayList<ReportDTO> list=msgReportMapper.sendSdktJoin(reportDTO);
		ArrayList<ReportDTO> list1=msgReportMapper.sendSdktJoinVMS(reportDTO);
		//System.out.println(list.toString());
		//System.out.println("*************"+list1.toString());
		
		//값이 많이 나오기때문에 무조건  리스트로 받아야함 받은다음 for each로 뽑아서 update해야함 
		for (ReportDTO report : list) {
			msgReportMapper.updateSend(report);
			//System.out.println("업데이트 완료");
		}
		for(ReportDTO report:list1){
			msgReportMapper.updateSend(report);
			//System.out.println("VMS업데이트 완료");
		}
		//조인한후 send테이블 업데이트후 send테이블 select
		Map<String,Object> paramMap=new HashMap<String, Object>();
		List<Map<String,Object>>lists=msgReportMapper.sendList(paramMap);
		//System.out.println(lists);
		//long msgCnt=msgReportMapper.sendListCnt(paramMap);
		resultMap.put("LISTS", lists);
		//int score = Integer.parseInt(String.valueOf(dataMap.get("score")));
		int msgCnt=Integer.parseInt(String.valueOf(msgReportMapper.sendListCnt(paramMap)));
		resultMap.put("MSG_CNT", msgCnt);
		
		return resultMap;
	}
	//*************여기 부터 전송된 메시지 세부 조회******************
	@Override
	public Map<String, Object> reportDetailList(int msgid) {
		Map<String, Object> resultMap =new HashMap<String, Object>();
		//발송된 메시지 정보 select 
		List<Map<String, Object>> sendlists=msgReportMapper.reportDetailSend(msgid);
		System.out.println(sendlists.toString());
		resultMap.put("SENDLISTS", sendlists);
		//msg_id값을 reportDetailDTO에 넣어준다
		List<Map<String,Object>>lists=msgReportMapper.reportDetailJoin(msgid);
		resultMap.put("LISTSSMS", lists);
		List<Map<String,Object>>listsVMS=msgReportMapper.reportDeailJoinVMS(msgid);
		resultMap.put("LISTSVMS",listsVMS );
	
		
		//System.out.println(lists);
		int destCnt=msgReportMapper.destListCnt(msgid);
		//System.out.println("destList의 총 값은 : "+destCnt);
		resultMap.put("DEST_CNT", destCnt);
		return resultMap;
	}
	//전송타입에 따른 결과조회 select 

	@Override
	public Map<String, Object> sendTypeSearch(int sendtype) throws Exception {
		Map<String ,Object> resultMap=new HashMap<String,Object>();
		SelectMsgDTO selectMsgDTO=new SelectMsgDTO();
		List<Map<String, Object>>sendTypeSearch=msgReportMapper.sendTypeSearch(sendtype);
		System.out.println(selectMsgDTO);
		resultMap.put("sendType",sendTypeSearch );
		
		return resultMap;
	}

}
