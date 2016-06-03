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

<!-- 單獨取出mail內文寫法 -->
<!-- <input type=submit value="讀取mail內文" > -->
<!-- <input type="hidden" name="action" value="Mail_Content_Query"> -->


<!-- 利用java script onchange做下拉選單給值抓資料庫寫法 -->
<select name="action" onchange="functionname(this.options[this.options.selectedIndex].value)">
<option value="">請選擇</option>
<option value="Mail_Content_Query">修改mail內文</option>
<option value="Mail_Subject_Query">修改mail主旨</option>
</select> 
<input type=submit value="讀取" >

</FORM> 
</body>
</html>


