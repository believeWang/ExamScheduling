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

<link rel="stylesheet" type="text/css"
	href="css/preload.css" />
<style>
@import url('<%=request.getContextPath()%>/about/aboutedit.css');
</style>
<title>公司簡介 - 編輯頁面</title>
</head>
<body>
<!-- loading圖 -->
	<div id="loader-wrapper">
		<div id="loader"></div>

		<div class="loader-section section-left"></div>
        <div class="loader-section section-right"></div>

	</div>
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
					<input type=submit value="Submit"> <input type="hidden"
						name="action" value="Editor_Update"> <input type=button
						value="Cancel">
				</form>
			</div>
		</div>
	</div>
	</body>
	<script>
	$(document).ready(function(){

        $('body').addClass('loaded');
	});

	$('form').submit(function() {
	    	
	    	$('body').removeClass('loaded');
	    	return true; // return false to cancel form action
	    });
	</script>
</html>
