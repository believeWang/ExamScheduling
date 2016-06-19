<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/cdn.file" %>
<script type="text/javascript" src="<%=request.getContextPath()%>/ckeditor/ckeditor.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Edit mail</title>
<body>
<%@ include file="/WEB-INF/header/sa_slidenav.jsp" %>
<div class="row">
  <div class="col s10 offset-s2">
<h2>E-mail-編輯頁面</h2>
<FORM METHOD="get" ACTION="/ExamScheduling/setting/editmail"  >

<textarea class="ckeditor" cols="80" id="subject" name=subject rows="12">${mail}</textarea>
<!-- <input type=submit value="送出"> -->
<button class="waves-light btn" type="submit" style="">
						送出<i class="material-icons right">input</i>
							</button>
<input type="hidden" name="action" value="Mail_Subject_Update">
</FORM>
</div>
</div>
</body>
</html>


