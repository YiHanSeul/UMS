<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h3 class="my-4 text-center">UMS</h3>
<ul class="menu list-group">
<li class="list-group-item list-group-item-dark">
		<a href="#">메시지 전송</a>
		<ul class="navbar-nav" id="sub-menu">
			<li class="nav-item">
				<a href="/ums/">SMS/LMS</a>
			</li>
			<li class="nav-item">
				<a href="/ums/mms">MMS</a>
			</li>
			<li class="nav-item">
				<a href="/ums/fms">FMS</a>
			</li>
			<li class="nav-item">
				<a href="/ums/vms">VMS</a>
			</li>
		</ul>
	</li>
	<li class="list-group-item list-group-item-dark">
		<a href="#">전송 결과</a>
		<ul class="navbar-nav list-group" id="sub-menu">
			<li class="nav-item">
				<a href="/ums/report">결과 조회</a>
			</li>
			<li class="nav-item">
				<a href="/ums/detail">상세 조회</a>
			</li>
		</ul>
	</li>
</ul>