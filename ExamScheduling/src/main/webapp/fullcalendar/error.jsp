<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%    request.setCharacterEncoding("UTF-8");  %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="iii.team05.job.model.*"%>
<%-- 此頁採用 JSTL 與 EL 取值 --%>


<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="/ExamScheduling/css/preload.css" />
<%@ include file="/WEB-INF/cdn.file"%>

<%@ include file="/WEB-INF/header/header_resourse.file" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<!-- <script src='../js/jquery.min.js'></script> -->
<link href='../css/fullcalendar.css' rel='stylesheet' />
<script src='../js/moment.min.js'></script>
<script src='../js/fullcalendar.min.js'></script>
<!--jquery.ui 裡日期插件-->
<script src='http://code.jquery.com/ui/1.10.3/jquery-ui.js'></script>
<!-- Bootstrap -->
<link href="../css/bootstrap.min.css" rel="stylesheet">
<!-- 依需要參考已編譯外掛版本（如下），或各自獨立的外掛版本 -->
<script src="../js/bootstrap.min.js"></script>
<!--燈箱樣式效果-->
<link rel="stylesheet" type="text/css" href="../css/jquery.fancybox.css">
<script src='../js/jquery.fancybox.js'></script>


<style type="text/css">
	#calendar{width:960px; margin:20px auto 10px auto}
	.fancy{width:450px; height:auto}
	.fancy h4{line-height:30px; border-bottom:1px solid #d3d3d3;}
* 	.fancy h3{height:30px; line-height:30px; border-bottom:1px solid #d3d3d3; font-size:14px} */
	.fancy form{padding:10px}
/* 	.fancy p{height:28px; line-height:28px; padding:4px; color:#999} */
/* 	.input{height:20px; line-height:20px; padding:2px; border:1px solid #d3d3d3; width:100px} */
/* 	.btn{-webkit-border-radius: 3px;-moz-border-radius:3px;padding:5px 12px; cursor:pointer} */
/* 	.btn_ok{background: #360;border: 1px solid #390;color:#fff} */
/* 	.btn_cancel{background:#f0f0f0;border: 1px solid #d3d3d3; color:#666 } */
 	.btn_del{background:#f90;border: 1px solid #f80; color:#fff } 
 	.sub_btn{height:32px; line-height:32px; padding-top:6px; border-top:1px solid #f0f0f0; text-align:right; position:relative} 
 	.sub_btn .del{position:absolute; left:2px} 
 	
	.ilike-blue-container {
	    @extend .blue, .lighten-4;
	}
</style>
<script>

</script>
<style>
	#wrapper{
/* 		margin: 0px auto;  */
	}
	h1{
		font-weight:bold;
	}
</style>
</head>
<body>
    <%@ include file="../WEB-INF/header/header.jsp" %> 
    <div align="center" style="margin-top: 300px">
	    <div>
	    	<img src="../images/close-.png">
	    </div>
	    <div>
	    	<h1>暫時沒有開放職缺。</h1>
	    </div>
    </div>
    <%@ include file="../WEB-INF/header/footer.jsp" %> 
</body>
</html>
