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
<link rel="stylesheet" type="text/css" href="../resources/css/umsViewResult.css" />
<script language="javascript" type="text/javascript" src="../resources/js/send.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<title>전송결과 세부조회</title>
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
						<a href="../result/umsViewDetail">전송결과 세부조회</a>
					</li>
				</ul>
			</li>
		</ul>
	</nav>

	<header>전송결과 세부조회</header>

	<div class="container-fluid">
		<form>
			<div class="row" id="rows">
				<div class="col-md-3" sytle="margin-left= 10px;">
					<label for="subject">제목</label>
					<input type="text" class="form-control" id="subject">
					<label for="msg_content">내용</label>
					<textarea id="msg_content" name="msg_content" class="form-control"></textarea>
				</div>

				<div class="col-md-3">
					<label for="send_type">전송타입</label>
					<input type="text" class="form-control" id="send_type">

					<label for="dest_num">발신번호</label>
					<input type="text" class="form-control" id="dest_num">

					<label for="now_date">요청일시</label>
					<input type="text" class="form-control" id="now_date">

					<label for="send_date">전송일시</label>
					<input type="text" class="form-control" id="send_date">
				</div>
				<div class="col-md-5">
					<label for="attach_file">첨부파일</label>
					<input type="text" class="form-control" id="attach_file">
				</div>
				<div class="col-md-11">
					<div class="table-wrapper-scroll-y my-custom-scrollbar">
						<table class="table table-hover table-bordered" id="insertTable">
							<thead>
								<tr>
									<th>번호</th>
									<th>이름</th>
									<th>수신번호</th>
									<th>요청일시</th>
									<th>전송일시</th>
									<th>전송상태</th>
									<th>실패사유</th>
								</tr>
							</thead>
							<tbody id="my-tbody">
							</tbody>
						</table>
					</div>
				</div>
			</div>

		</form>

	</div>



	<link rel="stylesheet" type="text/css" href="../resources/css/footer.css" />
	<footer>
		<h2>footer영역</h2>
	</footer>


</body>
</html>