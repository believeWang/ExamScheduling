<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="iii.team05.Employee.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
@import url('<%=request.getContextPath()%>/employee/main.css');
</style>
<title>員工資料 - listOneEmp.jsp</title>
</head>
<body bgcolor='white'>

<table  class=table4_9  style="width:800px;" >
	<tr>
		<th>學號</th>
		<th>學生姓名</th>
		<th>E-mail</th>
		<th>上機考試</th>
		<th>面試成績</th>
		<th>線上測驗分數</th>
		<th>備註</th>
		<th>修改分數</th>
	</tr>

	<c:forEach var="student_data" items="${student_data}">
        	<td>${student_data.ecno}</td>
        	<td>${student_data.ecname}</td>
        	<td>${student_data.ecemail}</td>
        	<td>${student_data.scoreVO.lab}</td>
        	<td>${student_data.scoreVO.interview}</td>
        	<td>${student_data.scoreVO.onlineex}</td>
        	<td>${student_data.ecremark1}</td>
        	<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/sco/sco.do">
			  
			     <input type="submit" value="修改分數">
			     <input type="hidden" name="ecno" value="${student_data.ecno}">
			     <input type="hidden" name="action"	value="score_Update">
			    
			  </FORM>
			</td>
        	
        	        	
        </c:forEach>
</table>
<script> 
// $(function() {
	
// $('#select1').change(function() {
// 	console.log("AAAAAAAAAAAAAAAAAAAA");
	
	
// 	$.getJSON('/employee/Score',{'action':get_Event},function(datas){
// 		console.log("SSSSSSSSSSSSSSSSSSSSSSSSSSSSS");
// 		//datas 就是一個JSON物件
// 		console.log(datas+"SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS");//console.log(product.ecno);
// 		$.each(datas,function(i,product){
			//console.log(product.ecno);
			//<tbody><tr><td>
// 			var cell1 = $("<td></td>").text(product.ecno);
// 			var cell2 = $("<td></td>").text(product.ecname);
// 			var cell3 = $("<td></td>").text(product.ecemail);
// 			var cell4 = $("<td></td>").text(product.ecpsd);
// 			var cell5 = $("<td></td>").text(product.ecstatus);
// 			var cell6 = $("<td></td>").text(product.ecremark1);
// 			var cell7 = $("<td></td>").text(product.eSVO);
// 			var cell8 = $("<td></td>").text(product.scoreVO);
			
// 			var row = $("<tr></tr>").append([cell1,cell2,cell3,cell4,cell5,cell6,cell7,cell8]);
			
// 			$('#productTable>tbody').append(row);
// 		});
// 		})
// });

// });


</script>

</body>
</html>
