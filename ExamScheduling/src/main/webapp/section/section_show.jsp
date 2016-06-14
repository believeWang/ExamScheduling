<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- jQuery -->
<script src='../js/jquery.min.js'></script>

<!-- Bootstrap -->
<link href="../css/bootstrap.min.css" rel="stylesheet">
<!-- 依需要參考已編譯外掛版本（如下），或各自獨立的外掛版本 -->
<script src="../js/bootstrap.min.js"></script>
<!-- jQuery UI -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>

</head>
<body>
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
<!-- 	  	<a href="SectionDoServlet?action=add" id="create-section"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增</a>
	  		<div id="users-contain" class="ui-widget"><!-- start -->
	  		<form action="SectionSaveServlet" method="post">
	  		<input type="hidden" name="action" value="add">
	  		<table id="users" class="table  table-bordered">
				<tr>
					<td>時段</td>
					<td>
						小時：
						<select name="hour" class="form-control">
							<option value="01">01</option>
							<option value="02">02</option>
							<option value="03">03</option>
							<option value="04">04</option>
							<option value="05">05</option>
							<option value="06">06</option>
							<option value="07">07</option>
							<option value="08">08</option>
							<option value="09">09</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
							<option value="13">13</option>
							<option value="14">14</option>
							<option value="15">15</option>
							<option value="16">16</option>
							<option value="17">17</option>
							<option value="18">18</option>
							<option value="19">19</option>
							<option value="20">20</option>
							<option value="21">21</option>
							<option value="22">22</option>
							<option value="23">23</option>
							<option value="24">24</option>
						</select>
						分鐘：
						<select name="minute" class="form-control">
							<option value="00">00</option>
							<option value="10">10</option>
							<option value="20">20</option>
							<option value="30">30</option>
							<option value="40">40</option>
							<option value="50">50</option>
							<option value="60">60</option>
						</select>
						
					</td>
				</tr>
	  			<tr>
					<td>啟用</td>
					<td>
						<input type="checkbox" name="sectionStatus" value="1" <c:if test="${sectionVO.sectionStatus == true}">checked</c:if> />
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="送出" />
					</td>
				</tr>
	  		</table>
	  		</form>
	  		</div><!-- end -->
	  	</div>
	  	
	  	<div class="col-md-3"></div>
	
	</div>

</div>
</body>
</html>