<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
	var msgid = 0;
	var splittemp;
	var sendType;
	$(document).ready(function() {
		schReportItems();
	
		$("#sendTypeSelect").change(function(){
			sendType=$(this).children("option:selected").val();
			alert(sendType);
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

	function schReportItems() {
		$.ajax({
			type : 'POST',
			url : '${contextPath}/ums/msgreport/reportList.json',
			success : function(data) {
				var $tbody = $("#sendlist");

				$("#msgCnt").text("총" + data.MSG_CNT + "건");
				if (data.MSG_CNT > 0) {
					$tbody.html("");
					var datesort = [];
					for (var i = 0; i < data.LISTS.length; i++) {
						datesort[i] = {
							number: i,
							time: parseInt(data.LISTS[i].senddate)
						}
					}

					datesort.sort(function (a, b) {  //정렬하는거 
						return a.time < b.time ? -1 : a.time > b.time ? 1 : 0;  
					});

					
					 for (var i = 0; i < data.LISTS.length; i++) {
						var lmmtemp = data.LISTS.length-1-i;
						var $tr = $("<tr id='trset_"+data.LISTS[datesort[lmmtemp]['number']].msgid+"'/>");
						var $tdCol1 = $("<td />");
						var $tdCol2 = $("<td />");
						var $tdCol3 = $("<td />");
						var $tdCol4 = $("<td />");
						var $tdCol5 = $("<td />");
						var $tdCol6 = $("<td />");
						var $tdCol7 = $("<td />");
						var $tdCol8 = $("<td />");
						var $tdCol9 = $("<td />");
						$tdCol1.text(lmmtemp+1);
						$tdCol2.text(data.LISTS[datesort[lmmtemp]['number']].subject);
						if (data.LISTS[i].schtype == 0) {
							$tdCol3.text('즉시전송');
						} else {
							$tdCol3.text('예약전송');
						}
						var prettydate = "";
						prettydate += data.LISTS[datesort[lmmtemp]['number']].senddate.substring(0, 4) + "-";
						prettydate += data.LISTS[datesort[lmmtemp]['number']].senddate.substring(4, 6) + "-";
						prettydate += data.LISTS[datesort[lmmtemp]['number']].senddate.substring(6, 8) + " ";
						prettydate += data.LISTS[datesort[lmmtemp]['number']].senddate.substring(8, 10) + ":";
						prettydate += data.LISTS[datesort[lmmtemp]['number']].senddate.substring(10, 12) + ":";
						prettydate += data.LISTS[datesort[lmmtemp]['number']].senddate.substring(12, 14);
						$tdCol4.text(prettydate);
						$tdCol5.text(phoneFomatter(data.LISTS[datesort[lmmtemp]['number']].departnum, 1));

						$tdCol6.text(data.LISTS[datesort[lmmtemp]['number']].sendtype);
						$tdCol7.text(data.LISTS[datesort[lmmtemp]['number']].msgcnt);
						$tdCol8.text(data.LISTS[datesort[lmmtemp]['number']].succcnt);
						$tdCol9.text(data.LISTS[datesort[lmmtemp]['number']].failcnt);

						$tr.append($tdCol1);
						$tr.append($tdCol2);
						$tr.append($tdCol3);
						$tr.append($tdCol4);	
						$tr.append($tdCol5);
						$tr.append($tdCol6);
						$tr.append($tdCol7);
						$tr.append($tdCol8);
						$tr.append($tdCol9);
						$tbody.append($tr);
 
					} 
				} else {
					$tbody.html("<tr><td colspan=\"9\" class=\"text-center\">발송된 메시지가  없습니다.</td></tr>");

				}

			},
			complete : function(data) {

			},
			error : function(request, status, error) {
				alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
			}
		});
	}
	
	//여기는 바로 상세페이지로 들어가는게 필요할것같음
	$(document).on('click', '#sendlist tr', function() {
		msgid = $(this).attr('id') + "";
		splittemp = msgid.split('trset_');
		$(".detailViewIn").css("display", "block");
		destSelectItems();

		/*window.location.href="/ums/msgreport/reportDetailView?msgid=" + (parseInt(splittemp[1]));*/

	});
	function destSelectItems() {

		//var dsitemp = window.location.href.split('msgid=')
		//var msgid =  parseInt(dsitemp[1]);
		//alert(msgid);
		
		var data = {
			msgid : parseInt(splittemp[1])
		};
		
		$.ajax({
			type : 'POST',
			data : data,
			url : '${contextPath}/ums/msgreport/reportDetailList.json',
			success : function(data) {
				//alert(data.SENDLISTS.length);
				var $tbody = $("#destlist");
				$("#destCnt").text("총" + data.DEST_CNT + "명");
				if (data.DEST_CNT > 0) {
					$tbody.html("");
					$("#subject").val(data.SENDLISTS[0].subject);
					$("#msg_content").val(data.SENDLISTS[0].msgcontent);
					$("#send_type").val(data.SENDLISTS[0].sendtype);
					$("#dest_num").val(phoneFomatter(data.SENDLISTS[0].departnum,1));		

					var looptime = eval("data.LISTS" + data.SENDLISTS[0].sendtype + ".length");
					for (var i = 0; i < looptime; i++) {
						var $tr = $("<tr />");
						var $tdCol1 = $("<td />");
						var $tdCol2 = $("<td />");
						var $tdCol3 = $("<td />");
						var $tdCol4 = $("<td />");
						var $tdCol5 = $("<td />");
						var $tdCol6 = $("<td />");

						$tdCol1.text(i+1);
						$tdCol2.text(eval("data.LISTS" + data.SENDLISTS[0].sendtype + "["+ i + "].dest_name"));
						pfnum = eval("data.LISTS" + data.SENDLISTS[0].sendtype + "["+ i + "].phone_number");
						$tdCol3.text(phoneFomatter(pfnum,1));
						var prettydate = "";
						prettydate += eval("data.LISTS" + data.SENDLISTS[0].sendtype + "["+ i + "].send_date.substring(0, 4)") + "-";
						prettydate += eval("data.LISTS" + data.SENDLISTS[0].sendtype + "["+ i + "].send_date.substring(4, 6)") + "-";
						prettydate += eval("data.LISTS" + data.SENDLISTS[0].sendtype + "["+ i + "].send_date.substring(6, 8)") + " ";
						prettydate += eval("data.LISTS" + data.SENDLISTS[0].sendtype + "["+ i + "].send_date.substring(8, 10)") + ":";
						prettydate += eval("data.LISTS" + data.SENDLISTS[0].sendtype + "["+ i + "].send_date.substring(10, 12)") + ":";
						prettydate += eval("data.LISTS" + data.SENDLISTS[0].sendtype + "["+ i + "].send_date.substring(12, 14)");
						$tdCol4.text(prettydate);
						
						
						
						if (eval("data.LISTS" + data.SENDLISTS[0].sendtype + "["+ i + "].succ_count") == 1) {
							$tdCol5.text("성공");
						} else {
							$tdCol5.text("실패");
						}

						if (eval("data.LISTS" + data.SENDLISTS[0].sendtype + "["+ i + "].fail_count") == 1) {
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
						

						var prettydate1 = "";
						prettydate1 += data.SENDLISTS[i].nowdate.substring(0, 4) + "-";
						prettydate1 += data.SENDLISTS[i].nowdate.substring(4, 6) + "-";
						prettydate1 += data.SENDLISTS[i].nowdate.substring(6, 8) + " ";
						prettydate1 += data.SENDLISTS[i].nowdate.substring(8, 10) + ":";
						prettydate1 += data.SENDLISTS[i].nowdate.substring(10, 12) + ":";
						prettydate1 += data.SENDLISTS[i].nowdate.substring(12, 14);
						$("#now_date").val(prettydate1);
						var prettydate2 = "";
						prettydate2 += data.SENDLISTS[i].senddate.substring(0, 4) + "-";
						prettydate2 += data.SENDLISTS[i].senddate.substring(4, 6) + "-";
						prettydate2 += data.SENDLISTS[i].senddate.substring(6, 8) + " ";
						prettydate2 += data.SENDLISTS[i].senddate.substring(8, 10) + ":";
						prettydate2 += data.SENDLISTS[i].senddate.substring(10, 12) + ":";
						prettydate2 += data.SENDLISTS[i].senddate.substring(12, 14);
						
						$("#send_date").val(prettydate2);
						$("#attach_file").val(data.SENDLISTS[i].attachfile);
						
					}
				} else {
					$tbody.html("<tr><td colspan=\"7\" class=\"text-center\">전송한 메시지 수신자가 없습니다.</td></tr>");
				}
			}

		});
	}
	function sendSelectItems(){
		var data = {
				msgid : parseInt(splittemp[1])
			};
		$.ajax({
			type : 'POST',
			data : data,
			url : '${contextPath}/ums/msgreport/reportDetailSend.json',
			success : function(data) {
				
			},
		});
	}
	function search(){
		var data = {
				sendtype : sendType
			};
		$.ajax({
			type : 'POST',
			data: data,
			url : '${contextPath}/ums/msgreport/sendTypeSearch.json',
			success:function(data){
				alert("성공");
				
			},error : function(request, status, error) {
				alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
			}
		});
	}
</script>
<div class="detailView">
	<div class="row">
		<div class="col-lg-12">
			<h5 class="title-font">
				<i class="fa fa-envelope-o" aria-hidden="true"></i> 전송결과 조회
			</h5>
		</div>
		<div class="col-lg-4 pt-2">
			<div class="row">
				<div class="col-6">
					<label>
						<i class="fa fa-calendar-o title-font" aria-hidden="true"> </i> 전송기간(시작)
					</label>
					<input type="date" id="startDate" class="form-control">
				</div>
				<div class="col-6">
					<label>
						<i class="fa fa-calendar-o title-font" aria-hidden="true"></i> 전송기간(종료)
					</label>
					<input type="date" id="endDate" class="form-control">
				</div>
			</div>
		</div>
		<div class="col-lg-8 pt-2"></div>
		<div class="col-lg-4 pt-2">
			<div class="row">
				<div class="col-6 ">
					<label>
						<i class="fa fa-commenting-o title-font" aria-hidden="true"></i> 메시지 유형
					</label>
					<select class="form-control" id="sendTypeSelect">
						<option value="SMS">SMS</option>
						<option value="MMS">MMS</option>
						<option value="VMS">VMS</option>
						<option value="FMS">FMS</option>
					</select>
				</div>
				<div class="col-6">
					<label>
						<i class="fa fa-clock-o title-font" aria-hidden="true"></i> 예약전송 유무
					</label>
					<select class="form-control">
						<option>즉시전송</option>
						<option>예약전송</option>
					</select>
				</div>
			</div>
		</div>
		<div class="col-lg-8 pt-2">
			<div class="row">
				<div class="col-lg-6">
					<label>
						<i class="fa fa-search title-font" aria-hidden="true"></i> 검색
					</label>
					<div class="row">
						<div class="col-12">
							<div class="input-group">
								<div class="input-group-btn search-panel">
									<select class="form-control">
										<option>제목</option>
										<option>이름</option>
										<option>발신번호</option>
									</select>
								</div>
								<input type="text" class="form-control" placeholder="검색 키워드를 입력하세요!">
								<span class="input-group-btn">
									<button class="btn btn-primary" type="button" onclick="search()">찾기</button>
								</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-lg-12 pt-2">
			<div class="row">
				<div class="col-12">
					<span id="msgCnt" style="font-size: 14px; font-weight: bold">총0건</span>
					<table class="table table-boredered table-hover">
						<colgroup>
							<col style="width: 50px;" />
							<col style="width: 150px;" />
							<col style="width: 70px;" />
							<col style="width: 100px;" />
							<col style="width: 80px;" />
							<col style="width: 80px;" />
							<col style="width: 50px;" />
							<col style="width: 50px;" />
							<col style="width: 50px;" />
						</colgroup>
						<thead>

							<tr>
								<th class="title">No.</th>
								<th class="title">제목</th>
								<th class="title">요청타입</th>
								<th class="title">전송일시</th>
								<th class="title">발신번호</th>
								<th class="title">전송타입</th>
								<th class="title">총건수</th>
								<th class="title">성공건수</th>
								<th class="title">실패건수</th>
							</tr>
						</thead>
						<tbody id="sendlist">
							<tr>
								<td colspan="9" align="center" class="text-center">발송된 문자가 없습니다.</td>
							</tr>
						</tbody>
					</table>

				</div>
			</div>
		</div>
	</div>
</div>
<div class="detailViewIn">
	<div class="row" id="detailViewIn1">
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
		<div class="col-lg-12 float-right">
			<input class="btn btn-primary float-right" type="button" onclick="$('.detailViewIn').css('display','none')" value="닫기" />
		</div>
	</div>
</div>
