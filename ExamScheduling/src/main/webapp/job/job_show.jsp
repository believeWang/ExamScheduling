<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改職缺</title>
<!-- jQuery -->
<!-- <script src='../js/jquery.min.js'></script> -->
<%@ include file="../WEB-INF/cdn.file" %>
<!-- Bootstrap -->
<link href="../css/bootstrap.min.css" rel="stylesheet">
<!-- 依需要參考已編譯外掛版本（如下），或各自獨立的外掛版本 -->
<script src="../js/bootstrap.min.js"></script>


</head>
<body>
<%@ include file="../WEB-INF/header/sa_slidenav.jsp" %>
<div class="container-fluid">
	
	<div class="row">
	  	
	  	<div class="col-md-3"></div>
	  	
	  	<div class="col-md-6">
	  		<h3 class="text-center">職位</h3>
	  		<table class="table  table-bordered">
	  		<form action="JobSaveServlet" name="form1" method="post">
	  		<input type="hidden" name="action" value="edit">
	  		<input type="hidden" name="jobid" value="${jobid}">
	  			<tr>
	  				<td>職位名稱：</td><td><input type="text" name="jobname" value="${jobname}"  class="form-control"></td>
	  			</tr>
	  			<tr>
	  				<td>負責主考官：</td>
	  				<td>
	  					<select name="empno" class="form-control">
	  						<c:forEach var="emp" items="${emplists}" >
	  							<c:forEach var="empno" items="${empno}" >
	  							<option value="${emp.empno}" <c:if test="${emp.empno == empno.empno}">selected</c:if>>${emp.empname}</option>
	  							</c:forEach>
	  						</c:forEach>
	  					</select>
	  					
  					</td>
	  			</tr>
	  			<tr>
	  				<td>職位預約顏色：</td><td><input type="color" name="jobcolor" value="${jobVO.jobcolor}"></td>
	  			</tr>
	  			<tr>
	  				<td>啟用：</td>
	  				
	  				<td>
<%-- 	  					<input type="checkbox" name="jobactive" value="1" <c:if test="${jobVO.jobactive == true}">checked</c:if> > --%>
	  					
	  					<p>
					      <input type="checkbox" id="test5" name="jobactive" value="1" <c:if test="${jobVO.jobactive == true}">checked</c:if> />
					      <label for="test5"></label>
					    </p>
	  					
	  				</td>
	  				
	  			</tr>
	  			<tr>
	  				<td><input type="submit" value="送出"  class="btn btn-primary"></td><td></td>
	  			</tr>
  			</form>
	  		</table>
	  	</div>
	  	
	  	<div class="col-md-3"></div>
	
	</div>

</div>

</body>
</html>
