<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE>
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
  
<script>
$(function() {
	var dialog, form,
	
	 name = $( "#name" ),
	 email = $( "#email" ),
	 password = $( "#password" ),
	 allFields = $( [] ).add( name ).add( email ).add( password ),
	 tips = $( ".validateTips" );
	
	function addUser() {
	  var valid = true;
	
	  if ( valid ) {
	    $( "#users tbody" ).append( "<tr>" +
	      "<td>" + name.val() + "</td>" +
	      "<td>" + email.val() + "</td>" +
	      "<td>" + password.val() + "</td>" +
	    "</tr>" );
	    dialog.dialog( "close" );
	  }
	  return valid;
	}
	
	dialog = $( "#dialog-form" ).dialog({
	  autoOpen: false,
	  height: 300,
	  width: 350,
	  modal: true,
	  buttons: {
	    "Create an account": addUser,
	    Cancel: function() {
	      dialog.dialog( "close" );
	    }
	  },
	  close: function() {
	    form[ 0 ].reset();
	    allFields.removeClass( "ui-state-error" );
	  }
	});
	
	form = dialog.find( "form" ).on( "submit", function( event ) {
      event.preventDefault();
      addUser();
    });
 
    $( "#create-user" ).button().on( "click", function() {
      dialog.dialog( "open" );
    });
	
});
</script>
  
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
	  		<h3 class="text-center">職位</h3>
<!-- 	  		<a href="JobDoServlet?action=add" id="add"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增</a> -->
	  		<a href="#" id="create-user"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增</a>
	  		
	  		<div id="users-contain" class="ui-widget"><!-- start -->
	  		<table id="users" class="table  table-bordered">
	  			<tr>
	  				<td>序號</td>
	  				<td>職位名稱</td>
	  				<td>負責主考官</td>
	  				<td></td>
	  			</tr>
	  			
	  			<c:forEach var="job" items="${joblists}">
	  			<tr>
	  				<td>${job.jobid}</td>
	  				<td>${job.jobname}</td>
	  				<td>
	  				<c:forEach var="employee" items="${job.employee}">
	  					${employee.empname}
	  				</c:forEach>
	  				</td>
	  				<td>
						<a href="JobDoServlet?action=edit&id=${job.jobid}"><span class="glyphicon glyphicon-pencil" aria-hidden="true">修改</span></a>
						 / 
						<a href="JobDoServlet?action=del&id=${job.jobid}"><span class="glyphicon glyphicon-trash" aria-hidden="true">刪除</span></a>
					</td>
	  			</tr>
	  			</c:forEach>
	  			
				<div id="dialog-form" title="Create new user">
					<p class="validateTips">All form fields are required.</p>
					
					<form>
						<fieldset>
							<label for="name">Name</label>
							<input type="text" name="name" id="name" value="Jane Smith" class="text ui-widget-content ui-corner-all">
							<label for="email">Email</label>
							<input type="text" name="email" id="email" value="jane@smith.com" class="text ui-widget-content ui-corner-all">
							<label for="password">Password</label>
							<input type="password" name="password" id="password" value="xxxxxxx" class="text ui-widget-content ui-corner-all">
							
							<!-- Allow form submission with keyboard without duplicating the dialog button -->
							<input type="submit" tabindex="-1" style="position:absolute; top:-1000px">
						</fieldset>
					</form>
				</div>
				
	  		</table>
	  		</div><!-- end -->
	  	</div>
	  	
	  	<div class="col-md-3"></div>
	
	</div>

</div>

<script>
	$( "#dialog" ).dialog({ autoOpen: false });//預設關閉
	$( "#opener" ).click(function() {//點擊觸發dialog
	  $( "#dialog" ).dialog( "open" );
	});
</script>

</body>
</html>