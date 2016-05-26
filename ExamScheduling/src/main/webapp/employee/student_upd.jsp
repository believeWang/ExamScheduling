<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="iii.team05.examinee.ecmodel.*"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>

<%
    ECHibernateDAO empSvc = new ECHibernateDAO();
    List<ECVO> list = empSvc.getAll();
    pageContext.setAttribute("list",list);
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>


<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font color='red'>請修正以下錯誤:
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li>${message}</li>
		</c:forEach>
	</ul>
	</font>
</c:if>

<table border='1' bordercolor='#CCCCFF' width='800'>
	<tr>
		<th>學號</th>
		<th>學生姓名</th>
		<th>E-mail</th>
		<th>上機考試</th>
		<th>面試成績</th>
		<th>線上測驗分數</th>
		<th>備註</th>
		<th>查詢</th>
<!-- 		<th>修改</th> -->		
	</tr>
	<%@ include file="page1.file" %> 
	<c:forEach var="ECVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
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
			  
			     <input type="submit" value="修改分數">
			     <input type="hidden" name="ecno" value="${ECVO.ecno}">
			     <input type="hidden" name="action"	value="score_Update">
			    
			  </FORM>
			</td>
			
<!-- 			<td> -->
<%-- 			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/Student_select.do"> --%>
<!-- 			     <input type="submit" value="修改"> -->
<%-- 			     <input type="hidden" name="ecno" value="${ECVO.ecno}"> --%>
<!-- 			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM> -->
<!-- 			</td> -->
			
		</tr>
	</c:forEach>
	
	
	
	
</table>
<%@ include file="page2.file" %>

</body>
</html>
