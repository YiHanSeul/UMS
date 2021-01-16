<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
	$(document).ready(function() {
		schSendItems();
		$("#msgContent").keyup(function() {
			var mctemp = $("#msgContent").val();
			if (getByteB(mctemp) > 2000) {
				alert("[!] 글자수는 2000Bytes를 초과할 수 없습니다.")

			}

			if (getByteB(mctemp) > 90) {
				$('#danjang').css('backgroundColor', 'salmon');
				$('#danjang').text('장문');
			} else {
				$('#danjang').css('backgroundColor', 'dodgerblue');
				$('#danjang').text('단문');
			}
			$('#nowdanjang').text(getByteB(mctemp) + '/2000 Bytes');
		});

	});

	function phoneFomatter(num, type) {
		var formatNum = '';
		if (num.length == 11) {
			if (type == 0) {
				formatNum = num.replace(/(\d{3})(\d{4})(\d{4})/, '$1-****-$3');
			} else {
				formatNum = num.replace(/(\d{3})(\d{4})(\d{4})/, '$1-$2-$3');
			}
		} else if (num.length == 8) {
			formatNum = num.replace(/(\d{4})(\d{4})/, '$1-$2');
		} else {
			if (num.indexOf('02') == 0) {
				if (type == 0) {
					formatNum = num.replace(/(\d{2})(\d{4})(\d{4})/, '$1-****-$3');
				} else {
					formatNum = num.replace(/(\d{2})(\d{4})(\d{4})/, '$1-$2-$3');
				}
			} else {
				if (type == 0) {
					formatNum = num.replace(/(\d{3})(\d{3})(\d{4})/, '$1-***-$3');
				} else {
					formatNum = num.replace(/(\d{3})(\d{3})(\d{4})/, '$1-$2-$3');
				}
			}
		}
		return formatNum;
	}

	function schSendItems() {
		$.ajax({
			type : "POST",
			url : '${contextPath}/ums/msgsend/list.json',
			data : $("#sendItemFrm").serialize(),
			success : function(data) {
				var $tbody = $("#receiveList");

				$("#totalCnt").text("총" + data.TOTAL_CNT + "건");
				if (data.TOTAL_CNT > 0) {
					$tbody.html("");
					for (var i = 0; i < data.LIST.length; i++) {
						var $tr = $("<tr />");
						var $tdCol1 = $("<td />");
						var $tdCol2 = $("<td />");
						var $tdCol3 = $("<td />");
						var $tdCol4 = $("<td />");
						var $tdCol5 = $("<td />");
						var $tdCol6 = $("<td />");
						var $tdCol7 = $("<td />");

						$tdCol1.text(i + 1);
						$tdCol2.text(data.LIST[i].DEST_NAME);
						$tdCol3.text(phoneFomatter(data.LIST[i].DEST_NUM, 1));
						$tdCol4.text(data.LIST[i].VAR1);
						$tdCol5.text(data.LIST[i].VAR2);
						$tdCol6.text(data.LIST[i].VAR3);
						$tdCol7.text(data.LIST[i].VAR4);

						$tr.append($tdCol1);
						$tr.append($tdCol2);
						$tr.append($tdCol3);
						$tr.append($tdCol4);
						$tr.append($tdCol5);
						$tr.append($tdCol6);
						$tr.append($tdCol7);

						$tbody.append($tr);
					}
				} else {
					$tbody.html("<tr><td colspan=\"7\" class=\"text-center\">추가 된 수신자가 없습니다.</td></tr>");
				}
			},
			complete : function(data) {

			},
			error : function(request, status, error) {
				alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
				alert("실패");
			}
		});

	}

	function addSendItem() {
		if (confirm("대상자를 추가하시겠습니까?")) {
			$.ajax({
				type : "POST",
				url : '${contextPath}/ums/msgsend/addSendItem.json',
				data : $("#sendItemFrm").serialize(),
				success : function(data) {
					if (data.RESULT_CODE == "1") {
						swal("수신대상이 추가되었습니다.", "총건:1건\n중복건:1건", "success");

						$("#sendItemFrm").find("input").each(function() {
							$(this).val("");
						});
					} else {
						swal("수신대상등록에 실패하였습니다.", "", "danger");
					}
					schSendItems();
				},
				complete : function(data) {

				},
				error : function(request, status, error) {
					alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
				}
			});
		}
	}
	function deleteSendItem() {
		if (confirm("대상자를 전체 삭제하시겠습니까?"))
			$.ajax({
				type : "POST",
				url : '${contextPath}/ums/msgsend/deleteSendItem',
				success : function(data) {
					schSendItems();
				},
				complete : function(data) {

				},
				error : function(request, status, error) {
					alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
				}
			});
	}
	function selectDelteBtn(){ 
		if(confirm("대상자를 선택 삭제하시겠습니까?"))
			$.ajax({
				type : "POST",
				url : '${contextPath}/ums/msgsend/selectDeleteSendItem',
				data: msg_id,
				success : function(data) {
					schSendItems();
				},
				complete : function(data) {

				},
				error : function(request, status, error) {
					alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
				}
			});
			
	}
	function send() {
		var msgCnt = $('#receiveList tr').last().find("td").eq(0).text();
		var schType = $("input[name='radio']:checked").val();
		if (schType) {
			var cvsDateAry = $("#Date").val().split("-");
			var cvsDate = cvsDateAry[0]+cvsDateAry[1]+cvsDateAry[2];
			var cvsTimeAry = $("#Time").val().split(":");
			cvsDate += cvsTimeAry[0]; cvsDate += cvsTimeAry[1]; cvsDate += "00";
			console.log($("#subject").val());
			console.log($("#msgContent").val());
			console.log($("#departNum").val());
			console.log($('#radio-value:checked').val());
			console.log("CVSDATE = " + cvsDate);			
			console.log(msgCnt);
			console.log(schType);
			if (confirm("메시지를 전송하시 겠습니까?")) {

				var send = {

					subject : $("#subject").val(),
					msgContent : $("#msgContent").val(),
					departNum : $("#departNum").val(),
					schType : schType,
					sendDate : cvsDate,
					msgCnt : msgCnt
				}
				$.ajax({
					type : "POST",
					url : '${contextPath}/ums/msgsend/send.json',
					data : send,
					success : function(data) {
						if (data.RESULT_CODE == "1") {
							swal("메시지 전송이 완료되었습니다.", "success");
							$("#sendMsgFrm").find("input").each(function() {
								$(this).val("");
							});
						} else {
							swal("메시지 전송을 실패했습니다. ", "danger");
						}
						schSendItems();
					},
					comlete : function(data) {

					},
					error : function(request, status, error) {
						alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
						alert("문자 전송 실패");
					}
				});
			}

		} else {
			alert("[!] 전송타입을 체크해주세요.")

		}

	}
	function radioNow() {
		$('#Time').val(''); // 입력된 과일 종류 값이 있으면, 초기화합니다.
		$('#Time').attr('disabled', true); // 과일 종류를
		// 입력하는
		// input 을
		// 비활성화합니다.
		$('#Date').val('');
		$('#Date').attr('disabled', true);

	}
	function radioSend() {
		$('#Time').attr('disabled', false); // 과일 종류를
		// 입력하는
		// input 을
		// 활성화합니다.
		$('#Time').focus(); // 과일 종류를 입력하는 input 에 커서를
		// 이동시킵니다.
		$('#Date').attr('disabled', false);
		$('#Date').focus();
	}
	function getByteB(str) {

		var byte = 0;

		for (var i = 0; i < str.length; ++i) {

			// 기본 한글 2바이트 처리

			(str.charCodeAt(i) > 127) ? byte += 2 : byte++;

		}

		return byte;

	}
</script>
<p class="headerId">SMS</p>
<div class="row" id="sendT">
	<div class="col-lg-4">
		<div class="row">
			<h5 class="title-font">
				<i class="fa fa-envelope-open" aria-hidden="true"></i> 메시지작성
			</h5>
			<div class="col-12">
				<label>메시지제목</label>
				<input id="subject" type="text" class="form-control" name="subject" />
				<label>전송메시지</label>
				<textarea id="msgContent" class="form-control pb-2" rows="10" placeholder="문자 내용을 입력해주세요. (90Bytes 초과시 LMS로 전환)"></textarea>
				<div>
					<div id="danjang">단문</div>
					<div id="nowdanjang">0/2000 Bytes</div>
				</div>
				<label id="callnum">발신번호</label>
				<input id="departNum" type="text" class="form-control" id="depart_num" maxlength="13" />

				<div id="divradio" class="pt-1">
					<label>
						<input type="radio" name="radio" id="radio1" class="radio" value="0" onclick="radioNow()">
						즉시 전송
					</label>
					<label>
						<input type="radio" name="radio" id="radio2" class="radio" value="1" onclick="radioSend()">
						예약 전송
					</label>
				</div>
				<div class="pt-1">
					<input type='date' id='Date' style="margin-left: 40px;" />
					<input type='time' id='Time' style="margin-left: 30px;" />
				</div>
				<div class="pt-3">
					<button type="button" class="btn btn-primary btn-block btn-lg" onclick="send()">메시지 전송</button>
				</div>
			</div>
		</div>
	</div>
	<div class="col-lg-8">
		<div class="row">
			<div class="col-12">
				<h5 class="title-font">
					<i class="fa fa-user-plus" aria-hidden="true"></i> 수신자 추가
				</h5>
				<form id="sendItemFrm" name="sendItemFrm" method="post">
					<div class="row">
						<div class="col-lg-6">
							<label>이름</label>
							<input type="text" name="destNm" class="form-control" />
						</div>
						<div class="col-lg-6">
							<label>수신번호</label>
							<input type="text" name="destNum" class="form-control" />
						</div>
					</div>
					<div class="row">
						<div class="col-lg-6">
							<label>변수1</label>
							<input type="text" name="var1" class="form-control" />
						</div>
						<div class="col-lg-6">
							<label>변수2</label>
							<input type="text" name="var2" class="form-control" />
						</div>
					</div>
					<div class="row">
						<div class="col-lg-6">
							<label>변수3</label>
							<input type="text" name="var3" class="form-control" />
						</div>
						<div class="col-lg-6">
							<label>변수4</label>
							<input type="text" name="var4" class="form-control" />
						</div>
					</div>
				</form>
				<div class="row pt-3">
					<div class="col-12 text-right">
						<div class="btn-group">
							<button id="addBtn" type="button" class="btn btn-primary btn-lg mr-1" onclick="addSendItem()">대상자 추가</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-12">
				<h5 class="mt-5 title-font">
					<i class="fa fa-users" aria-hidden="true"></i> 수신자 목록
				</h5>
				<span id="totalCnt" style="font-size: 14px; font-weight: bold">총0건</span>
				<table class="table table-boredered table-hover text-center">
					<colgroup>
						<col style="width: 80px;" />
						<col style="width: 100px;" />
						<col style="width: 100px;" />
						<col style="width: 100px;" />
						<col style="width: 100px;" />
						<col style="width: 100px;" />
						<col style="width: 100px;" />
						<col style="width: 17px;" />
					</colgroup>
					<thead>
						<tr>
							<th class="title">No.</th>
							<th class="title">이름</th>
							<th class="title">수신번호</th>
							<th class="title">변수1</th>
							<th class="title">변수2</th>
							<th class="title">변수3</th>
							<th class="title">변수4</th>
						</tr>
					</thead>
					<tbody id="receiveList">
						<tr>
							<td colspan="7" class="text-center">추가 된 수신자가 없습니다.</td>
						</tr>
					</tbody>
				</table>
				<div class="col-12 text-right">
					<div class="btn-group">
						<button id="selectDelteBtn" type="button" class="btn btn-primary btn-lg mr-1" onclick="selectDelteBtn()">수신자 선택 삭제</button>
					</div>
					<div class="btn-group">
						<button id="delteBtn" type="button" class="btn btn-primary btn-lg mr-1" onclick="deleteSendItem()">수신자 전체 삭제</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
