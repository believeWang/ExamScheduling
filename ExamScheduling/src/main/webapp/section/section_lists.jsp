<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>區段管理</title>
<!-- jQuery -->
<!-- <script src='../js/jquery.min.js'></script> -->
<link rel="stylesheet" type="text/css"
	href="/ExamScheduling/css/preload.css" />
<%@ include file="../WEB-INF/cdn.file" %>

<!-- Bootstrap -->
<link href="../css/bootstrap.min.css" rel="stylesheet">
<!-- 依需要參考已編譯外掛版本（如下），或各自獨立的外掛版本 -->
<script src="../js/bootstrap.min.js"></script>
<!-- jQuery UI -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<!-- <script src="//code.jquery.com/jquery-1.10.2.js"></script> -->
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>

</head>
<body>
<%@ include file="../WEB-INF/header/sa_slidenav.jsp" %>
<!-- loading圖 -->
	<div id="loader-wrapper">
		<div id="loader"></div>

		<div class="loader-section section-left"></div>
        <div class="loader-section section-right"></div>

	</div>
<div class="container-fluid">
	
	<div class="row">
		<div class="col-md-12">
			<nav class="navbar navbar-default">
			<div class="container-fluid">
				<div class="navbar-header">
					<a class="navbar-brand" href="#"> <img alt="Brand"
						src="../images/calendar_icon.jpg" width="30px">
					</a>
					<p class="navbar-text">FullCalendar</p>
					<div class="container">
						<ul class="nav navbar-nav">
								<li><a href="../fullcalendar/index.jsp">前台頁面</a></li>
						</ul>
					</div>
				</div>
			</div>
			</nav>
		</div>
	</div>
	
	<div class="row">
	  	
	  	<div class="col-md-3"></div>
	  	
	  	<div class="col-md-6">
	  		<h3 class="text-center">預約時段設定</h3>
<!-- 	  		<a href="#" id="create-section"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增</a> -->
	  		<a href="SectionDoServlet?action=add" id="create-section"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增</a>
	  		<div id="users-contain" class="ui-widget"><!-- start -->
	  		<table id="users" class="table  table-bordered">
	  			<thead>
		  			<tr>
		  				<td>序號</td>
		  				<td>時段</td>
		  				<td>啟用狀態</td>
		  				<td></td>
		  			</tr>
	  			</thead>
	  			<tbody>
		  			<c:forEach var="section" items="${sectionlists}" varStatus="loop">
		  			<tr>
		  				<td>${loop.index+1}</td>
		  				<input type="hidden" name="index" value="${loop.count}" class="index">
		  				<td>${section.sectiontime}</td>
		  				<td>
		  					<c:if test="${section.sectionStatus == true}">啟用中</c:if>
		  					<c:if test="${section.sectionStatus == false}">未啟用</c:if>
	  					</td>
		  				<td>
							<a href="SectionDoServlet?action=modify&id=${section.sectionid}" class="edit-section"><span class="glyphicon glyphicon-pencil" aria-hidden="true">修改</span></a>
							 / 
							<a href="SectionDoServlet?action=delete&id=${section.sectionid}" class="del-section"><span class="glyphicon glyphicon-trash" aria-hidden="true">刪除</span></a>
						</td>
		  			</tr>
		  			</c:forEach>
	  			</tbody>
	  		</table>
	  		</div><!-- end -->
	  	</div>
	  	
	  	<div class="col-md-3"></div>
	
	</div>

</div>

</body>
<script type="text/javascript">
$(document).ready(function(){

    $('body').addClass('loaded');
});

</script>
</html>