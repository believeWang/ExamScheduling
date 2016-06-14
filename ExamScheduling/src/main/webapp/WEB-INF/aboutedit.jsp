<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE>
<html>
<head>
<%@ include file="cdn.file"%>

<%@ include file="header/slide_mqtt.file"%>

<script type="text/javascript"
	src="<%=request.getContextPath()%>/ckeditor/ckeditor.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.6/css/materialize.min.css">

<style>
@import url('<%=request.getContextPath()%>/about/aboutedit.css');
</style>
<title>公司簡介 - 編輯頁面</title>
</head>
<body>
	<%@ include file="/WEB-INF/header/slidenav.jsp"%>

	<h3>公司簡介 - 編輯頁面</h3>
	<hr>
	<br>
	<div>
		<form METHOD="post" ACTION="/ExamScheduling/aboutedit">
			<textarea class="ckeditor" cols="80" id="content" name=content
				rows="60">${about}</textarea>
			<input type=submit value="Submit"> <input type="hidden"
				name="action" value="Editor_Update"> <input type=button
				value="Cancel">
		</form>
	</div>
</html>
