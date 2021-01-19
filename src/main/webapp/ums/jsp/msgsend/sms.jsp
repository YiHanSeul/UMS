<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
	var ListCheck = false;
	var ListSelCnt = 0;
	var delAllList;
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
	$(document).on('click', '#receiveList tr', function() {
		//alert($(this).css("backgroundColor"));
		if (ListCheck) {
			if ($(this).css("backgroundColor") == "rgb(255, 117, 117)") {
				$(this).css("backgroundColor","#ffffff");
				ListSelCnt--;
				ListSelCntRf()
				
				
			}else {
				$(this).css("backgroundColor","#ff7575");
				ListSelCnt++;
				ListSelCntRf()
			}
			
			//UserID = $(this).attr('id').split("_");
			
		}

	});	
	function ListSelCntRf(){
		var strtemp= $("#totalCnt").text().split('  [');
		$("#totalCnt").text(strtemp[0]+"  [ "+ ListSelCnt +"명 선택됨 ]");			
	}

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
				$("#totalCnt").text("총" + data.TOTAL_CNT + "명");
				if (data.TOTAL_CNT > 0) {
					$tbody.html("");
					for (var i = 0; i < data.LIST.length; i++) {
						var $tr = $("<tr id='UserID_" + data.LIST[i].MSG_ID +"'/>");
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
			sameFlag = true;
			for ( j = 0 ; j < $('#receiveList').children().length ; j++) {
    		    if (phoneFomatter($("#NumSameChk").val(),1) == $("#receiveList tr:eq("+j+") td:eq(2)").text()) {
    		    	swal("수신대상등록에 실패하였습니다.", "등록하려는 번호가 이미\n존재하고 있습니다", "error");
    		    	sameFlag = false;
    		    	break;
    		    }
    		}
			//parseInt(String ,)
			console.log("타입은  : " +isNaN($("#NumSameChk").val()));
			if(isNaN($("#NumSameChk").val())==true){
				swal("수신대상등록에 실패하였습니다.", "숫자를 입력해주세요", "error");
			}else{
				if (sameFlag) {
					$.ajax({
						type : "POST",
						url : '${contextPath}/ums/msgsend/addSendItem.json',
						data : $("#sendItemFrm").serialize(),
						success : function(data) {
							if (data.RESULT_CODE == "1") {
								
								swal("수신자가 추가되었습니다.", "성공", "success");
	
								$("#sendItemFrm").find("input").each(function() {
									$(this).val("");
								});
							} else {
								swal("수신대상등록에 실패하였습니다.", "", "warning");
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
		}
	}
	function deleteSendItem() {
		delAllList = [];
		var loopcnt = 0;
    	for ( j = 0 ; j < $('#receiveList').children().length ; j++) {
    		    delAllList[j] = $("#receiveList tr:eq("+j+")").attr('id').split('_')[1];
    		    //$("#receiveList tr:eq("+j+")").attr('id')
    		    /* $("#receiveList").children(":eq("+j+")").attr('id').split('_')[1]; */
    		    loopcnt++;
    		    $("#receiveList tr:eq("+j+") td:eq(0)").attr('id')
    		}
	
		swal({
		    title: "전체 수신자 삭제",
		    text: "전체(" + loopcnt +"명)\n수신자를 삭제 하시겠습니까?",
		    icon: "warning",
		    buttons: ["아니오", "예"]
		}).then((YES) => {
		    if (YES) {
		    	//var dataList = $('#receiveList tr').css("backgroundColor","#ffffff");
				$.ajax({
					
					type : "POST",
					url : '${contextPath}/ums/msgsend/selectDeleteSendItem',
					data: {
						'data' : delAllList
					},
					traditional : true,
					success : function(data) {
						schSendItems();
						swal("수신자가 전체 삭제되었습니다", "", "success");
					},
					complete : function(data) {

					},
					error : function(request, status, error) {
						alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
					}
				});	
	    	
		    }else{

		    }
		});			
	}
	function selectDelteBtn(){ 
		if (ListCheck) {
			if (ListSelCnt < 1) {
				swal("수신자 삭제 실패.", "삭제할 수신자가 선택되지 않았습니다.", 'warning');
				$('#receiveList tr').css("backgroundColor","#ffffff");
				var strtemp= $("#totalCnt").text().split('  [');
				$("#totalCnt").text(strtemp[0]);	
				$("#selectDelteBtn").text("삭제할 수신자 선택");		
				ListSelCnt=0;
				ListCheck=false;
			} else {
				swal({
				    title: "선택 수신자 삭제",
				    text: "선택된" + ListSelCnt +"명의\n수신자를 삭제 하시겠습니까?",
				    icon: "warning",
				    buttons: ["아니요", "예"]
				}).then((YES) => {
				    if (YES) {
				    	ListCheck = false;
				    	ListSelCnt=0;
				    	//var dataList = $('#receiveList tr').css("backgroundColor","#ffffff");
				    	var loopcnt = 0;
				    	var dellist= [];
				    	for ( i = 0 ; i < $('#receiveList').children().length ; i++) {
				    		if ($("#receiveList").children(":eq("+i+")").css('backgroundColor') =="rgb(255, 117, 117)") {
				    			console.log($("#receiveList").children(":eq("+i+")").attr('id'));
				    			dellist[loopcnt] = $("#receiveList").children(":eq("+i+")").attr('id').split('_')[1];
				    			loopcnt++;
				    		}
				    	}
						$.ajax({
							type : "POST",
							url : '${contextPath}/ums/msgsend/selectDeleteSendItem',
							data: {
								'data' : dellist
							},
							traditional : true, //ajax에서 배열의 값을 넘겨줄때 사용
							success : function(data) {
								schSendItems();
								swal("선택한 수신자 삭제", "선택한 "+loopcnt+"명의 수신자\n삭제가 완료 되었습니다", "success");
							},
							error : function(request, status, error) {
								alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
							}
						});
				    }else{
						ListCheck = false;
						ListSelCnt=0;
						$('#receiveList tr').css("backgroundColor","#ffffff");
						var strtemp= $("#totalCnt").text().split('  [');
						$("#totalCnt").text(strtemp[0]);	
						$("#selectDelteBtn").text("삭제할 수신자 선택");	
				    }
				});							
			}
		}else {
			ListCheck = true;
			ListSelCnt=0;
			var strtemp = $("#totalCnt").text();
			$("#totalCnt").text(strtemp+"  [ 0명 선택됨 ]");
			$("#selectDelteBtn").text("클릭시 삭제 혹은 취소");			
		}
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
			swal("전송 타입을 체크해주세요", "즉시/예약", "error");
		}
	}
	function radioNow() {
		$('#Time').val(''); // 입력된 과일 종류 값이 있으면, 초기화합니다.
		$('#Time').attr('disabled', true); // 과일 종류를
		$('#Date').val('');
		$('#Date').attr('disabled', true);
	}
	function radioSend() {
		$('#Time').attr('disabled', false); // 과일 종류를
		$('#Time').focus(); // 과일 종류를 입력하는 input 에 커서를
		$('#Date').attr('disabled', false);
		$('#Date').focus();
	}
	function getByteB(str) {
		var byte = 0;
		for (var i = 0; i < str.length; ++i) {
			(str.charCodeAt(i) > 127) ? byte += 2 : byte++;
		}
		return byte;
	}
	$(document).on('click', '#indiviAdd option', function() {
		
		$("#msgContent").text("$TEXT$");
				
				
		

	});	
	
	function indiviAdd(){
		$("#indiviAdd option").click(function(){
			alert($("#indiviAdd option:selected").val());
		})
	}
</script>
<p class="headerId">SMS</p>
<div class="row" id="sendT">
	<div class="col-lg-4">
		<div class="row">
			<h5 class="title-font">
				<i class="fa fa-envelope-open" aria-hidden="true"></i> 메시지작성
			</h5>
			<div class="col-12" id="msg">
				<label>메시지제목</label>
				<input id="subject" type="text" class="form-control" name="subject" />
				<label>전송메시지</label>
				<textarea id="msgContent" class="form-control pb-2" rows="10" placeholder="문자 내용을 입력해주세요. (90Bytes 초과시 LMS로 전환)"></textarea>
				<div>
					<div id="danjang">단문</div>
					<div id="nowdanjang">0/2000 Bytes</div>
				</div>
				<div class="pt-3"></div>
				<label>개별메시지 선택</label>
				<select class="form-control" id="indiviAdd">
					<option value="1">이름</option>
					<option value="2">개별메시지1</option>
					<option value="3">개별메시지2</option>
					<option value="4">개별메시지3</option>
				</select>
				<label id="callnum">발신번호</label>
				<input id="departNum" type="text" class="form-control" id="depart_num" maxlength="13" />

				<div id="divradio" class="pt-1 text-center">
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
							<input type="text" name="destNum" class="form-control" id="NumSameChk" />
						</div>
					</div>
					<div class="row">
						<div class="col-lg-6">
							<label>이름</label>
							<input type="text" name="var1" class="form-control" />
						</div>
						<div class="col-lg-6">
							<label>개별메시지1</label>
							<input type="text" name="var2" class="form-control" />
						</div>
					</div>
					<div class="row">
						<div class="col-lg-6">
							<label>개별메시지2</label>
							<input type="text" name="var3" class="form-control" />
						</div>
						<div class="col-lg-6">
							<label>개별메시지3</label>
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
						<button id="selectDelteBtn" type="button" class="btn btn-primary btn-lg mr-1" onclick="selectDelteBtn()">삭제할 수신자 선택</button>
					</div>
					<div class="btn-group">
						<button id="delteBtn" type="button" class="btn btn-primary btn-lg mr-1" onclick="deleteSendItem()">수신자 전체 삭제</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
