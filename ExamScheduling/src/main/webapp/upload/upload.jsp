<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<script src="https://code.jquery.com/jquery.min.js"></script>
<link
	href="https://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css"
	rel="stylesheet" type="text/css" />
<script
	src="https://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
	rel="stylesheet" type="text/css" />
<title>班級表單上傳與下載</title>
<style type="text/css">
html {
	padding-left: 10%;
	padding-right: 10%;
}
</style>
</head>
<body>
	<h2>班級表單上傳與下載</h2>
	<hr>
	<div class="row">
		<div class="col-md-3">
			<div>
				<h4>班級列表</h4>
				<table>
					<c:forEach var="showclasslist" items="${allClass}"
						varStatus="loopCounter">
						<tr>

							<td><a href="poitest.jspx?iiiClass=${showclasslist}">${showclasslist}</a></td>

						</tr>
					</c:forEach>
				</table>
			</div>
			<div>
				<h4>上傳新班級名單</h4>
				<form action="poitest.jspx?_m=poi_upload" method="post"
					enctype="multipart/form-data">
					<input type="file" name="file"> <input type="submit"
						value="上傳" class="btn btn-info">
				</form>
				<hr>
			</div>
		</div>
		<div class="col-md-9">
			<div>
				<h2>班級詳細資料</h2>
				<p>show all students of this class</p>
				<div>
					<c:forEach var="showClass" items="${showClass}">
						<tr>

							<td>${showClass}</td>

						</tr>
					</c:forEach>
				</div>
				<a href="poitest.jspx?_m=poi_down">下载目前班級為Excel檔</a>
			</div>
		</div>
	</div>

</body>
</html>