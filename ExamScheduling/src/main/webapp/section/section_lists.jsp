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

<script>
$(function(){
	//dialog start
	var dialog, form,
	 
    // From http://www.whatwg.org/specs/web-apps/current-work/multipage/states-of-the-type-attribute.html#e-mail-state-%28type=email%29
    emailRegex = /^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$/,
    date = $( "#datepicker111" ),
    active = $( "#active" ),
    index = $( ".index" ),
    allFields = $( [] ).add( date ).add( active ).add( index ),
    tips = $( ".validateTips" );
	
	function addSection() {
	//alert(password.val());
      var valid = true;
      allFields.removeClass( "ui-state-error" );
 		
      if ( valid ) {
        $( "#users tbody" ).append( "<tr>" +
          "<td>" + index.val() + "</td>" +
          "<td>" + date.val() + "</td>" +
          "<td>" + active.val() + "</td>" +
          "<td>" + "<a href='#' class='edit-section ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only ui-state-hover'><span class='glyphicon glyphicon-pencil' aria-hidden='true'>修改</span></a>" + "/" +
          		   "<a href='#' class='del-section ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only ui-state-hover'><span class='glyphicon glyphicon-pencil' aria-hidden='true'>刪除</span></a>" +
          "</td>" +
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
        "送出": addSection,//
        "結束": function() {
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
      addSection();
    });
 
    $( "#create-section" ).button().on( "click", function() {
      dialog.dialog( "open" );
    });
    $( ".edit-section" ).button().on( "click", function() {
      dialog.dialog( "open" );
    });
    $( ".del-section" ).button().on( "click", function() {
      dialog.dialog( "open" );
    });
    
    //datepicker
    $(function() {
      $( "#datepicker" ).datepicker();
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
	  		<h3 class="text-center">預約時段設定</h3>
	  		<a href="#" id="create-section"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增</a>
	  		
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
		  				<td><c:if test="${section.sectionStatus == '1'}">啟用中</c:if>
		  					<c:if test="${section.sectionStatus == '0'}">未啟用</c:if></td>
		  				<td>
							<a href="#" class="edit-section"><span class="glyphicon glyphicon-pencil" aria-hidden="true">修改</span></a>
							 / 
							<a href="#" class="del-section"><span class="glyphicon glyphicon-trash" aria-hidden="true">刪除</span></a>
						</td>
		  			</tr>
		  			</c:forEach>
	  			</tbody>
	  		</table>
	  		</div><!-- end -->
	  		<div id="dialog-form" title="Create new user"><!-- jquery-ui -->
			  <p class="validateTips text-center">時段設定</p>
			 
			  <form>
			    <fieldset>
			      <label for="datepicker111">時段:</label><br />
<!-- 			      <input type="text" name="section" id="datepicker" value="" class="text ui-widget-content ui-corner-all"><br /><br /> -->
			      <input type="text" name="section" id="datepicker111" value="" class="text ui-widget-content ui-corner-all"><br /><br />
			      <label for="active">啟用:</label><br />
			      <input type="checkbox" name="active" id="active" value="1" class="text ui-widget-content ui-corner-all"><br />
			      
			      <!-- Allow form submission with keyboard without duplicating the dialog button -->
			      <input type="submit" tabindex="-1" style="position:absolute; top:-1000px">
			    </fieldset>
			  </form>
			</div><!-- jquery-ui -->
	  	</div>
	  	
	  	<div class="col-md-3"></div>
	
	</div>

</div>

</body>
</html>