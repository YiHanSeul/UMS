<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <p class="headerId">FMS</p>
<div class="row" id="sendT">
	<div class="col-lg-4">
		<div class="row">
			<h5 class="title-font">
				<i class="fa fa-envelope-open" aria-hidden="true"></i> 메시지작성
			</h5>
			<div class="col-12">
				<label>메시지제목</label>
				<input id="subject" type="text" class="form-control" name="subject" />
				<label>전송파일</label>
				 <input type="file" class="form-control-file" id="attach_file" multiple/>
				 <table class="table">
					<colgroup>
						<col style="width: 130px;" />
						<col style="width: 70px;" />
					</colgroup>
					<thead>
						<tr>
							<th class="title">파일명</th>
							<th class="title">사이즈</th>
						</tr>
					</thead>
					<tbody id="receiveList">
						<tr>
							<td colspan="7" class="text-center">추가 된 수신자가 없습니다.</td>
						</tr>
					</tbody>
				</table>
				
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
