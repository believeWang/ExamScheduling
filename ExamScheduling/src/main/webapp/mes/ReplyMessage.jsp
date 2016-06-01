<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@ page import="iii.team05.mes.model.*"%>
<%
MesVO mesVO = (MesVO) request.getAttribute("mesVO"); 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>考試預約系統Backstage</title>
<style type="text/css">

</style>
</head>
<body>
<%@ include file="header.jsp" %>

<FORM METHOD="post" ACTION="mes.do" name="form2">
<table align='center' border="1px">
<tr>
<td>留言者姓名:</td><td><input type="TEXT" name="msgname" size="45" value="<%=mesVO.getMsgname()%>" readonly="readonly" /></td>
</tr>
<tr>
<td>留言者信箱</td><td><input type="TEXT" name="msgmail" size="45" value="<%=mesVO.getMsgmail()%>" readonly="readonly"/></td>
</tr>
<tr>
<td>留言時間</td><td><input type="TEXT" name="msgtime" size="45" value="<%=mesVO.getMsgtime()%>" readonly="readonly"/></td>
</tr>
<tr>
<td  colspan="2"><input type="TEXT" name="msgcontent" size="45" value="<%=mesVO.getMsgcontent()%>" readonly="readonly"/></td>
</tr>

</table>


<fieldset>
<table border="0">
	<tr>
		<td>姓名:</td>
		<td><input type="TEXT" name="rpname" size="40"  value="主考官 ${GoogleUser}" readonly="readonly"/></td>
	</tr>
	<tr>
		<td>回覆:</td>
		<td><textarea cols="40" rows="5" id="area1" name="rpcontent"></textarea></td>
	</tr>
</table>

<input type="hidden" name="messageid" value="<%=mesVO.getMessageid()%>">
<input type="hidden" name="action"	value="reply">
<input type="submit" value="送出回覆" style="width:70px;height:30px;border:2px blue none;background:red" ></fieldset></FORM>


</body>
</html>

