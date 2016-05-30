<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="<%=request.getContextPath()%>/ckeditor/ckeditor.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Edit mail</title>
</head>
<body>
<h2>E-mail-編輯頁面</h2>
<FORM METHOD="get" ACTION="/ExamScheduling/setting/editmail"  >
<textarea class="ckeditor" cols="80" id="content" name=content rows="12">${mail}</textarea>
<input type=submit value="Submit">
<input type="hidden" name="action" value="Mail_Content_Update">
<input type=button value="Cancel">
</FORM>
</body>
</html>


