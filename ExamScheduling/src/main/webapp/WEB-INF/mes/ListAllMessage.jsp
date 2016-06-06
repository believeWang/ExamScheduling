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
<%@ include file="/WEB-INF/cdn.file"%>
<style type="text/css">
.line-separator{
height:1px;
background:#717171;
border-bottom:1px solid #313030;
}
</style>
<script type="text/javascript">
	$(function() {
		$("[data-toggle='tooltip']").tooltip();
		$("td[id^='content']").hide();
	});
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>考試預約系統Reception</title>
</head>
<body>
	<%@ include file="/WEB-INF/header/header.jsp"%>
	<div style="margin: 50px 500px">
		<table class="table">
			<tr>
				<th>刪除</th>
				<th>留言者姓名</th>
				<th>留言者e-mail</th>
				<th>留言時間</th>
				<th>回覆狀態</th>
			</tr>
			<%@ include file="page1.file"%>
			<c:forEach var="mesVO" items="${list}" begin="<%=pageIndex%>"
				end="<%=pageIndex+rowsPerPage-1%>" varStatus="counter">
				<tr align='center' valign='middle'>
					<td>
						<FORM METHOD="post"
							ACTION="<%=request.getContextPath()%>/mes/mes.do">
							<button class="red lighten-1 waves-light" type="submit">
								刪除<i class="material-icons left">delete</i>
							</button>
							<input type="hidden" name="messageid" value="${mesVO.messageid}">
							<input type="hidden" name="action" value="delete">
						</FORM>
					</td>
					<td>${mesVO.msgname}</td>
					<td>${mesVO.msgmail}</td>
					<td>${mesVO.msgtime}</td>
					<c:choose>
							<c:when test="${mesVO.rpcontent==null}">
							<td>
								<h5 style="color: blue">尚未處理</h5>
							</td>
							</c:when>
							<c:otherwise>
								<td>
								<button class="cyan lighten-1 waves-light " type="submit"
									onclick="$('#content${counter.index}').slideToggle(100);">
									已回覆<i class="material-icons right">label</i>
								</button>
								</td>
								<tr>
									<td colspan="5" id="content${counter.index}">

										留言時間:${mesVO.msgtime}&nbsp;<br> 考生 ${mesVO.msgname}:<br>
										${mesVO.msgcontent}<br>
										<div class="line-separator"></div> 
										<br>
										回覆時間:${mesVO.rptime}<br> 考生 ${mesVO.rpname}:<br>
										${mesVO.rpcontent}<br>


									</td>
								</tr>
							</c:otherwise>
						</c:choose>

				</tr>
			</c:forEach>
		</table>

		<%@ include file="page2.file"%>
	</div>
	<div class="fixed-action-btn horizontal "
		style="bottom: 45px; right: 24px;">
		<a class="btn-floating btn-large red"> <i
			class="large material-icons">contact_phone</i>
		</a>
		<ul>
			<li><a href='<%=request.getContextPath()%>/MesTurn?turn=LM'
				class="btn-floating green" data-toggle="tooltip" title="留言"><i
					class="material-icons">library_add</i></a></li>
			<li><a href='<%=request.getContextPath()%>/MesTurn?turn=MQTT'
				class="btn-floating blue darken-1" data-toggle="tooltip"
				title="即時通訊"><i class="material-icons">question_answer</i></a></li>
		</ul>
	</div>

</body>
</html>