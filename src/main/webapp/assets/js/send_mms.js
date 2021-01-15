function Add() {
	// 1. table객체 찾기
	var my_tbody = document.getElementById('my-tbody');
	var trCnt = $('#insertTable tr').length;
	console.log($('#my-tbody tr').length / 2);
	// 상단에 추가
	// var row = my_tbody.insertRow(0);
	// 하단에 추가
	// var row = my_tbody.insertRow(my_tbody.rows.length);//
	var tr = document.createElement("tr");

	var td1 = document.createElement("td");
	td1.innerText = trCnt;

	var td2 = document.createElement("td");
	td2.innerText = document.all.dest_name.value;

	var td3 = document.createElement("td");
	td3.innerText = document.all.dest_num.value;

	var td4 = document.createElement("td");
	td4.innerText = document.all.var1.value;

	var td5 = document.createElement("td");
	td5.innerText = document.all.var2.value;

	var td6 = document.createElement("td");
	td6.innerText = document.all.var3.value;

	var td7 = document.createElement("td");
	td7.innerText = document.all.var4.value;

	tr.appendChild(td1);
	tr.appendChild(td2);
	tr.appendChild(td3);
	tr.appendChild(td4);
	tr.appendChild(td5);
	tr.appendChild(td6);
	tr.appendChild(td7);

	my_tbody.appendChild(tr);
}
function Delete() {
	var my_tbody = document.getElementById('my-tbody');
	if (my_tbody.rows.length < 1)
		return;
	my_tbody.deleteRow(insertTable.rows.length - 2);
}

$(function() {

	$(".radio-value").on('click', function() {
		var valueCheck = $(".radio-value:checked").val(); // 체크된 Radio
		// 버튼의 값을
		// 가져옵니다.

		if (valueCheck == '1') {
			$('#time').attr('disabled', false); // 과일 종류를
			// 입력하는
			// input 을
			// 활성화합니다.
			$('#time').focus(); // 과일 종류를 입력하는 input 에 커서를
			// 이동시킵니다.
			$('#date').attr('disabled', false);
			$('#date').focus();
		} else {
			$('#time').val(''); // 입력된 과일 종류 값이 있으면, 초기화합니다.
			$('#time').attr('disabled', true); // 과일 종류를
			// 입력하는
			// input 을
			// 비활성화합니다.
			$('#date').val('');
			$('#date').attr('disabled', true);
		}
	});

});// ready end

function File() {
	var upload = document.querySelector("#input_imgs");

	upload.addEventLi
}
// /////////////////////////////////////////////////////////////////////////
$(document).ready(function() {
	$("#addBtn").click(function() {

		var depart_num = $("#depart_num").val();
		var dest_name = $("dest_name").val();
		var dest_num = $("#dest_num").val();

		if (depart_num == "") {
			alert("발신번호를 입력하세요");
			document.destAdd.depart_num.focus();
			return;
		}
		if (dest_name == "") {
			alert("수신자 이름을 입력하세요");
			document.destAdd.dest_name.focus();
			return;
		}
		if (dest_num == "") {
			alert("수신번호를 입력하세요");
			document.destAdd.dest_num.focus();
			return;
		}
		/* document.destAdd.submit(); */

		var data = {
			dest_name : $("#dest_name").val(),
			dest_num : $("#dest_num").val(),
			var1 : $('#var1').val(),
			var2 : $('#var2').val(),
			var3 : $('#var3').val(),
			var4 : $('#var4').val()
		}

		console.log($("#dest_name").val());
		console.log($("#dest_num").val());
		console.log($("#var1").val());
		console.log($("#var2").val());
		console.log($("#var3").val());
		console.log($("#var4").val());

		$.ajax({
			url : "/send/destAdd",
			type : "post",
			dataType : "text",
			data : data,
			success : function(data) {
				alert("성공");
			},
			error : function(request,status,error) {
				alert("수신자 추가 실패 ");
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);

			}
		});
	})
	$("#deleteBtn").click(function(){
		$.ajax({
			url:"/send/destDelete",
			type:"post",
			success :function(data){
				alert("성공");
			},
			error : function(request,status,error) {
				alert("수신자 삭제  실패 ");
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);

			}
		});
			
	})
	// 전송버튼 클릭시
	$("#SendBtn").click(function() {
		var formData=new FormData();
		var inputFile=$("input[name='attach_file']");
		var files=inputFile[0].files;
		console.log(files);
		
		for(var i=0; i<files.length; i++){
			formData.append("attach_file",files[i]);
		}
		var send = {
			depart_num : $("#depart_num").val(),
			subject : $("#subject").val(),
			sch_type : $('.radio-value:checked').val(),
			send_date : $("#date").val()+" "+$("#time").val(),
			msg_content : $("#msg_content").val(),
			attach_file :$("attach_file").val()
			
		}
		console.log($("#depart_num").val());
		console.log($("#subject").val());
		console.log($('.radio-value:checked').val());
		console.log($("#date").val()+" "+$("#time").val());
		console.log($("#time").val());
		console.log($("#msg_content").val());
		console.log($("#attach_file").val());
		
		$.ajax({
			url : "/send/MMSsendMsg",
			type: "post",
			dataType:"html",
			data: send,
			success : function(data){
				alert("메시지 전송 성공");
			},
			error : function(error){
				alert("매시지 전송 실패")
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	})
});