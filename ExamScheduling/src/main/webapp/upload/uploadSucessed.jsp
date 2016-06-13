<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
@import url('<%=request.getContextPath()%>/upload/uploadSuccess.css');
</style>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.6/css/materialize.min.css">

<!--materialize ICON-->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<!--sweatAlert-->
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/sweetalert2/3.2.3/sweetalert2.min.css" />
<!--JQUERY-->
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<!--materialize-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.6/js/materialize.min.js"></script>

<!--sweetalert js  -->
<script src="https://cdn.jsdelivr.net/sweetalert2/3.2.3/sweetalert2.min.js"></script>

<!-- JQUERY表單驗證 -->
<script	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.15.0/jquery.validate.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>上傳成功</title>
</head>
<body>
<h3>上傳成功</h3>
<h4><a href="<%=request.getContextPath()%>/upload/poitest.jspx">回到上頁 班級列表</a></h3>
</body>
</html>