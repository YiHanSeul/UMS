package com.mono.ums.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mono.ums.service.MsgReportService;

@Controller
@RequestMapping("/ums/msgreport")
public class MsgReportController {

	@Autowired
	private MsgReportService msgReportService;

	@ModelAttribute
	public void common(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		// request.getContextPath는 프로젝트 path만 얻어온다
		// ums/msgsend까지 얻어옴 .RequestURI()는 ums/msgsend/test.jsp까지 얻어옴
		model.addAttribute("contextPath", request.getContextPath());
		model.addAttribute("request", request);
	}

	@RequestMapping("/reportView")
	public String reportView(Model mdoel) {
		try {
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "layout:view:msgreport/reportView";
	}

	// 발송된 메시지 조회
	@RequestMapping("/reportList")
	public @ResponseBody Map<String, Object> reportList(Model model) {
		//System.out.println("컨털");
		Map<String, Object> resultMap = null;
		try {
			resultMap = msgReportService.reportList(model);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(resultMap.toString());
		return resultMap;
	}

	// 발송된 메시지 세부조회
	/*@RequestMapping("/reportDetailView")
	public String reportDetailView(@RequestParam(value = "msgid") int msgid, Model model) {
		System.out.println("여기 컨털임 msgid" + msgid);
		model.addAttribute("msgid", msgid);
		return "layout:view:msgreport/reportDetailView";

	}*/

	// 발송된 메시지 개개인 수신자 목록 세부조회
	@RequestMapping("/reportDetailList")
	public @ResponseBody Map<String, Object> reportDetailList(int msgid, Model model, HttpServletResponse response, HttpServletRequest request) {
		//System.out.println("티탸튜탸 부릉부릉이" + msgid);
		Map<String, Object> resultMap = null;
		try {
			resultMap = msgReportService.reportDetailList(msgid);

		} catch (Exception e) {
			// TODO: handle exception
		}
		System.out.println(resultMap.toString());
		return resultMap;
	}
	//전송타입에 따른 결과조회 select 
	@RequestMapping("/sendTypeSearch")
	public @ResponseBody Map<String, Object>  sendTypeSearch(int sendtype,Model model, HttpServletResponse response, HttpServletRequest request){
		
		Map<String,Object> resultMap=null;
		System.out.println("컨털 : " +sendtype);
		try{
			resultMap=msgReportService.sendTypeSearch(sendtype);
		}catch(Exception e){
			
		}System.out.println(resultMap);
		return resultMap;
	}
	

}
