<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../../../include/inc_common.jsp"%>
<%@ include file="../../../include/inc_script.jsp"%>
</head>

<body>

	<div class="container-fluid">
		<div class="row">
			<div class="col-12">
				<tiles:insertAttribute name="header" />
			</div>
			
				<div id="sider">
					<tiles:insertAttribute name="sider" />
				</div>
			
			<div class="col-10 pt-2">	
				<div id="content">
					<tiles:insertAttribute name="body" />
				</div>
			</div>
			
		</div>
	</div>
</body>

</html>