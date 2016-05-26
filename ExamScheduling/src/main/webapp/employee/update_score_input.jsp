<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="iii.team05.examinee.ecmodel.*"%>
<%
	ScoreVO scoreVO = (ScoreVO) request.getAttribute("scoreVO"); //EmpServlet.java (Concroller), 存入req的empVO物件 (包括幫忙取出的empVO, 也包括輸入資料錯誤時的empVO物件)
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>


<h3>資料修改:</h3>
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

<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/sco/sco.do" name="form1">
<table border="0">
	<tr>
		<td>員工編號:<font color=red><b>*</b></font></td>
		<td><%=scoreVO.getEcno()%></td>
	</tr>
	
	<tr>
		<td>姓名:</td>
		<td><input type="TEXT" name="scolab" size="45"	  value="<%=scoreVO.getLab()%> " readonly/></td>
	</tr>
	<tr>
		<td>E-MAIL:</td>
		<td><input type="TEXT" name="scoIV" size="45" value="<%=scoreVO.getInterview()%> " /></td>
	</tr>
	<tr>
		<td>權限:</td>
		<td><input type="TEXT" name="scoOL" size="45"	value="<%=scoreVO.getOnlineex()%>" /></td>
	</tr>

	
	
</table>
<br>
<input type="hidden" name="action" value="update">
<input type="hidden" name="empno" value="<%=scoreVO.getEcno()%>">
<input type="submit" value="送出修改"></FORM>

</body>
</html>
