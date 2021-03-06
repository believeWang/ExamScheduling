<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="iii.team05.mes.model.*"%>
<%

	String msgemail=String.valueOf(session.getAttribute("ExamEmail"));
	
	MesService mesSvc = new MesService();
//     List<MesVO> list = mesSvc.getAll();
    List<MesVO> list = mesSvc.findByPrimaryKey(msgemail);
//     System.out.println("list:"+list.size());
    pageContext.setAttribute("list",list);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/cdn.file"%>
<%@ include file="/WEB-INF/header/header_resourse.file" %>
<link rel="stylesheet" type="text/css"
	href="/ExamScheduling/css/preload.css" />
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
	<!-- loading圖 -->
	<div id="loader-wrapper">
		<div id="loader"></div>
		<div class="loader-section section-left"></div>
        <div class="loader-section section-right"></div>
	</div>
	<div style="margin: 100px 500px">
		<table class="table">
			<tr>
				<th><h5>刪除</h5></th>
<!-- 				<th>留言者姓名</th> -->
<!-- 				<th>留言者e-mail</th> -->
				<th><h5>留言時間</h5></th>
				<th><h5>回覆狀態</h5></th>
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
<%-- 					<td>${mesVO.msgname}</td> --%>
<%-- 					<td>${mesVO.msgmail}</td> --%>
					<td>
					<h5>${mesVO.msgtime}</h5>
					</td>
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
									<td colspan="3" id="content${counter.index}">

<%-- 										留言時間:${mesVO.msgtime}&nbsp;<br> 考生 ${mesVO.msgname}:<br> --%>
										<H5>內容:</H5><br>
										<H6>${mesVO.msgcontent}</H6><br>
										<div class="line-separator"></div> 
										<br>
										<H5>回覆時間:${mesVO.rptime}</H5><br><H5>主考官 ${mesVO.rpname}:</H5><br>
										<H6>${mesVO.rpcontent}</H6><br>


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
				class="btn-floating green tooltipped" data-position="top" data-delay="50" data-tooltip="留言"><i
					class="material-icons">library_add</i></a></li>
			<li><a href='<%=request.getContextPath()%>/MesTurn?turn=MQTT'
				class="btn-floating blue darken-1 tooltipped" data-position="top" data-delay="50" data-tooltip="即時通訊"><i class="material-icons">question_answer</i></a></li>
		</ul>
	</div>
<%@ include file="/WEB-INF/header/footer.jsp" %>
</body>
<script type="text/javascript">
$(document).ready(function(){
    $('.tooltipped').tooltip({delay: 50});
    $('body').addClass('loaded');
  });
$('form').submit(function() {	
	$('body').removeClass('loaded');
	return true; // return false to cancel form action
});
</script>
</html>
