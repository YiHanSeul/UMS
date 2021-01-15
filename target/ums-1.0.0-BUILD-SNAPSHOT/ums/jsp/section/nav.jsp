<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../resources/css/nav.css" />
<title>Insert title here</title>
</head>
<body>
	<nav>
	<h2>UMS</h2>
	<div class="col-1">
	<ul id="navi">
		<li class="group">
			<div class="title">메시지 전송</div>
			<ul class="sub">
				<li>
					<a href="../send/send_sms">-SMS</a>
				</li>
				<li>
					<a href="../send/send_mms">-MMS</a>
				</li>
				<li>
					<a href="../send/send_vms">-VMS</a>
				</li>
				<li>
					<a href="../send/send_fms">-FMS</a>
				</li>
			</ul>


		</li>
		<li class="group">
			<div class="title">
				<a class="result" href="../result/umsView">전송결과 조회</a>
			</div>
		</li>
	</ul>
	</div>
	</nav>
</body>
</html>