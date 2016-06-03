<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
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
<input type=submit value="Submit">
<input type="hidden" name="action" value="Editor_Update">
<input type=button value="Cancel">
<script>
// 		CKEDITOR.replace( 'content', {
// 			height: 260
// 		} );
	</script>
</FORM>
</html>