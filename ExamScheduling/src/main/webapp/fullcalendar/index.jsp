<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%    request.setCharacterEncoding("UTF-8");  %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="iii.team05.job.model.*"%>
<%-- 此頁採用 JSTL 與 EL 取值 --%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<script src='../js/jquery.min.js'></script>
<link href='../css/fullcalendar.css' rel='stylesheet' />
<script src='../js/moment.min.js'></script>
<script src='../js/fullcalendar.min.js'></script>
<!--燈箱樣式效果-->
<link rel="stylesheet" type="text/css" href="../css/jquery.fancybox.css">
<script src='../js/jquery.fancybox.js'></script>
<!--jquery.ui 裡日期插件-->
<script src='http://code.jquery.com/ui/1.10.3/jquery-ui.js'></script>

<!-- Bootstrap -->
<link href="../css/bootstrap.min.css" rel="stylesheet">
<!-- 依需要參考已編譯外掛版本（如下），或各自獨立的外掛版本 -->
<script src="../js/bootstrap.min.js"></script>



<style type="text/css">
	#calendar{width:960px; margin:20px auto 10px auto}
	.fancy{width:450px; height:auto}
	.fancy h4{line-height:30px; border-bottom:1px solid #d3d3d3;}
/* 	.fancy h3{height:30px; line-height:30px; border-bottom:1px solid #d3d3d3; font-size:14px} */
	.fancy form{padding:10px}
/* 	.fancy p{height:28px; line-height:28px; padding:4px; color:#999} */
/* 	.input{height:20px; line-height:20px; padding:2px; border:1px solid #d3d3d3; width:100px} */
/* 	.btn{-webkit-border-radius: 3px;-moz-border-radius:3px;padding:5px 12px; cursor:pointer} */
/* 	.btn_ok{background: #360;border: 1px solid #390;color:#fff} */
/* 	.btn_cancel{background:#f0f0f0;border: 1px solid #d3d3d3; color:#666 } */
 	.btn_del{background:#f90;border: 1px solid #f80; color:#fff } 
 	.sub_btn{height:32px; line-height:32px; padding-top:6px; border-top:1px solid #f0f0f0; text-align:right; position:relative} 
 	.sub_btn .del{position:absolute; left:2px} 
</style>
<script>
	
	$(document).ready(function() { 
		
	    $('#calendar').fullCalendar({ 
	        header:{
	        	left: 'title today',
	        	center: 'month,basicWeek,basicDay,agendaWeek,agendaDay',
	        	right: 'prevYear prev next nextYear'
	        },
	        editable: true,
	        events: 'EventJSONServlet',
	        dayClick: function(date, allDay, jsEvent, view) { 
	            //var selDate = $.fullCalendar.formatDate(date,'yyyy-MM-dd');//格式化日期 
	            var selDate = moment(date).format('YYYY-MM-DD');
	            var jobid = ${jobid};
	            //alert(selDate);
	            $.fancybox({//调用fancybox弹出层 
	                'type':'ajax', 
	                'href':'EventServlet?action=add&date='+selDate+'&jobid='+jobid
	            }); 
	        },
	        eventClick: function(calEvent, jsEvent, view) { 
	            $.fancybox({ 
	                'type':'ajax', 
	                'href':'EventServlet?action=edit&id='+calEvent.id
	            }); 
	        } 

	    })
	    
	 	$('.fancybox').fancybox();
	}); 

</script>
<style>

	body {
/* 		margin: 40px 10px; */
		padding: 0;
		font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
		font-size: 14px;
	}

	#calendar {
		padding: 10px;
		max-width: 900px;
		margin: 0 auto;
	}
	.list-group{
		padding: 10px;
	}

</style>
</head>
<body>
  <%@ include file="../WEB-INF/header/header.jsp" %>
	<div class="container-fluid">
<!-- 		<div class="row"> -->
<!-- 			<div class="col-md-12"> -->
<!-- 				<nav class="navbar navbar-default"> -->
<!-- 				<div class="container-fluid"> -->
<!-- 					<div class="navbar-header"> -->
<!-- 						<a class="navbar-brand" href="#"> <img alt="Brand" -->
<!-- 							src="../images/calendar_icon.jpg" width="30px"> -->
<!-- 						</a> -->
<!-- 						<p class="navbar-text">FullCalendar</p> -->
<!-- 						<div class="container"> -->
<!-- 							<ul class="nav navbar-nav"> -->
<!-- 									<li><a href="#">link1</a></li> -->
<!-- 							</ul> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				</nav> -->
<!-- 			</div> -->
<!-- 		</div> -->

      
        
		<div class="row">
			<div class="col-md-2">
				<ul class="list-group">
					<c:forEach var="job" items="${jdlists}">
						<a href="EventShowServlet?jobid=${job.jobid}"><li class="list-group-item <c:if test="${job.jobid == jobid}">active</c:if>" >${job.jobname}</li></a><!-- active -->
					</c:forEach>
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