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
<title></title>
<link href='../css/fullcalendar.css' rel='stylesheet' />
<script src='../js/moment.min.js'></script>
<script src='../js/jquery.min.js'></script>
<script src='../js/fullcalendar.min.js'></script>
<!--燈箱樣式效果 -->
<link rel="stylesheet" type="text/css" href="../css/jquery.fancybox.css">
<script src='../js/jquery.fancybox.js'></script>
<!--jquery.ui 裡日期插件 -->
<script src='http://code.jquery.com/ui/1.10.3/jquery-ui.js'></script>

<!-- Bootstrap -->
<link href="../css/bootstrap.min.css" rel="stylesheet">
<!-- 依需要參考已編譯外掛版本（如下），或各自獨立的外掛版本 -->
<script src="../js/bootstrap.min.js"></script>



<style type="text/css">
#calendar {
	width: 960px;
	margin: 20px auto 10px auto
}

</style>
<script>
	$(document).ready(
			function() {
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
	<%@ include file="../WEB-INF/header/header.jsp"%>
<!-- 	<div class="container-fluid"> -->
<!-- 		<div class="row"> -->

<!-- 			<div class="col-md-2"> -->
<!-- 				<ul class="list-group"> -->
<%-- 					<c:forEach var="ECVO" items="${list}"> --%>
<%-- 						<div>${ECVO.ecno}</div> --%>
<%-- 						<div>${ECVO.ecname}</div> --%>
<!-- 						 <input type="submit" value=${ECVO.ecname}> -->
<%-- 					</c:forEach> --%>
<!-- 				</ul> -->
<!-- 			</div> -->
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