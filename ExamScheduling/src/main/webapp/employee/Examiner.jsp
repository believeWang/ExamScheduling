
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
<title>主考官表格</title>
</head>
<style>
@import url('<%=request.getContextPath()%>/employee/main.css');
</style>

<body>
<div><fieldset>
			<legend>主考官表格</legend>


			<table class=table4_9>
				<tr>
<!-- 					<th>delet</th> -->
					<th>empno</th>
					<th>empname</th>
					<th>empemail</th>
					<th>position</th>
					<th>update</th>
				</tr>

				<%@ include file="page1.file"%>
				<c:forEach var="EmployeeVO" items="${list}" begin="<%=pageIndex%>"	end="<%=pageIndex+rowsPerPage-1%>">

					<tr align='center' valign='middle'>

						<td>${EmployeeVO.empno}</td>
						<td>${EmployeeVO.empname}</td>
						<td>${EmployeeVO.empemail}</td>
						<td>${EmployeeVO.position}</td>
						<td>
							<FORM METHOD="post"	ACTION="<%=request.getContextPath()%>/emp/emp.do">
								<input type="submit" value="修改"> 
								<input type="hidden" name="empno" value="${EmployeeVO.empno}">
							    <input type="hidden" name="action" value="getOne_For_Update">
							</FORM>
						</td>
 						
					</tr>
				</c:forEach>

			</table>
		</fieldset>
		<a href='<%=request.getContextPath()%>/employee/Emptable.jsp'>新增主考官</a>
		<%@ include file="page2.file"%>
</body>
</html>
