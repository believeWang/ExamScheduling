<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="iii.team05.mes.model.*"%>
<%
    MesService mesSvc = new MesService();
    List<MesVO> list = mesSvc.getNotReply();
    pageContext.setAttribute("list",list);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>考試預約系統Backstage</title>
		<style>
       @import url('<%=request.getContextPath()%>/mes_css/main.css');
		</style>
</head>
<body>

     	<header>
 		 <img src="<%=request.getContextPath()%>/mes_images/logo.jpg" style="float:left" />  
 		 <nav>
       		<ul id="menu">	   
       	  	      <li><a href="<%=request.getContextPath()%>/index.jsp">輸入成績</a></li>
       		      <li><a href="<%=request.getContextPath()%>/index.jsp">編輯考題</a></li>
		  	      <li><a href="<%=request.getContextPath()%>/mes/ListNotReplyMessage.jsp">留言板</a></li>
       		</ul>
       	</nav>       	
       </header>



<table align='center' border="1px">
<c:forEach var="mesVO" items="${list}" varStatus="status">
<tr>
<td>留言者姓名:</td><td>${mesVO.msgname}</td>
</tr>
<tr>
<td>留言者信箱</td><td>${mesVO.msgmail}</td>
</tr>
<tr>
<td>留言時間</td><td>${mesVO.msgtime}</td>
</tr>
<tr>
<td  colspan="2">${mesVO.msgcontent}</td>
</tr>

<td>

			     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/mes/mes.do">
			     <input type="submit" value="回覆">
			     <input type="hidden" name="messageid" value="${mesVO.messageid}">
			     <input type="hidden" name="action"	value="getOne_Not_RePlay_Message"></FORM>
</td>

</c:forEach>
</table>

</body>
</html>