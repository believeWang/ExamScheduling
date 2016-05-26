<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="iii.team05.mes.model.*"%>
<%
MesVO mesVO = (MesVO) request.getAttribute("mesVO"); 
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>考試預約系統Reception</title>
</head>
<body>
     
<%@ include file="/WEB-INF/header/header.jsp" %>


<div style="border: 3px solid #acd6ff;width:500px;margin:50px 500px">
留言時間:<%=mesVO.getMsgtime()%>&nbsp;<br>
考生 <%=mesVO.getMsgname()%>:<br>
<%=mesVO.getMsgcontent()%><br>
<hr>
回覆時間:<%=mesVO.getRptime()%><br>
<%=mesVO.getRpname()%>:<br>
<%=mesVO.getRpcontent()%><br>
</div>
<div style="width:500px;margin:0px 500px ">
<a href='ListAllMessage.jsp'><input type="button" value="查看所有留言"></a>
<a href='LeaveMessage.jsp'><input type="button" value="繼續留言"></a>
</div>
</body>
</html>