<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="refresh" content="3 ; url='<%=request.getContextPath()%>/aboutedit'; charset=UTF-8">

<title>更新成功</title>
<style>
@import url('<%=request.getContextPath()%>/upload/uploadSuccess.css');
</style>
</head>
<body>
<h3>更新成功</h3>
<h4>過3秒後自動跳轉回後台編輯</h4>
<p><a href="<%=request.getContextPath()%>/aboutedit">或 直接點擊返回</a></p>
</body>
</html>