<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改時段</title>
<!-- jQuery -->
<!-- <script src='../js/jquery.min.js'></script> -->
<%@ include file="../WEB-INF/cdn.file" %>

<!-- Bootstrap -->
<link href="../css/bootstrap.min.css" rel="stylesheet">
<!-- 依需要參考已編譯外掛版本（如下），或各自獨立的外掛版本 -->
<script src="../js/bootstrap.min.js"></script>
<!-- jQuery UI -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<!-- <script src="//code.jquery.com/jquery-1.10.2.js"></script> -->
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>

</head>
<body>
<%@ include file="../WEB-INF/header/sa_slidenav.jsp" %>
<div class="container-fluid">
	
	<div class="row">
	  	
	  	<div class="col-md-3"></div>
	  	
	  	<div class="col-md-6">
	  		<h3 class="text-center">預約時段設定</h3>
<!-- 	  	<a href="SectionDoServlet?action=add" id="create-section"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增</a>
	  		<div id="users-contain" class="ui-widget"><!-- start -->
	  		<form action="SectionSaveServlet" method="post">
	  		<input type="hidden" name="action" value="modify">
	  		<input type="hidden" name="id" value="${sectionVO.sectionid}">
	  		<table id="users" class="table  table-bordered">
				<tr>
					<td>時段</td>
					<td>
						小時：
						<select name="hour" class="form-control">
							<c:forEach var="i" begin="1" end="24">
								<option value="${i}" <c:if test="${time_array[0] == i}">selected</c:if> >${i}</option>
							</c:forEach>
						</select>
						分鐘：
						<select name="minute" class="form-control">
							<c:forEach var="i2" begin="00" end="60" step="10">
								<option value="${i2}" <c:if test="${time_array[1] == i2}">selected</c:if> >${i2}</option>
							</c:forEach>
							
						</select>
						
					</td>
				</tr>
	  			<tr>
					<td>啟用</td>
					<td>
<%-- 						<input type="checkbox" name="sectionStatus" value="1" <c:if test="${sectionVO.sectionStatus == true}">checked</c:if> /> --%>

							<p>
						      <input type="checkbox" id="test5" name="sectionStatus" value="1" <c:if test="${sectionVO.sectionStatus == true}">checked</c:if> />
						      <label for="test5"></label>
						    </p>					
					
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="送出" class="btn btn-primary"/>
					</td>
				</tr>
	  		</table>
	  		</form>
	  		</div><!-- end -->
	  	</div>
	  	
	  	<div class="col-md-3"></div>
	
	</div>

</div>
</body>
</html>