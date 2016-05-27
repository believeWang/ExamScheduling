
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="iii.team05.Employee.model.*"%>


<%
EmployeeService empSvc = new EmployeeService();
List<EmployeeVO> list = empSvc.getExam();
pageContext.setAttribute("list", list);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>員工表格</title>
</head>
<style>
@import url('<%=request.getContextPath()%>/employee/main.css');
</style>

<body>
<%@ include file="/mes/sa_header.jsp" %>
<div><fieldset>
			<legend>員工表格</legend>
<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/emp/emp.do" name="form1">
<table class=table4_9 style="width:800px">
                 <tr>				
					<th>編號</th>
					<th>主考官姓名</th>
					<th>E-mail</th>
					<th>權限</th>
					<th>修改</th>
				</tr>

	<c:forEach var="EmpVO" items="${list}">
			<tr>

	<td>${EmpVO.empno}</td>
	<td>${EmpVO.empname}</td>
	<td>${EmpVO.empemail}</td>
	
	<td><input type="TEXT" name="position" 	 value="${EmpVO.position} "readonly/></td>
	

	    <input type="hidden" name="empno" value="${EmpVO.empno}">
	    <input type="hidden" name="action" value="update">
		<td><input type="submit" value="增加考官"></td></tr>
        </c:forEach>
	</table>
</FORM>
		</fieldset></div>
		<a href='<%=request.getContextPath()%>/employee/Examiner2.jsp'>返回考官表格</a>
		<a href="<%=request.getContextPath()%>/employee/student_upd.jsp">查詢考生諮詢</a>
<%-- 		<%@ include file="page2.file"%> --%>
</body>
</html>
