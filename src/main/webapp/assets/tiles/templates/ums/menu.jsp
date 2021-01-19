<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<div class="menu">
	<div class="leftbox">
		<div class="leftboxImgList">
			<img src="${contextPath}\assets\images\Icon_MAIN.png" />
			<img src="${contextPath}\assets\images\Icon_SMS.png" />
			<img src="${contextPath}\assets\images\Icon_MMS.png" />
			<img src="${contextPath}\assets\images\Icon_VMS.png" />
			<img src="${contextPath}\assets\images\Icon_FMS.png" />
		</div>
		<div class="leftboxList">
            <ul class="detail_tabs">
                <li id="/ums/jsp/msgsend/sms.jsp">SMS/LMS</li>
                <li id="/ums/jsp/msgsend/mms.jsp">MMS</li>
                <li id="/ums/jsp/msgsend/vms.jsp">VMS</li>
                <li id="/ums/jsp/msgsend/fms.jsp">FMS</li>
            </ul>		
		
		</div>
	</div>
				
			    
			    
	
	
	<div class="rightbox" id="/ums/jsp/msgreport/reportView.jsp">
		<img src="${contextPath}\assets\images\icon_ReportViewWhite.png" />
		<p>결과 조회</p>
	</div>
</div>