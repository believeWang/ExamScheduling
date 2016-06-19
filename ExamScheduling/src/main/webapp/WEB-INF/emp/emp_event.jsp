<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>主考官預約管理</title>
<%@ include file="../../WEB-INF/cdn.file" %>
<%@ include file="/WEB-INF/header/slide_mqtt.file" %>
<script>
	$(document).ready(function(){
		
	});
</script>
</head>
<body>
<%@ include file="../../WEB-INF/header/slidenav.jsp" %>

	<table>
		<tr>
			<td>序號</td>
			<td>報名時間</td>
			<td>預約標題</td>
			<td>考生名稱</td>
			<td>備註</td>
			<td>預約狀態</td>
			<td></td>
		</tr>
		<c:forEach var="enentVO" items="${eventVOlists}">
		<tr>
			<td>${enentVO.eventid}</td>
			<td>substring(${enentVO.starttime},0,3)</td>
			<td>${enentVO.title}</td>
			<td>
				<c:forEach var="ecVO" items="${ecVOlists}">
					<c:if test="${ecVO.ecno == enentVO.ecno}">${ecVO.ecname}</c:if>
				</c:forEach>
			</td>
			<td>${enentVO.eventremark}</td>
			<td></td>
			<td>修改</td>
		</tr>
		</c:forEach>
	</table>

</body>
</html>
