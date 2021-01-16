package com.mono.ums.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;

import com.mono.ums.dto.DestTempDTO;
import com.mono.ums.dto.SdkDTO;
import com.mono.ums.dto.SendDTO;
import com.mono.ums.mapper.MsgSendMapper;
import com.mono.ums.service.MsgSendService;

@Service
@Transactional
public class MsgSendServiceImpl implements MsgSendService {

	@Autowired
	private MsgSendMapper msgSendMapper;

	@Override
	public void setViewPageSms(Model model) throws Exception {
		DestTempDTO destTempDTO = new DestTempDTO();
		destTempDTO.setDestNm("123");

		model.addAttribute("destTempInfo", destTempDTO);
	}

	// 수신자 목록 리스트 조회
	@Override
	public Map<String, Object> findSendItems(Model model) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();

		HttpServletRequest request = (HttpServletRequest) model.asMap().get("request");
		@SuppressWarnings("unchecked")
		Map<String, String[]> requestMap = request.getParameterMap();

		String[] destNm = requestMap.get("DEST_NM");
		String[] destNum = requestMap.get("DEST_NUM");

		Map<String, Object> paramMap = new HashMap<String, Object>();

		if (destNm != null) {
			paramMap.put("DEST_NM", destNm[0]);
		}

		if (destNum != null) {
			paramMap.put("DEST_NUM", destNum[0]);
		}

		long totalCnt = msgSendMapper.getSendItemTotalCnt(paramMap);
		List<Map<String, Object>> lists = msgSendMapper.findSendItems(paramMap);

		resultMap.put("TOTAL_CNT", totalCnt);
		resultMap.put("LIST", lists);

		return resultMap;
	}

	@Override
	public Map<String, String> addSendItem(Model model, DestTempDTO destTempDTO, HttpServletRequest req) throws Exception {
		Map<String, String> resultMap = new HashMap<String, String>();
		resultMap.put("RESULT_CODE", "1");

		if (StringUtils.isEmpty(destTempDTO.getDestNum())) {
			resultMap.put("RESULT_CODE", "0");
		} else {

			HttpSession session = req.getSession();
			session.setAttribute("sessionId", "sessionId");
			String sessionId = (String) session.getId();
			destTempDTO.setSessionId(sessionId);
			msgSendMapper.addSendItem(destTempDTO);
		}

		return resultMap;
	}
	@Override
	public void deleteSendItem() throws Exception {
		msgSendMapper.deleteSendItem();
		
	}
	@Override
	public Map<String, Object> send(Model model, SdkDTO sdkDTO, SendDTO sendDTO, HttpServletResponse response) throws Exception {
		Map<String, Object> resultSend = new HashMap<String, Object>();
		resultSend.put("RESULT_CODE", "1");
		int type = sdkDTO.getSchType();
		System.out.println("전송 타입 출력 "+type);
		System.out.println("발번:" + sdkDTO.getDepartNum() + "내용:" + sdkDTO.getMsgContent());
		if (StringUtils.isEmpty(sdkDTO.getDepartNum()) && StringUtils.isEmpty(sdkDTO.getMsgContent())) {
			resultSend.put("RESULT_CODE", "0");
		} else {
			msgSendMapper.send(sdkDTO);
			System.out.println("sendMapper의 sdkDTO임 "+sdkDTO);
			msgSendMapper.destCopy(sdkDTO);
			System.out.println("복사완료");
			msgSendMapper.deleteTemp(sdkDTO);
			System.out.println("템프테이블 삭제 완료");
			int msg_id = sdkDTO.getMsg_id();
			System.out.println(msg_id);
			ArrayList<SendDTO> temp = msgSendMapper.tJoin(msg_id);
			System.out.println();
			if (type == 0) {// 즉시전송일 경우
				System.out.println(sdkDTO.getSchType());
				System.out.println("여기는 즉시전송 여기로 가면안됨!!!!!!!!!!!!!!!!");
				System.out.println(sdkDTO.getNowDate());
				for (SendDTO s : temp) {
					s.setMsg_id(msg_id);
					System.out.println(s.getMsg_id());
					s.setDestInfo(s.getDestNm() + '^' + s.getDestNum());
					msgSendMapper.insertSDK(s);
					System.out.println(s.toString());
				}
			} else {// 예약전송일 경우
				System.out.println(sdkDTO.getSchType());
				System.out.println("여기는 예약전송 잘온게 맞음!!!!!!!!!!");
				for (SendDTO s : temp) {
					s.setMsg_id(msg_id);
					System.out.println("******예약전송 확인중  : "+s.getSendDate());
					s.setDestInfo(s.getDestNm() + '^' + s.getDestNum());
					msgSendMapper.insertSDK2(s);
					System.out.println(s.toString());
				}
			}
			System.out.println("sdk테이블 넣기 완료!");
		}
		return resultSend;
	}

	// vms전송 페이지
	@Override
	public Map<String, Object> vmssend(Model model, SdkDTO sdkDTO, SdkDTO sdkDTO2, SendDTO sendDTO, HttpServletResponse response) throws Exception {
		Map<String, Object> resultVmsSend = new HashMap<String, Object>();
		resultVmsSend.put("RESULT_CODE", "1");
		int type = sdkDTO.getSchType();
		System.out.println("발번:" + sdkDTO.getDepartNum() + "내용:" + sdkDTO.getMsgContent());
		if (StringUtils.isEmpty(sdkDTO.getDepartNum()) && StringUtils.isEmpty(sdkDTO.getMsgContent())) {
			resultVmsSend.put("RESULT_CODE", "0");
		} else {
			msgSendMapper.sendVMS(sdkDTO);
			msgSendMapper.destCopy(sdkDTO);
			System.out.println("복사완료 ");
			msgSendMapper.deleteTemp(sdkDTO);
			System.out.println("템프테이블 삭제 완료");
			int msg_id = sdkDTO.getMsg_id();
			ArrayList<SendDTO> temp = msgSendMapper.tJoin(msg_id);
			System.out.println("*************"+msg_id);
			// 즉시전송
			if (type == 0) {
				System.out.println(sdkDTO.getSchType());
				for (SendDTO s : temp) {
					s.setDestInfo(s.getDestNm() + '^' + s.getDestNum());
					s.setMsg_id(msg_id);
					msgSendMapper.insertSDKVMS(s);
					System.out.println(s.toString());

				}

			} else {
				System.out.println(sdkDTO.getSchType());
				for (SendDTO s : temp) {
					s.setDestInfo(s.getDestNm() + '^' + s.getDepartNum());
					s.setMsg_id(msg_id);
					msgSendMapper.insertSDKVMS2(s);
					System.out.println(s.toString());
				}
			}System.out.println("VMS테이블 넣기 완료 ");
		}

		return resultVmsSend;
	}

	// 수신자 추가 insert

	@Override
	public Map<String, String> save(Model model) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<String, String> delete(Model model) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void setFormPage(Model model) throws Exception {
		// TODO Auto-generated method stub

	}

	

}
