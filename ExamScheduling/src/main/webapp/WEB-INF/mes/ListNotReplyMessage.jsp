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
</head>
<body>

     <%@ include file="/mes/header.jsp" %>



<table align='center' border="1px">
<c:forEach var="mesVO" items="${list}" varStatus="status">
<tr>
<th>留言者姓名</th>
<th>留言者信箱</th>
<th>留言時間</th>

</tr>
<tr>
<td>${mesVO.msgname}</td>
<td>${mesVO.msgmail}</td>
<td>${mesVO.msgtime}</td>

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