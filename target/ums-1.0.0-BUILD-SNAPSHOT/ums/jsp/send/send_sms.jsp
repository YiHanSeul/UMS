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
<link rel="stylesheet" type="text/css" href="../resources/css/send.css" />
<script language="javascript" type="text/javascript" src="../resources/js/send.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<title>SMS 전송 테이블</title>
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
			</li>
		</ul>
	</nav>

	<header>메시지 전송 -SMS/LMS</header>

	<%
		String session_id = (String) session.getId();
	%>
	<div class="container-fluid">
		<form>
			<div class="row form-group">
				<div class="row" id="rows">
					<div class="col-md-3">
						<label for="SendNum">발신번호</label>
						<input type="text" class="form-control" id="depart_num" placeholder="번호만 입력하세요">
						<label for="ArrName">이름</label>
						<input type="text" class="form-control" id="dest_name" placeholder="이름을 입력하세요">
						<label for="ArrNum">수신번호</label>
						<input type="text" class="form-control" id="dest_num" placeholder="번호만 입력하세요">
						<br>

						<button type="button" class="btn btn-primary btn-block" id="addBtn" onclick="Add()">추가</button>
						<button type="button" class="btn btn-danger btn-block" id="deleteBtn" onclick="Delete()">삭제</button>

					</div>

					<div class="col-md-8">
						<div class="col-md-3">
							<label for="var1">변수1</label>
							<input type="text" class="form-control" id="var1" placeholder="변수입력">
						</div>

						<div class="col-md-3">
							<label for="var2">변수2</label>
							<input type="text" class="form-control" id="var2" placeholder="변수입력">
						</div>


						<div class="col-md-3">
							<label for="var3">변수3</label>
							<input type="text" class="form-control" id="var3" placeholder="변수입력">
						</div>


						<div class="col-md-3">
							<label for="var4">변수4</label>
							<input type="text" class="form-control" id="var4" placeholder="변수입력">
						</div>
						<div class="col-md-12">
							<div class="table-wrapper-scroll-y my-custom-scrollbar">
								<table class="table table-hover" id="insertTable">
									<thead>
										<tr>
											<th>번호</th>
											<th>이름</th>
											<th>수신번호</th>
											<th>변수1</th>
											<th>변수2</th>
											<th>변수3</th>
											<th>변수4</th>
										</tr>
									</thead>
									<tbody id="my-tbody">
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
		</form>
		<div class="row" id="rows">
			<div class="col-md-3">
				<label for="subject">제목</label>
				<input type="text" class="form-control" id="subject" placeholder="제목을 입력하세요">
				<br>
				<div class="custom-control custom-control-inline">
					<label class="radio-inline">
						<input type="radio" name="sch_type" class="radio-value" id=".radio-value" value="0">
						즉시전송
					</label>
					<label class="radio-inline">
						<input type="radio" name="sch_type" class="radio-value" id=".radio-value" value="1">
						예약전송
					</label>
				</div>
				<div>
					<br>
					<input type="date" id="date" class="form-control">
					<br>
					<div class="md-form md-outline">
						<input type="time" id="time" class="form-control" placeholder="Select time">
					</div>
				</div>

			</div>

			<div class="col-md-8">
				<label for="msg_content">&nbsp &nbsp &nbsp내용</label>
				<textarea class="form-control" id="msg_content" placeholder="내용을 입력하세요"></textarea>

				<button type="button" class="btn btn-primary" id="SendBtn" onclick="Send()">메시지 전송</button>
				<!-- <button type="button" class="btn btn-primary" id="SendBtn" onclick="window.location.reload();">메시지 전송</button> -->

			</div>
		</div>


	</div>
	</div>

	<!-- *******모달******* -->
	<div id="my_modal">
			메시지를 전송 하시겠습니까?<br>
			<!-- <button id="modal_close_btn">닫기</button> -->
			<button type="button" calss="btn btn-primary" id="modal_no_btn">아니요</button>
			<button id="modal_yes_btn">예</button>

		</div>

	<!-- /.modal -->

	<!-- 	<form>
		<div class="form-group">
			<label for="exampleInputEmail1">이메일 주소</label>
			<input type="email" class="form-control" id="exampleInputEmail1" placeholder="이메일을 입력하세요">
		</div>
		<div class="form-group">
			<label for="exampleInputPassword1">암호</label>
			<input type="password" class="form-control" id="exampleInputPassword1" placeholder="암호">
		</div>
		<div class="form-group">
			<label for="exampleInputFile">파일 업로드</label>
			<input type="file" id="exampleInputFile">
			<p class="help-block">여기에 블록레벨 도움말 예제</p>
		</div>
		<div class="checkbox">
			<label>
				<input type="checkbox">
				입력을 기억합니다
			</label>
		</div>
		<button type="submit" class="btn btn-default">제출</button>
	</form> -->


	<link rel="stylesheet" type="text/css" href="../resources/css/footer.css" />
	<footer>
		<h2>footer영역</h2>
	</footer>
</body>
</html>