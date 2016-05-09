<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Bootstrap 樣式</title>

<!-- Bootstrap -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- jQuery (Bootstrap 所有外掛均需要使用) -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<!-- 依需要參考已編譯外掛版本（如下），或各自獨立的外掛版本 -->
<script src="js/bootstrap.min.js"></script>

</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<nav class="navbar navbar-default">
				<div class="container-fluid">
					<div class="navbar-header">
						<a class="navbar-brand" href="#"> <img alt="Brand"
							src="images/calendar_icon.jpg" width="30px">
						</a>
						<p class="navbar-text">FullCalendar</p>
						<div class="container">
							<ul class="nav navbar-nav">
								<li class="active"><a href="#">Link 1</a></li>
								<li><a href="#">Link 2</a></li>
								<li><a href="#">Link 3</a></li>
								<li><a href="#">Link 4</a></li>
								<li><a href="#">Link 5</a></li>
							</ul>
						</div>
					</div>
				</div>
				</nav>
			</div>
		</div>

		<div class="row">
			<div class="col-md-2">
				<ul class="list-group">
					<li class="list-group-item">職位 1</li>
					<li class="list-group-item active">職位 2</li>
					<li class="list-group-item">職位 3</li>
					<li class="list-group-item">職位 4</li>
					<li class="list-group-item">職位 5</li>
				</ul>
			</div>
			<div class="col-md-10">
				<table class="table table-bordered">
					<tr>
						<td>
							
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</body>
</html>