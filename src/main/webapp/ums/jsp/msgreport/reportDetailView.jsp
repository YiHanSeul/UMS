<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
	var msgid = null;
	$(document).ready(function() {
		//메시지 발송 내역 정보
		//sendSelectItems();
		//개인별 수신자 정보
		msgid = "${msgid}"
		//alert(msgid);
		destSelectItems();

	});
	function destSelectItems() {

		//var dsitemp = window.location.href.split('msgid=')
		//var msgid =  parseInt(dsitemp[1]);
		//alert(msgid);

		var data = {
			msgid : $('#msgid').val()

		};
		$.ajax({
			type : 'POST',
			data : data,
			url : '${contextPath}/ums/msgreport/reportDetailList.json',
			success : function(data) {
				alert("성공");
				var $tbody = $("#destlist");

				$("#destCnt").text("총" + data.DEST_CNT + "명");
				if (data.DEST_CNT > 0) {
					$tbody.html("");

					for (var i = 0; i < data.LISTS.length; i++) {
						var $tr = $("<tr />");
						var $tdCol1 = $("<td />");
						var $tdCol2 = $("<td />");
						var $tdCol3 = $("<td />");
						var $tdCol4 = $("<td />");
						var $tdCol5 = $("<td />");
						var $tdCol6 = $("<td />");

						$tdCol1.text(i + 1);
						$tdCol2.text(data.LISTS[i].dest_name);
						$tdCol3.text(data.LISTS[i].phone_number);
						$tdCol4.text(data.LISTS[i].send_date);
						if (data.LISTS[i].succ_count == 1) {
							$tdCol5.text("성공");
						} else {
							$tdCol5.text("실패");
						}

						if (data.LISTS[i].fail_count == 1) {
							$tdCol6.text("실패사유 ");
						} else {
							$tdCol6.text("");
						}
						$tr.append($tdCol1);
						$tr.append($tdCol2);
						$tr.append($tdCol3);
						$tr.append($tdCol4);
						$tr.append($tdCol5);
						$tr.append($tdCol6);

						$tbody.append($tr);
					}
				} else {
					$tbody.html("<tr><td colspan=\"7\" class=\"text-center\">전송한 메시지 수신자가 없습니다.</td></tr>");
				}

			},
			error : function(request, status, error) {
				alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
			}
		});
	}
	/* model에 담긴 값을 jsp에 ㅃ홉기
	
	"            scirpt */
	/* function sendSelectItems(){
	 	var dsitemp = window.location.href.split('msgid=')
		var msgid = dsitemp[1];
	 	alert(msgid);
	 	$.ajax({
	 		type:'POST',
	 		data: msgid,
	 		url:'${contextPath}/ums/msgreport/reportDeatilSend.json',
	 	});
	} */
</script>
<div class="row">
	<div class="col-lg-12">
		<h5 class="title-font">
			<i class="fa fa-address-card-o" aria-hidden="true"></i> 전송결과 세부조회
		</h5>
		<input id="msgid" type="hidden" value="${msgid}" readonly>
	</div>
	<div class="col-lg-4">
		<div class="row">
			<div class="col-12">
				<label for="subject">제목</label>
				<input type="text" class="form-control" id="subject" readonly>
				<label for="msg_content">내용</label>
				<textarea id="msg_content" name="msg_content" class="form-control" readonly></textarea>
			</div>
		</div>
	</div>

	<div class="col-lg-3">
		<div class="row">
			<div class="col-12">
				<label for="send_type">전송타입</label>
				<input type="text" class="form-control" id="send_type" readonly>
				<label for="dest_num">발신번호</label>
				<input type="text" class="form-control" id="dest_num" readonly>

				<label for="now_date">요청일시</label>
				<input type="text" class="form-control" id="now_date" readonly>

				<label for="send_date">전송일시</label>
				<input type="text" class="form-control" id="send_date" readonly>
			</div>
		</div>
	</div>

	<div class="col-lg-4">
		<div class="row">
			<div class="col-12">
				<label for="attach_file">첨부파일</label>
				<input type="text" class="form-control" id="attach_file" readonly>
			</div>
		</div>
	</div>
	<div class="col-lg-12 pt-2">
		<div class="row">
			<div class="col-12">
				<span id="destCnt" style="font-size: 14px; font-weight: bold">총0명</span>
				<table class="table table-boredered table-hover">
					<colgroup>
						<col style="width: 30px;" />
						<col style="width: 150px;" />
						<col style="width: 70px;" />
						<col style="width: 100px;" />
						<col style="width: 70px;" />
						<col style="width: 150px;" />
					</colgroup>
					<thead>

						<tr>
							<th class="title">No.</th>
							<th class="title">이름</th>
							<th class="title">전화번호</th>
							<th class="title">전송시간</th>
							<th class="title">전송결과</th>
							<th class="title">실패사유</th>
						</tr>
					</thead>
					<tbody id="destlist">
						<tr>
							<td class="text-center" colspan="9">수신자가 없습니다.</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
