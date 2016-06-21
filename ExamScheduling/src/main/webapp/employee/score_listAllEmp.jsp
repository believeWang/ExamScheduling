<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page import="iii.team05.Employee.model.*"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style>
@import url('<%=request.getContextPath()%>/employee/main.css');
</style>
<body>
	
<div><fieldset>
	
			
<c:forEach var="student_data" items="${student_data}">
<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/sco/sco.do" name="form1">

<table class=table4_9>
<tr>
		<td>學號:<font color=red><b>*</b></font></td>
		<td>${student_data.ecno}</td>
	</tr>
	<tr>
		<td>學生姓名:<font color=red><b>*</b></font></td>
		<td>${student_data.ecname}</td>
	</tr>
	<tr>
		<td>E-mail:<font color=red><b>*</b></font></td>
		<td>${student_data.ecemail}</td>
	</tr>
	
	
	<tr>
		<td>上機考:</td>
		<td><input type="TEXT" name="lab" size="45"	 value="${student_data.scoreVO.lab}" /></td>
	</tr>
	<tr>
		<td>面試分數:</td>
		<td><input type="TEXT" name="interview" size="45"	value="${student_data.scoreVO.interview}" /></td>
	</tr>
	<tr>
		<td>線上測驗分數:</td>
		<td><input type="TEXT" name="onlineex" size="45"	value="${student_data.scoreVO.onlineex}" /></td>
	</tr>
<tr>
		<td>測驗時間:</td>
		<td><input type="TEXT" name="labtime" size="45"	value="${student_data.scoreVO.labtime}" /></td>
	</tr>

	
	
</table>
 

<input type="hidden" name="action" value="update">
<input type="hidden" name="ecno" value="${student_data.ecno}">
<input type="submit" value="送出修改" >




</FORM>
 </c:forEach>
</fieldset>
</div>
</body>
<script>
	$(document).ready(function() {
		$('.collapsible').collapsible({
			accordion : false
		});
	});
</script>


</html>
