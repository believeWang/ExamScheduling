<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="<%=request.getContextPath()%>/ckeditor/ckeditor.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Edit頁面</title>
</head>
<body>
<h2>關於偉康-編輯頁面</h2>

<textarea class="ckeditor" cols="80" id="content" name=content rows="12"></textarea>
<input type=button value="Submit">
</html>