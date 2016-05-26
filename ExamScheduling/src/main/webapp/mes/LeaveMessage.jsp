<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
fieldset {
	width: 500px;
	border: 1px solid #acd6ff;
	margin: 100px auto 0;
	border-radius: 15px;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>考試預約系統Reception</title>
</head>
<body>
<%@ include file="/WEB-INF/header/header.jsp" %>
<div>
 <FORM METHOD="post" ACTION="mes.do" name="form1" >
<fieldset>
<legend>留言板</legend>
<table border="0">
	<tr>
		<td>姓名:</td>
		<td><input type="TEXT" name="msgname" size="40"  /></td>
	</tr>
	<tr>
		<td>e-mail:</td>
		<td><input type="TEXT" name="msgmail" size="40" /></td>
	</tr>
	<tr>
		<td>留言:</td>
		<td><textarea cols="40" rows="10" id="area1" name="msgcontent"></textarea></td>
	</tr>
</table>

<input type="hidden" name="action" value="leave">
<input type="submit" value="送出留言" style="width:70px;height:30px;border:2px blue none;background:red" ></fieldset></FORM>
<a href='ListAllMessage.jsp'><img src="<%=request.getContextPath()%>/mes/images/mes.png"/></a>
</div>
<c:if test="${status=='NG'}">
<script>alert("你在這裡當駭客，你媽知道嗎!")</script>
</c:if>
</body>
<script src='../js/jquery.min.js'></script>
<script src="../js/bootstrap.min.js"></script>
</html>

