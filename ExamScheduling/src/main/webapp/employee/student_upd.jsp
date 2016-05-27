<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="iii.team05.examinee.ecmodel.*"%>
<%-- �����m�߱ĥ� EL ���g�k���� --%>

<%
    ECHibernateDAO empSvc = new ECHibernateDAO();
    List<ECVO> list = empSvc.getAll();
    pageContext.setAttribute("list",list);
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>�ǥ͸�T</title>
</head>
<style>
@import url('<%=request.getContextPath()%>/employee/main.css');
</style>

<body>
<%@ include file="/mes/sa_header.jsp" %>
<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
	<font color='red'>�Эץ��H�U���~:
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li>${message}</li>
		</c:forEach>
	</ul>
	</font>
</c:if>
<div ><fieldset> 
					<legend>�ǥ͸�T</legend>
<table  class=table4_9  style="width:800px;" >
	<tr>
		<th>�Ǹ�</th>
		<th>�ǥͩm�W</th>
		<th>E-mail</th>
		<th>�W���Ҹ�</th>
		<th>���զ��Z</th>
		<th>�u�W�������</th>
		<th>�Ƶ�</th>
		<th>�d��</th>
<!-- 		<th>�ק�</th> -->		
	</tr>
	<%@ include file="page1.file" %> 
	<c:forEach var="ECVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
<%-- 	<c:forEach var="ECVO" items="${list}" > --%>
		<tr align='center' valign='middle'>
			<td>${ECVO.ecno}</td>
			<td>${ECVO.ecname}</td>
			<td>${ECVO.ecemail}</td>
			<td>${ECVO.scoreVO.lab}</td>
			<td>${ECVO.scoreVO.interview}</td>
			<td>${ECVO.scoreVO.onlineex}</td>
			<td>${ECVO.ecremark1}</td>
		
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/sco/sco.do">
			  
			     <input type="submit" value="�ק����">
			     <input type="hidden" name="ecno" value="${ECVO.ecno}">
			     <input type="hidden" name="action"	value="score_Update">
			    
			  </FORM>
			</td>
						
		</tr>
	</c:forEach>
	
	</fieldset></div>
	
	
</table>
<%@ include file="page2.file" %>

</body>
</html>
