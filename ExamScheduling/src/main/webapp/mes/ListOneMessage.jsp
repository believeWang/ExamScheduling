<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="iii.team05.mes.model.*"%>
<%
MesVO mesVO = (MesVO) request.getAttribute("mesVO"); 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>考試預約系統Reception</title>
		<style>
       @import url('<%=request.getContextPath()%>/mes/css/main.css');
		</style>
</head>
<body>
     	<header>
 		        		<img src="<%=request.getContextPath()%>/mes/images/logo.png" style="float:left" />  

 		 <nav>
       		<ul id="menu">	   
       	  	      <li><a href="<%=request.getContextPath()%>/index.jsp">輸入成績</a></li>
       		      <li><a href="<%=request.getContextPath()%>/index.jsp">編輯考題</a></li>
		  	      <li><a href="<%=request.getContextPath()%>/mes/ListNotReplyMessage.jsp">留言板</a></li>
       		</ul>
       	</nav>       	
       </header>



<table border='1' bordercolor='#CCCCFF' width='600'>
	<tr>
		<th>留言者姓名</th>
		<th>留言者MAIL</th>
		<th>留言時間</th>
		<th>留言內容</th>
		<th>回覆者</th>
		<th>回覆時間</th>
		<th>回覆內容</th>
	</tr>
	<tr align='center' valign='middle'>
		<td><%=mesVO.getMsgname()%></td>
		<td><%=mesVO.getMsgmail()%></td>
		<td><%=mesVO.getMsgtime()%></td>
		<td><%=mesVO.getMsgcontent()%></td>
		<td><%=mesVO.getRpname()%></td>
		<td><%=mesVO.getRptime()%></td>
		<td><%=mesVO.getRpcontent()%></td>
	</tr>
</table>
<a href='ListAllMessage.jsp'><input type="button" value="查看所有留言"></a>
<a href='LeaveMessage.jsp'><input type="button" value="繼續留言"></a>
</body>
</html>