<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="iii.team05.mes.model.*"%>
<%
    MesService mesSvc = new MesService();
    List<MesVO> list = mesSvc.getAll();
    pageContext.setAttribute("list",list);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>考試預約系統Reception</title>
	<style>
       @import url('<%=request.getContextPath()%>/mes_css/main.css');     
	</style>
</head>
<body>
     	<header>
 		 <nav>
       		<img src="<%=request.getContextPath()%>/mes_images/logo.jpg" style="float:left" />  
       		<ul id="menu">	  			   
       	 	    <li><a href="<%=request.getContextPath()%>/index.jsp">預約考試</a></li>
       		    <li><a href="<%=request.getContextPath()%>/index.jsp">前往考試</a></li>
       		    <li><a href="<%=request.getContextPath()%>/index.jsp">關於偉康</a></li>
       		    <li><a href="<%=request.getContextPath()%>/mes/LeaveMessage.jsp">聯絡我們</a></li>
       		</ul>
       	</nav>       	
       </header>

<table border='1' bordercolor='#CCCCFF' width='800'>
	<tr>
		<th>刪除</th>
		<th>留言者姓名</th>
		<th>留言者e-mail</th>
		<th>留言時間</th>
		<th>回覆狀態</th>	
	</tr>
	<%@ include file="page1.file" %> 
	<c:forEach var="mesVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		<tr align='center' valign='middle'>
			<td>
			    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/mes/mes.do">
			 	<input type="submit" value="刪除">
			    <input type="hidden" name="messageid" value="${mesVO.messageid}">
			    <input type="hidden" name="action"	value="delete">
			    </FORM>
			</td>
			<td>${mesVO.msgname}</td>
			<td>${mesVO.msgmail}</td>
			<td>${mesVO.msgtime}</td>
			<td>
		<c:choose>
			<c:when test="${mesVO.rpcontent==null}">
			
			 <h5 style="color:blue ">尚未處理</h5>
			 </c:when>
			  <c:otherwise>
			   <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/mes/mes.do">
			     <input type="submit" value="查看留言">
			     <input type="hidden" name="messageid" value="${mesVO.messageid}">
			     <input type="hidden" name="action"	value="getOne_For_Message"></FORM>
			 </c:otherwise>
			</c:choose>
			</td>
		</tr>
	</c:forEach>
</table>

<%@ include file="page2.file" %>
<a href='LeaveMessage.jsp'><input type="button" value="繼續留言" ></a>

</body>
</html>