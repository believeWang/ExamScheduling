<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%    request.setCharacterEncoding("UTF-8");  %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="iii.team05.job.model.*"%>
<%-- 此頁採用 JSTL 與 EL 取值 --%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="/ExamScheduling/css/preload.css" />
<%@ include file="/WEB-INF/cdn.file"%>

<%@ include file="/WEB-INF/header/header_resourse.file" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<!-- <script src='../js/jquery.min.js'></script> -->
<link href='../css/fullcalendar.css' rel='stylesheet' />
<script src='../js/moment.min.js'></script>
<script src='../js/fullcalendar.min.js'></script>
<!--jquery.ui 裡日期插件-->
<script src='http://code.jquery.com/ui/1.10.3/jquery-ui.js'></script>
<!-- Bootstrap -->
<link href="../css/bootstrap.min.css" rel="stylesheet">
<!-- 依需要參考已編譯外掛版本（如下），或各自獨立的外掛版本 -->
<script src="../js/bootstrap.min.js"></script>
<!--燈箱樣式效果-->
<link rel="stylesheet" type="text/css" href="../css/jquery.fancybox.css">
<script src='../js/jquery.fancybox.js'></script>


<style type="text/css">
	#calendar{width:960px; margin:20px auto 10px auto}
	.fancy{width:450px; height:auto}
	.fancy h4{line-height:30px; border-bottom:1px solid #d3d3d3;}
* 	.fancy h3{height:30px; line-height:30px; border-bottom:1px solid #d3d3d3; font-size:14px} */
	.fancy form{padding:10px}
/* 	.fancy p{height:28px; line-height:28px; padding:4px; color:#999} */
/* 	.input{height:20px; line-height:20px; padding:2px; border:1px solid #d3d3d3; width:100px} */
/* 	.btn{-webkit-border-radius: 3px;-moz-border-radius:3px;padding:5px 12px; cursor:pointer} */
/* 	.btn_ok{background: #360;border: 1px solid #390;color:#fff} */
/* 	.btn_cancel{background:#f0f0f0;border: 1px solid #d3d3d3; color:#666 } */
 	.btn_del{background:#f90;border: 1px solid #f80; color:#fff } 
 	.sub_btn{height:32px; line-height:32px; padding-top:6px; border-top:1px solid #f0f0f0; text-align:right; position:relative} 
 	.sub_btn .del{position:absolute; left:2px} 
 	
	.ilike-blue-container {
	    @extend .blue, .lighten-4;
	}
</style>
<script>
	
	$(document).ready(function() { 
		  $('body').addClass('loaded');
		var esYear = ${datearray[0]};
		var esMonth = ${datearray[1]};
		var esDay = ${datearray[2]};
		var res0 = esYear+"-"+esMonth+"-"+esDay;
		var res = esYear+","+esMonth+","+esDay;
		var date_em = new Date(res);  //考生的eshiredate date格式
		var empno = ${empno};
		var ecno = "${ecno}";
		
		//console.log(ecno);
	    $('#calendar').fullCalendar({ 
	    	weekends: false,
	        header:{
	        	left: 'title today',
	        	center: 'month,basicWeek,basicDay,agendaWeek,agendaDay',
	        	right: 'prevYear prev next nextYear'
	        },
	        editable: true,
	        events: 'EventJSONServlet?empno='+empno+'&ecno='+ecno ,
	        dayClick: function(date, allDay, jsEvent, view) { 
	            //var selDate = $.fullCalendar.formatDate(date,'yyyy-MM-dd');//格式化日期 
	            var selDate = moment(date).format('YYYY-MM-DD');
	            var jobid = ${jobid};
	            var dt2 = date; //點擊日期
	            var aa = (dt2 - date_em) / (1000 * 60 * 60 * 24);
	            
	            if(aa >= 14 || aa < 0){
	            	$('#errormsg').trigger('click');
	            	//alert("超過報名時間已過，請選擇"+res0+" 14天內，謝謝。");
	            }else{
	            	$.fancybox({//调用fancybox弹出层 
		                'type':'ajax', 
		                'href':'EventServlet?action=add&date='+selDate+'&jobid='+jobid+'&empno='+empno
		            }); 	
	            }
	        },
	        eventClick: function(calEvent, jsEvent, view) { 
	            $.fancybox({ 
	                'type':'ajax', 
	                'href':'EventServlet?action=edit&id='+calEvent.id+'&empno='+empno
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
    <!-- loading圖 -->
    <div id="loader-wrapper">
		<div id="loader"></div>
		<div class="loader-section section-left"></div>
        <div class="loader-section section-right"></div>

	</div>
	<div class="container-fluid">
		<div class="row">
			<div class="col s2">
				<ul class="collection">
					<c:forEach var="job" items="${jdlists}">
						<a href="EventShowServlet?jobid=${job.jobid}"><li class="collection-item <c:if test="${job.jobid == jobid}"> blue darken-1 active</c:if>" >${job.jobname}</li></a><!-- active -->

					</c:forEach>
				</ul>
			</div>
			<div class="col s10">
				<table class="table table-bordered">
					<tr>
						<td>
							<div id='calendar'></div>
							<a class="modal-trigger waves-effect waves-light btn1" href="#modal1" id="errormsg"></a>
								<div id="modal1" class="modal modal-fixed-footer" style="width:650px; height:200px">
								    <div class="modal-content">
								      <h2>錯誤訊息!!!</h2>
								      <h4>超過預約的時間，請選擇可報名日期:${datearray[0]}年${datearray[1]}月${datearray[2]}日後14天內，謝謝。</h4>
								    </div>
								    <div class="modal-footer">
								      <a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">關閉</a>
								    </div>
								  </div>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</body>
</html>
