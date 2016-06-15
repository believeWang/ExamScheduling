<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title></title>
<link rel="stylesheet" type="text/css" href="demos.css" />
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:300,600,400' rel='stylesheet' type='text/css'>

    <link rel="stylesheet" type="text/css" href="../css/jsgrid.css" />
    <link rel="stylesheet" type="text/css" href="../css/theme.css" />

    <script src="../external/jquery/jquery-1.8.3.js"></script>
<!--     <script src="db.js"></script> -->

    <script src="../src/jsgrid.core.js"></script>
    <script src="../src/jsgrid.load-indicator.js"></script>
    <script src="../src/jsgrid.load-strategies.js"></script>
    <script src="../src/jsgrid.sort-strategies.js"></script>
    <script src="../src/jsgrid.field.js"></script>
    <script src="../src/fields/jsgrid.field.text.js"></script>
    <script src="../src/fields/jsgrid.field.number.js"></script>
    <script src="../src/fields/jsgrid.field.select.js"></script>
    <script src="../src/fields/jsgrid.field.checkbox.js"></script>
    <script src="../src/fields/jsgrid.field.control.js"></script>
</head>
<body>

  <h1>Basic Scenario</h1>
    <div id="jsGrid"></div>

    

</body>
<script>
$(function() {

	myajax();
   
});
function myajax(){
	
	$.ajax({
		url : '/ExamScheduling/emp/emptable.do',
		data : {
			'button' : 'select',
		},
		type : 'post',
		dataType : "json",
		success : function(response) {
			console.log(response);
			myGrid(response);
		}
	});
}
function myGrid(response){
	 var db = {
			 loadData: function(filter) {
	                return $.grep(this.clients, function(client) {
	                    return (!filter.Name || client.Name.indexOf(filter.Name) > -1)
	                        && (!filter.Number || client.Number === filter.Number)
	                        && (!filter.Email || client.Email.indexOf(filter.Email) > -1)
	                        && (!filter.Position || client.Position === filter.Position);
	                });
	            },
	            insertItem: function(insertingClient) {
	                this.clients.push(insertingClient);
	             
// 	            	$.ajax({
// 	            		url : '/ExamScheduling/emp/emptable.do',
// 	             		data : {
// 	             			'button' : 'insert',
// 	             			'Name' : insertingClient.Name,
// 	             			'Email' : insertingClient.Email,
// 	             			'Position' : insertingClient.Position
// 	             		},
// 	            		type : 'post',
// 	            		dataType : "json",
// 	            		success : function(response) {
// 	            		}
// 	            	});
	            },

	            updateItem: function(updatingClient) {
	            	 var clientIndex = $.inArray(updatingClient, this.clients);
		                this.clients.splice(clientIndex, 1);
// 	            	$.ajax({
// 	            		url : '/ExamScheduling/emp/emptable.do',
// 	             		data : {
// 	             			'button' : 'update',
// 	             			'Number' : updatingClient.Number,
	             			
// 	             		},
// 	            		type : 'post',
// 	            		dataType : "json",
// 	            		success : function(response) {
// 	            		}
// 	            	});
	            },

	            
	            deleteItem: function(deletingClient) {
		               
// 	                $.ajax({
// 	            		url : '/ExamScheduling/emp/emptable.do',
// 	             		data : {
// 	             			'button' : 'delete',
// 	             			'Number' : deletingClient.Number,
// 	             		},
	             		
// 	            		type : 'post',
// 	            		dataType : "json",
// 	            		success : function(response) {
	            			
// 	            		},
	            		
// 	            	});
	                
	            }

	        };

	  window.db = db;


      db.countries = [
          { Name: "", Id: null },
          { Name: "一般員工", Id: 0 },
          { Name: "主考官", Id: 1 },
          { Name: "系統使用者", Id: 2 },
          
      ];
	        db.clients=response;

// 	       db.clients = [
//         {
//             "Number": "Otto Clay",
//             "Name": 61,
//             "Email": "Otto Clay",
//             "Position": 1
           
//         }];
	       $("#jsGrid").jsGrid({
	            height: "70%",
	            width: "100%",
	            filtering: true,
	            editing: true,
	            inserting: true,
	            sorting: true,
	            paging: true,
	            autoload: true,
	            pageSize: 15,
	            pageButtonCount: 5,
	            deleteConfirm: "Do you really want to delete the client?",
	            controller: db,
	            fields: [
	                { name: "Name", type: "text", width: 150 },
	                { name: "Number", type: "text", width: 50 },
	                { name: "Email", type: "text", width: 200 },
	                { name: "Position", type: "select", items: db.countries, valueField: "Id", textField: "Name" },
	                { type: "control" }
	            ]
	        });
	
}
</script>


</html>
