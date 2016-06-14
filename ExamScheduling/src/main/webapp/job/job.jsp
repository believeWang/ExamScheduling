<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<!-- Bootstrap -->
<link href="../css/bootstrap.min.css" rel="stylesheet">
<!-- 依需要參考已編譯外掛版本（如下），或各自獨立的外掛版本 -->
<script src="../js/bootstrap.min.js"></script>


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
								<li><a href="#">link1</a></li>
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
	  		<h3 class="text-center">職位</h3>
	  		<table class="table  table-bordered">
	  		<form action="InserJobServlet" method="post">
	  			<tr>
	  				<td>職位名稱：</td><td><input type="text" name="job" value=""  class="form-control"></td>
	  			</tr>
	  			<tr>
	  				<td>啟用：</td><td><input type="checkbox" name="" value=""  class=""></td>
	  			</tr>
	  			<tr>
	  				<td><input type="submit" value="Submit"  class="btn btn-primary"></td><td></td>
	  			</tr>
	  			</form>
	  		</table>
	  		
	  	</div>
	  	
	  	<div class="col-md-3"></div>
	
	</div>

</div>
</body>
</html>