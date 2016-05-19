<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="iii.team05.Employee.model.*"%>
<%@ page import="java.util.*"%>
<%
	EmployeeVO empVO = (EmployeeVO) request.getAttribute("employeeVO"); //EmpServlet.java (Concroller), 存入req的empVO物件 (包括幫忙取出的empVO, 也包括輸入資料錯誤時的empVO物件)
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>員工資料修改 - update_emp_input.jsp</title></head>




<FORM METHOD="post" ACTION="emp/emp.do" name="form1">
<table border="0">
	<tr>
		<td>員工編號:<font color=red><b>*</b></font></td>
		<td><%=empVO.getEmpno()%></td>
	</tr>
	<tr>
		<td>員工姓名:</td>
		<td><input type="TEXT" name="empname" size="45" value="<%=empVO.getEmpname()%>" /></td>
	</tr>
	<tr>
		<td>E-mail:</td>
		<td><input type="TEXT" name="empemail" size="45"	value="<%=empVO.getEmpemail()%>" /></td>
	</tr>
	<
	</tr>
	<tr>
		<td>權限:</td>
		<td><input type="TEXT" name="position" size="45"	value="<%=empVO.getPosition()%>" /></td>
	</tr>
	
</table>
<br>
<input type="hidden" name="action" value="update">
<input type="hidden" name="empno" value="<%=empVO.getEmpno()%>">
<input type="submit" value="送出修改"></FORM>

</body>
</html>
