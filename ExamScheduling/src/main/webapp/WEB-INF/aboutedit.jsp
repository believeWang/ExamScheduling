<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE>
<html>
<head>
<%@ include file="cdn.file"%>



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
	<%@ include file="/WEB-INF/header/sa_slidenav.jsp"%>
	<div class="row editarea">
		<div class="col s11 offset-s2">
			<h3>公司簡介 - 編輯頁面</h3>
			<hr>
			<br>
			<div>
				<form METHOD="post" ACTION="/ExamScheduling/aboutedit">
					<textarea class="ckeditor" cols="20" id="content" name=content
						rows="60">${about}</textarea>
					<input type=submit value="儲存送出"> <input type="hidden"
						name="action" value="Editor_Update"> <input type=button
						value="取消">
				</form>
			</div>
		</div>
	</div>
</html>
