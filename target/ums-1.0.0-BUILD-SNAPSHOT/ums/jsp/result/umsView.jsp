<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!-- datepicker -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<link rel="stylesheet" type="text/css" href="../resources/css/header.css" />
<link rel="stylesheet" type="text/css" href="../resources/css/section.css" />
<link rel="stylesheet" type="text/css" href="../resources/css/umsView.css" />

<script language="javascript" type="text/javascript" src="../resources/js/send.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<title>전송결과 조회</title>
</head>
<body>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" type="text/css" href="../resources/css/nav.css" />
	<nav>
		<h2>UMS</h2>
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
					<a href="../result/umsView">전송결과 조회</a>
				</div>
				<ul>
					<li>
					<a href="../result/umsViewDetail">전송결과 조회</a>
					</li>
				</ul>
			</li>
		</ul>
	</nav>

	<header>전송결과 조회</header>

	<div class="container-fluid">
		<div class="row form-group">
			<div class="row" id="rows">
				<div class="col-md-12">
					<div class="row">
						<div class="col-md-2">
							<input type="date" id="startDate" class="form-control">
						</div>
						<div class="col-md-2">
							<input type="date" id="endDate" class="form-control">
						</div>
						<div class="col-md-7">
							<div class="col-md-1">
								<select class=”form-control“ style="height:34px; border: 1px solid lightgrey">
									<option value="subject">제목</option>
									<option value="dest_num">발신번호</option>
									<option value="send_type">전송타입</option>
								</select>
							</div>
							
							<div class="col-md-10 ml-2">
								<div class="input-group" style="margin-left: 45px;">
									<input type="text" class="form-control" placeholder="검색 키워드를 입력하세요!">
									<span class="input-group-btn">
										<button class="btn btn-secondary" type="button">찾기</button>
									</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="table-wrapper-scroll-y my-custom-scrollbar">
				<table class="table table-hover table-bordered" id="insertTable">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>요청일시</th>
							<th>전송일시</th>
							<th>발신번호</th>
							<th>전송타입</th>
							<th>전송상태</th>
							<th>총 건수</th>
							<th>성공건수</th>
							<th>실패건수</th>
						</tr>
					</thead>
					<tbody id="my-tbody">
					</tbody>
				</table>
			</div>
		</div>
	</div>
	</div>
	</div>
	<link rel="stylesheet" type="text/css" href="../resources/css/footer.css" />
	<footer>
		<h2>footer영역</h2>
	</footer>
</body>
</html>