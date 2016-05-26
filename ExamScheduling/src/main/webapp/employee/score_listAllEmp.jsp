<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="iii.team05.examinee.ecmodel.*"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>

<% 
 ScoreVO scoreVO = (ScoreVO) request.getAttribute("scoreVO");
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style>
@import url('<%=request.getContextPath()%>/employee/main.css');
</style>
<body>
<%@ include file="/mes/sa_header.jsp" %>
<div><fieldset>
			<legend>學員分數輸入</legend>

<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/sco/sco.do" name="form1">
<table class=table4_9>
	<tr>
		<td>學號:<font color=red><b>*</b></font></td>
		<td><%=scoreVO.getEcno()%></td>
	</tr>
	
	
	<tr>
		<td>上機考:</td>
		<td><input type="TEXT" name="lab" size="45"	 value="<%=scoreVO.getLab()%> " /></td>
	</tr>
	<tr>
		<td>面試分數:</td>
		<td><input type="TEXT" name="interview" size="45"	value="<%=scoreVO.getInterview()%> " /></td>
	</tr>
	<tr>
		<td>線上測驗分數:</td>
		<td><input type="TEXT" name="onlineex" size="45"	value="<%=scoreVO.getOnlineex()%>" /></td>
	</tr>
<tr>
		<td>測驗時間:</td>
		<td><input type="TEXT" name="labtime" size="45"	value="<%=scoreVO.getLabtime()%>" readonly/></td>
	</tr>

	
	
</table>
<br>
<input type="hidden" name="action" value="update">
<input type="hidden" name="ecno" value="<%=scoreVO.getEcno()%>">
<input type="submit" value="送出修改"></FORM>
</fieldset></div>
</body>

</html>
