<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE>
<html>
<head>
<script src="https://code.jquery.com/jquery.min.js"></script>
  <link href="https://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet" type="text/css" />
  <script src="https://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript"
	src="//cdn.ckeditor.com/4.5.9/full/ckeditor.js"></script>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<style>
    	 @import url('<%=request.getContextPath()%>/mes/css/main.css');  
	</style>
<title>Edit頁面</title>
</head>
<body>


<h2>公司簡介 - 編輯頁面</h2>
<hr>
<br>
<FORM METHOD="post" ACTION="/ExamScheduling/aboutedit"  >
<textarea class="ckeditor" cols="80" id="content" name=content rows="12">${about}</textarea>
<input type=submit value="Submit" >
<input type="hidden" name="action" value="Editor_Update"> 
<input type=button value="Cancel">

</FORM>
</html>
