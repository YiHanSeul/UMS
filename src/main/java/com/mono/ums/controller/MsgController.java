package com.mono.ums.controller;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mono.ums.dto.DestTempDTO;
import com.mono.ums.dto.SdkDTO;
import com.mono.ums.dto.SendDTO;
import com.mono.ums.service.MsgSendService;

@Controller
@RequestMapping("/ums/msgsend")
public class MsgController {

	@Autowired
	private MsgSendService msgSendService;

	@ModelAttribute
	public void common(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		// request.getContextPath는 프로젝트 path만 얻어온다
		// ums/msgsend까지 얻어옴 .RequestURI()는 ums/msgsend/test.jsp까지 얻어옴
		model.addAttribute("contextPath", request.getContextPath());
		model.addAttribute("request", request);
	}

	@RequestMapping("/sms")
	public String sms(Model model) {
		try {
			msgSendService.setViewPageSms(model);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "layout:view:msgsend/sms";
	}

	// 수신자 목록 조회
	@RequestMapping("/list")
	public @ResponseBody Map<String, Object> list(Model model, HttpServletResponse response) {
		Map<String, Object> resultMap = null;
		try {
			resultMap = msgSendService.findSendItems(model);
		} catch (Exception e) {
			e.printStackTrace();
			// 어떠한 예외처리가 필요.
		}
		return resultMap;
	}

	// 대상자 추가 버튼 insert
	@RequestMapping("/addSendItem")
	public @ResponseBody Map<String, String> addSendItem(Model model, DestTempDTO destTempDTO, HttpServletResponse response, HttpServletRequest req) {
		Map<String, String> resultMap = null;
		try {
			resultMap = msgSendService.addSendItem(model, destTempDTO, req);
		} catch (Exception e) {
			e.printStackTrace();
			// 어떠한 예외처리가 필요.
		}
		return resultMap;
	}
	@RequestMapping("/deleteSendItem")
	public void deleteSendItem(HttpServletResponse response, HttpServletRequest req){
		System.out.println("여기는 컨털 인디 ");
		try {
			msgSendService.deleteSendItem();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	@RequestMapping("/selectDeleteSendItem")
	public void selectDeleteSendItem(String[] data ,HttpServletResponse response,HttpServletRequest request){
		/*DestTempDTO destTempDTO = new DestTempDTO();*/
		try {
			msgSendService.selectDeleteSendItem(data);
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	// 메시지 전송
	@RequestMapping("/send")
	public @ResponseBody Map<String, Object> send(Model model,SdkDTO sdkDTO,SendDTO sendDTO, HttpServletResponse response) {
		Map<String, Object> resultSend=null;
		try {
			System.out.println(sdkDTO.toString());
			resultSend=msgSendService.send(model, sdkDTO, sendDTO, response);
		} catch (Exception e) {
			e.printStackTrace();
			// 어떠한 예외처리가 필요.
		}
		return resultSend;
	}
	@RequestMapping("/vmssend")
	public @ResponseBody Map<String, Object> vmssend(Model model,SdkDTO sdkDTO,SendDTO sendDTO, HttpServletResponse response){
		Map<String, Object> resultVmsSend=null;
		try {
			//System.out.println(sdkDTO.toString());
			resultVmsSend=msgSendService.vmssend(model, sdkDTO, sdkDTO, sendDTO, response);
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return resultVmsSend;
	}

	@RequestMapping("/removeSendItem")
	public @ResponseBody Map<String, String> removeSendItem(Model model, HttpServletResponse response) {
		Map<String, String> resultMap = null;
		try {
			resultMap = msgSendService.save(model);
		} catch (Exception e) {
			e.printStackTrace();
			// 어떠한 예외처리가 필요.
		}
		return resultMap;
	}

	@RequestMapping("/form")
	public String form(Model model) {
		try {
			msgSendService.setFormPage(model);
		} catch (Exception e) {
			e.printStackTrace();
			// 어떠한 예외처리가 필요.
		}

		return "/ums/msgsend/form";
	}

	@RequestMapping("/save")
	public @ResponseBody Map<String, String> save(Model model, HttpServletResponse response) {
		Map<String, String> resultMap = null;
		try {
			resultMap = msgSendService.save(model);
		} catch (Exception e) {
			e.printStackTrace();
			// 어떠한 예외처리가 필요.
		}
		return resultMap;
	}

	@RequestMapping("/mms")
	public String mms(Model model) {
		/*
		 * try{ msgSendService.setViewPageMms(model); }catch(Exception e){ e.printStackTrace(); }
		 */
		return "layout:view:msgsend/mms";
	}

	@RequestMapping("/vms")
	public String vms(Model model) {
		/*
		 * try{ msgSendService.setViewPageVms(model); }catch(Exception e){ e.printStackTrace(); }
		 */
		return "layout:view:msgsend/vms";
	}

	@RequestMapping("/fms")
	public String fms(Model model) {
		/*
		 * try{ msgSendService.setViewPage(model); }catch(Exception e){ e.printStackTrace(); }
		 */
		return "layout:view:msgsend/fms";
	}
}
