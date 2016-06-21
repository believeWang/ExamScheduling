
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="iii.team05.Employee.model.*"%>
<%

EmployeeDAO empSvc = new EmployeeDAO();
List<EmployeeVO> list = empSvc.getAllEmp();
pageContext.setAttribute("list", list);
%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>員工表格</title>
<%@ include file="../../WEB-INF/cdn.file" %>
<link rel="stylesheet" type="text/css"
	href="css/preload.css" />
<style>
@import url('<%=request.getContextPath()%>/employee/main.css');
@import url('<%=request.getContextPath()%>/mes/css/main.css');
</style>

</head>
<body>
<%@ include file="../../WEB-INF/header/sa_slidenav.jsp" %>
<!-- loading圖 -->
	<div id="loader-wrapper">
		<div id="loader"></div>

		<div class="loader-section section-left"></div>
        <div class="loader-section section-right"></div>

	</div>
<div ><fieldset>
			<legend>員工表格</legend>

<table class=table4_9 style="width:800px">
                 <tr>				
					<th>員工編號</th>
					<th>員工姓名</th>
					<th>E-mail</th>
					<th>權限</th>
				</tr>

	<c:forEach var="EmpVO" items="${list}">
			<tr>

	<td>${EmpVO.empno}</td>
	<td>${EmpVO.empname}</td>
	<td>${EmpVO.empemail}</td>
	<td>
		<c:if test="${EmpVO.position == 0}">一般員工</c:if>
		<c:if test="${EmpVO.position == 1}">主考官</c:if>
		<c:if test="${EmpVO.position == 2}">系統管理者</c:if>
	</td>
		</tr>
        </c:forEach>
      	</table>
		<a type="image" class="waves-effect waves-light btn modal-trigger" target="_blank" href="<%=request.getContextPath()%>/test/jsp/calender.jsp">修改</a>
		</fieldset></div>
</body>

<script>
$(document).ready(function(){
       $('.modal-trigger').leanModal();
    $('select').material_select();
    $('body').addClass('loaded');
        
  });
</script>

</html>
