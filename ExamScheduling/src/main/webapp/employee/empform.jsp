<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="iii.team05.Employee.model.*"%>

<%
	EmployeeService empSvc = new EmployeeService();
List<EmployeeVO> list1 = empSvc.getAll();
pageContext.setAttribute("list1", list1);

List<EmployeeVO> list2 = empSvc.getExam();
pageContext.setAttribute("list2", list2);
List<EmployeeVO> list0 = empSvc.getEmp();
pageContext.setAttribute("list0", list0);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>



</style>
</head>
<%@ include file="../../WEB-INF/cdn.file"%>
<body>

	<ul class="collapsible" data-collapsible="accordion">
		<li>
			<div class="collapsible-header">
				<i class="material-icons">filter_drama</i>員工
			</div>
			<div class="collapsible-body">
				<table class=table4_9 style="width: 800px">
					<tr>
						<th>員工編號</th>
						<th>員工姓名</th>
						<th>E-mail</th>
						<th>修改</th>
					</tr>
					<c:forEach var="EmpVO0" items="${list0}">
						<tr>
							<td>${EmpVO0.empno}</td>
							<td>${EmpVO0.empname}</td>
							<td>${EmpVO0.empemail}</td>

							<td >
								<FORM METHOD="post"
									ACTION="<%=request.getContextPath()%>/emp/emp.do" name="form1">
									<div class="input-field col s12 " style="float:left">
										<select name="position">
											<option value="" disabled selected>選擇權限</option>
											<option value="2">系統管理員</option>
											<option value="1">主考官</option>
											<option value="0">一般員工</option>
										</select>
									</div >
								
									<div style="float:left">
									<input type="hidden" name="empno" value="${EmpVO0.empno}">
									<input type="hidden" name="action" value="update"> 
									<input type="submit" value="確定" class="waves-effect waves-light btn">
									</div>
								</FORM>
							</td>

							<td>
							<div>
								<FORM METHOD="post"
									ACTION="<%=request.getContextPath()%>/emp/emp.do" name="form1">
									<input type="hidden" name="empno" value="${EmpVO0.empno}">
									<input type="hidden" name="action" value="delete"> <input
										type="submit" value="刪除" class="waves-effect waves-light btn">
										
								</FORM>
								</div>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</li>
		<li>
			<div class="collapsible-header">
				<i class="material-icons">place</i>主考官
			</div>
			<div class="collapsible-body">
				<table class=table4_9 style="width: 800px">
					<tr>
						<th>員工編號</th>
						<th>員工姓名</th>
						<th>E-mail</th>
						<th>修改</th>
					</tr>
					<c:forEach var="EmpVO1" items="${list1}">
						<tr>
							<td>${EmpVO1.empno}</td>
							<td>${EmpVO1.empname}</td>
							<td>${EmpVO1.empemail}</td>
							<td>
								<FORM METHOD="post"	ACTION="<%=request.getContextPath()%>/emp/emp.do" name="form1">
									<div class="input-field col s12" style="float:left">
										<select name="position">
											<option value="" disabled selected>選擇權限</option>
											<option value="2">系統管理員</option>
											<option value="1">主考官</option>
											<option value="0">一般員工</option>
										</select>
									</div>
									<div style="float:left">
									<input type="hidden" name="empno" value="${EmpVO1.empno}">
									<input type="hidden" name="action" value="update">
									<input type="submit" value="確定" class="waves-effect waves-light btn">
									</div>
								</FORM>
							</td>
							<td>
								<FORM METHOD="post"	ACTION="<%=request.getContextPath()%>/emp/emp.do" name="form1">
									<input type="hidden" name="empno" value="${EmpVO1.empno}">
									<input type="hidden" name="action" value="delete"> 
									<input type="submit" value="刪除" class="waves-effect waves-light btn">
								</FORM>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</li>
		<li>
			<div class="collapsible-header">
				<i class="material-icons">whatshot</i>系統管理者
			</div>
			<div class="collapsible-body">
				<table class=table4_9 style="width: 800px">
					<tr>
						<th>員工編號</th>
						<th>員工姓名</th>
						<th>E-mail</th>
						<th>修改</th>
					</tr>

					<c:forEach var="EmpVO2" items="${list2}">
						<tr>

							<td>${EmpVO2.empno}</td>
							<td>${EmpVO2.empname}</td>
							<td>${EmpVO2.empemail}</td>
							<td>
								<FORM METHOD="post"	ACTION="<%=request.getContextPath()%>/emp/emp.do" name="form1">
									<div class="input-field col s12" style="float:left">
										<select name="position">
											<option value="" disabled selected>選擇權限</option>
											<option value="2">系統管理員</option>
											<option value="1">主考官</option>
											<option value="0">一般員工</option>
										</select>
									</div>
									<div style="float:left">
									<input type="hidden" name="empno" value="${EmpVO2.empno}">
									<input type="hidden" name="action" value="update">
									<input type="submit" value="確定" class="waves-effect waves-light btn">
									</div>
								</FORM>
							</td>

							<td>
								<FORM METHOD="post"	ACTION="<%=request.getContextPath()%>/emp/emp.do" name="form1">
									<input type="hidden" name="empno" value="${EmpVO2.empno}">
									<input type="hidden" name="action" value="delete"> 
									<input type="submit" value="刪除" class="waves-effect waves-light btn">
								</FORM>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</li>
	</ul>
	<a type="image" class="waves-effect waves-light btn modal-trigger" href="#modal1">新增</a>
	<div id="modal1" class="modal bottom-sheet">
		<div class="modal-content">
			<form class="col s12" METHOD="post"		ACTION="<%=request.getContextPath()%>/emp/emp.do">
				<div class="row">
					<div class="input-field col s6">
						<input id="last_name" type="text" name="empname" class="validate"
							value=""> <label for="last_name">姓名：</label>
					</div>
				</div>

				<div class="row">
					<div class="input-field col s12">
						<input id="email" type="email" name="empemail" class="validate"	value="">
						<label for="email">Email</label>
					</div>
				</div>
				<div class="input-field col s12">
					<select name="position">
						<option value="" disabled selected>Choose your position</option>
						<option value="2">系統管理員</option>
						<option value="1">主考官</option>
						<option value="0">一般員工</option>
					</select> <label>選擇權限</label>
				</div>

				<div class="modal-footer">
					<button class="btn waves-effect waves-light" type="submit" name="action" value="insert">
						Submit <i class="material-icons right">send</i>
					</button>
				</div>
			</form>

		</div>
		</div>
</body>
<script>
	$(document).ready(function() {
		$('.collapsible').collapsible({
			accordion : false,
		});
		$('.modal-trigger').leanModal();
		$('select').material_select();
	});
</script>
</html>