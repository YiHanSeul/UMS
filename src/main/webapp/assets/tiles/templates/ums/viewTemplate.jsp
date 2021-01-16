<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../../../include/inc_common.jsp"%>
<%@ include file="../../../include/inc_script.jsp"%>
</head>
<script>
	$(document).ready(function() {
		$(".leftboxImgList > img:eq(0)").css('display', 'block');

		$('.detail_tabs li').hover(function() {
			var ctl_temp = $(this).index()+1;
			$(".leftboxImgList").children().css('display', 'none');
			$(".leftboxImgList > img:eq(" + ctl_temp + ")").css('display', 'block');
		}, function() {
			$(".leftboxImgList").children().css('display', 'none');
			$(".leftboxImgList > img:eq(0)").css('display', 'block');			
		});

		$('.detail_tabs li, .rightbox').click(function() {
			var tagId = $(this).attr('id');
			if (tagId != null) {
				$('#bodyContents').children().remove();
				$('#bodyContents').load(tagId);

				$("html, body").animate({
					scrollTop : $(document).height()
				}, 1000);
			}
		});
		$(document).scroll(function() {
			var scrollTop = $(this).scrollTop();
			var innerHeight = $(this).innerHeight();
			var scrollHeight = $(this).prop('scrollHeight');
			if (scrollTop + innerHeight >= scrollHeight) {
				$("#footer > i").css('display', 'none');
			} else {
				$("#footer > i").css('display', 'block');
			}
		});
		$('#footer > i').click(function() {
			$("html, body").animate({
				scrollTop : 0
			}, 1000);

		});

	})
</script>

<body>

	<div class="container-fluid">
		<div class="row">
			<div class="col-12">
				<tiles:insertAttribute name="header" />
			</div>
			<div class="col-10 pt-2">
				<tiles:insertAttribute name="menu" />
			</div>
			<div id="bodyContents" class="col-10 pt-2">
				<tiles:insertAttribute name="serviceBox" />
			</div>
			<div id="footer">
				<i class="fa fa-arrow-circle-up" aria-hidden="true"></i>
			</div>

		</div>
	</div>
</body>

</html>