<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

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
	height: 100%;
	width: 100%;
	margin: 0;
	padding-left: 10%;
	padding-right: 10%;
}
</style>
</head>
<body>
	<h2>班級表單上傳與下載</h2>
	<a href="poitest.jspx?_m=poi_down">下载</a>
	<br>
	<hr>
	<form action="poitest.jspx?_m=poi_upload" method="post"
		enctype="multipart/form-data">
		<input type="file" name="file"> <input type="submit"
			value="上傳" class="btn btn-info">
	</form>
</body>
</html>