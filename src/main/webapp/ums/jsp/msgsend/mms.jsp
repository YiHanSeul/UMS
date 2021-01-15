<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
$(document).ready(function() {
	schSendItems();
});
var filename;
var fuindex = 0;
$(document).ready(function(){
	$("#fileInput").on('change',function(){
		if(window.FileReader){
			filename=$(this)[0].files[0].name;
		}else{
			filename=$(this).val().split('/').pop().split('\\').pop();//파일명만 추출
			
		}
		$("#userfile").val(filename);
	});
	$('#fileInput').on('change',readInputFile);
});
function readInputFile(e){
	
    var sel_files = [];
    
    sel_files = [];
    //$('#imagePreview').empty();
    
    var files = e.target.files;
    var fileArr = Array.prototype.slice.call(files);
    
    
    fileArr.forEach(function(f){
    	if(filename.indexOf('.png') == -1){
        	alert("[!] PNG확장자 파일만 업로드 가능 합니다.");
            return;
        };
        if(files.length < 4){
        	sel_files.push(f);
            var reader = new FileReader();
            $('#imgPreviewCell').css('display','block');
            reader.onload = function(e){
            	if ( fuindex < 3 ) {
                    $('#imgPreviewCell').append("<img class='imgPreview' src='" + e.target.result +"' />" )
                    fuindex++;            		
            	} else {
            		alert("[!]최대 3장까지 업로드 할 수 있습니다.");
            	}

            };
            reader.readAsDataURL(f);
        }
    })
    if(files.length > 4){
    	alert("[!]최대 3장까지 업로드 할 수 있습니다.");
    }
}

/*여기까지 파일 업로드 */
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
	function deleteSendItem(){
		if(confirm("대상자를 전체 삭제하시겠습니까?"))
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


</script>
<p class="headerId">MMS</p>
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
				<div id="imgPreviewCell">
				</div>
				<textarea id="msgContent" class="form-control pb-2" rows="10" placeholder="문자 내용을 입력해주세요. (90Bytes 초과시 LMS로 전환)"></textarea>
				<div>
					<div id="danjang">단문</div>	
					<div id="nowdanjang">0/2000 Bytes</div>			
				</div>
				<div class="form-group">
					<label for="InputSubject1">파일첨부</label>
					<input id="fileInput" multiple filestyle="" type="file" data-calss-button="btn btn-default" data-class-input="form-control" data-button-text=""
					data-icon-name="fa fa-upload" class="form-control" tabindex="-1" style="position:absolute; clip:rect(0px 0px 0px 0px);">
					<div class="bootstrap-filestyle input-group">
						<input type="text" id="userfile" class="form-control" name="userfile" disabled="">
						<span class="group-span-filestyle input-group-btn" tabindex="0">
							<label for="fileInput" class="btn btn-default">
								<span class="glyphicon fa fa-upload"></span>
							</label>
						</span>
					</div>
				</div>
				<!-- <input type="file" class="form-control-file" id="attach_file"/> -->
				<label>발신번호</label>
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
				<table class="table table-boredered table-hover">
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
						<button id="delteBtn" type="button" class="btn btn-primary btn-lg mr-1" onclick="deleteSendItem()">수신자 전체 삭제</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
