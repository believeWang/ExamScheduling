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
<%@ include file="/WEB-INF/cdn.file"%>

<script type="text/javascript">
	$(function() {
		$("td[id^='content']").hide();
	});
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>考試預約系統Backstage</title>
</head>
<body>
 <%@ include file="/mes/header.jsp" %>
	<div style="margin: 50px 500px">
		<table class="table">
			<tr>
				<th>留言者姓名</th>
				<th>留言者信箱</th>
				<th>留言時間</th>

			</tr>
			<c:forEach var="mesVO" items="${list}" varStatus="counter">

				<tr>
					<td>${mesVO.msgname}</td>
					<td>${mesVO.msgmail}</td>
					<td>${mesVO.msgtime}</td>

					<td>
						<%-- 			     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/mes/mes.do"> --%>
						<button class="cyan lighten-1 waves-light " type="submit"
							onclick="$('#content${counter.index}').slideToggle(100);">
							回覆<i class="material-icons right">label</i>
						</button> <%-- 			     <input type="hidden" name="messageid" value="${mesVO.messageid}"> --%>
						<!-- 			     <input type="hidden" name="action"	value="getOne_Not_RePlay_Message"></FORM> -->
					</td>
					<tr>
					<td colspan ="4" id="content${counter.index}">
						${mesVO.msgcontent}<br>
					<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/mes/mes.do">
							<textarea cols="40" rows="5" id="area1" name="rpcontent" class="materialize-textarea"></textarea>
							<input type="hidden" name="messageid" value="${mesVO.messageid}">
							<input type="hidden" name="msgname" value="${mesVO.msgname}">
							<input type="hidden" name="msgmail" value="${mesVO.msgmail}">
							<input type="hidden" name="msgtime" value="${mesVO.msgtime}">
							<input type="hidden" name="msgcontent" value="${mesVO.msgcontent}">
							<input type="hidden" name="action" value="reply">
							<input type="hidden" name="rpname" value="${GoogleUser}">
							<button class="light-blue darken-2 waves-light btn" type="submit" style="float: right;">送出<i class="material-icons right">mode_edit</i>
							</button>
					</FORM>
					</td>		
				</tr>
				</c:forEach>
</table>
</div>
</body>
</html>