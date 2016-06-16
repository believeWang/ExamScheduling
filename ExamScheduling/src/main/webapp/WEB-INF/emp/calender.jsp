<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="iii.team05.examinee.ecmodel.*"%>
<%

	ECHibernateDAO empSvc = new ECHibernateDAO();
	List<ECVO> list = empSvc.getAll();
	pageContext.setAttribute("list", list);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/WEB-INF/cdn.file"%>
<%@ include file="/WEB-INF/header/slide_mqtt.file" %>
<%@ include file="/WEB-INF/calendar.file"%>
<link rel="stylesheet" type="text/css"
	href="/ExamScheduling/css/preload.css" />
<title></title>

<style type="text/css">
#calendar {
	width: 960px;
	margin: 20px auto 10px auto
}

</style>
<script>
	$(document).ready(
			function() {
				$('body').addClass('loaded');
				$('#calendar').fullCalendar({
											header : {
												left : 'title today',
												center : 'month,basicWeek,basicDay,agendaWeek,agendaDay',
												right : 'prevYear prev next nextYear'
											},
											editable : true,
											events : '/ExamScheduling/employee/EmployeeJSONServlet',// 一開始頁面
											dayClick : function(date, allDay,jsEvnt, view) {
												var selDate = moment(date).format('YYYY-MM-DD');
											},
											eventClick : function(calEvent, jsEvent, view) {
												$.fancybox({
															'type' : 'ajax',
															'href' : '/ExamScheduling/employee/Score?action=get_Event&id='+ calEvent.id
														});
											}
										})
					});
</script>

<style>
body {
	/* 		margin: 40px 10px; */
	padding: 0;
	font-family: "Lucida Grande", Helvetica, Arial, Verdana, sans-serif;
	font-size: 14px;
}

#calendar {
	padding: 10px;
	max-width: 900px;
	margin: 0 auto;
}

.list-group {
	padding: 10px;
}
</style>
</head>
<body>
<%@ include file="/WEB-INF/header/slidenav.jsp" %>
	<!-- loading圖 -->
	<div id="loader-wrapper">
		<div id="loader"></div>
		<div class="loader-section section-left"></div>
        <div class="loader-section section-right"></div>
	</div>

			<div class="container-fluid">
		<div class="row">

			<div class="col-md-2">
				<ul class="list-group">
					
				</ul>
			</div>
			<div class="col-md-10">
				<table class="table table-bordered">
					<tr>
						<td>
							<div id='calendar'></div>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
		


</body>
</html>
