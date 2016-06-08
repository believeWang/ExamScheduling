<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
#mwt_mwt_slider_scroll {
	top: 0;
	right: -200px;
	width: 200px;
	position: fixed;
	z-index: 9999;
}

#mwt_slider_content {
/* 	background: #3c5a98; */
	background-image: url(/ExamScheduling/header/images/ba01.png);
	text-align: center;
	padding-top: 20px;
	
}

#mwt_fb_tab {
	position: absolute;
	top: 20px;
	left: -24px;
	width: 24px;
/* 	background: #3c5a98; */
	background-image: url(/ExamScheduling/header/images/ba01.png);
	color: black;
	font-family: Arial, Helvetica, sans-serif;
	text-align: center;
	padding: 9px 0;
	-moz-border-radius-topleft: 10px;
	-moz-border-radius-bottomleft: 10px;
	-webkit-border-top-left-radius: 10px;
	-webkit-border-bottom-left-radius: 10px;
}

#mwt_fb_tab span {
	display: block;
	height: 12px;
	padding: 1px 0;
	line-height: 12px;
	text-transform: uppercase;
	font-size: 12px;
}

body {
	background: url("/ExamScheduling/exam_resourse/images/background.jpg");
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/cdn.file"%>
<link rel="stylesheet" type="text/css"
	href="/ExamScheduling/header/css/component1.css" />
<script src="/ExamScheduling/header/js/modernizr-2.6.2.min.js"></script>
<script type='text/javascript'>
	$(function() {
		var w = $("#mwt_slider_content").width();
		$('#mwt_slider_content').css('height',
				($(window).height() - 700) + 'px');

		$("#mwt_fb_tab").mouseover(function() { //滑鼠滑入時
			if ($("#mwt_mwt_slider_scroll").css('right') == '-' + w + 'px') {
				$("#mwt_mwt_slider_scroll").animate({
					right : '0px'
				}, 600, 'swing');
			}
		});

		$("#mwt_slider_content").mouseleave(function() {//滑鼠離開後
			$("#mwt_mwt_slider_scroll").animate({
				right : '-' + w + 'px'
			}, 600, 'swing');
		});
	});
	$(document).ready(function() {
		// the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
		$('.modal-trigger').leanModal();
	});
</script>
<title>ESS</title>
<body>
	<div class="component">
		<!-- Start Nav Structure -->
		<button class="cn-button" id="cn-button">+</button>
		<div class="cn-wrapper" id="cn-wrapper">
			<ul>
				<li class="tooltipped" data-position="top" data-delay="50" data-tooltip="預約考試"><a
					href="<%=request.getContextPath()%>/fullcalendar/EventShowServlet?jobid=1"><i
						class="material-icons Medium">present_to_all</i></a></li>
				<li class="tooltipped" data-position="top" data-delay="50" data-tooltip="前往考試"><a
					href="${pageContext.request.contextPath}/choose"><i
						class="material-icons">mode_edit</i></a></li>
				<li class="tooltipped" data-position="top" data-delay="50" data-tooltip="首頁"><a
					href="<%=request.getContextPath()%>/index.jsp"><span
						class="icon-home"></span></a></li>
				<li class="tooltipped" data-position="top" data-delay="50" data-tooltip="關於緯康"><a href="#"><i class="material-icons">library_books</i></a></li>
				<li class="tooltipped" data-position="top" data-delay="50" data-tooltip="聯絡我們 "><a
					href="<%=request.getContextPath()%>/MesTurn?turn=LM"><i
						class="material-icons">perm_phone_msg</i></a></li>
			</ul>
		</div>
		<div id="cn-overlay" class="cn-overlay"></div>
		<!-- End Nav Structure -->
	</div>

	<div id="mwt_mwt_slider_scroll">
		<div id="mwt_fb_tab">
			<span>i</span> <SPAN>i</SPAN> <SPAN>I</SPAN> <SPAN>N</SPAN> <SPAN>T</SPAN>
			<SPAN>E</SPAN> <SPAN>R</SPAN> <SPAN>V</SPAN> <SPAN>I</SPAN> <SPAN>E</SPAN>
			<SPAN>W</SPAN>
		</div>
		<div id="mwt_slider_content">
			<div
				style="background-image: url(/ExamScheduling/header/images/ba01.png); height: 200px">
				<h3 align="center">${errorMessage}</h3>
				<c:choose>
					<c:when test="${not empty sessionScope.ecno}">

						<div class="header-user-menu">
							<ul>
								
								<li><h5 style="color:blue">${sessionScope.ecno}</h5>歡迎使用本系統</li>
								<li><a class="blue lighten-1 waves-light btn"
									href="${pageContext.request.contextPath}/LogoutServlet"><i
										class="material-icons left">cloud</i>登出</a></li>


							</ul>
						</div>
					</c:when>

					<c:otherwise>
						<div class="header-user-login">
							<ul id="login">
								<li>請先登入才能使用本系統</li>
								<li><a class="modal-trigger blue lighten-1 waves-light btn"
									href="#modal1"><i class="material-icons left">cloud</i>登入</a></li>
							</ul>
						</div>
					</c:otherwise>
				</c:choose>

			</div>
		</div>
	</div>
	<div id="modal1" class="modal ">
		<div class="modal-content">
			<form name="login-form" class="login-form" action="LoginServlet"
				method="post">

				<input name="username" type="text" class="input username" /> <input
					name="password" type="password" class="input password" />


				<button class="light-blue darken-2 waves-light btn" type="submit"
					style="float: right;">
					送出<i class="material-icons right">input</i>
				</button>


			</form>
		</div>
	</div>
	<script src="/ExamScheduling/header/js/polyfills.js"></script>
	<script src="/ExamScheduling/header/js/demo1.js"></script>
</body>
<script type="text/javascript">
$(document).ready(function(){
    $('.tooltipped').tooltip({delay: 50});
  });
</script>
</html>
