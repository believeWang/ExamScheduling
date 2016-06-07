<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/cdn.file"%>
  <script type="text/javascript">
  $(function () { $("[data-toggle='tooltip']").tooltip(); });
  </script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>考試預約系統Reception</title>
</head>
<body>
<%@ include file="/WEB-INF/header/header.jsp" %>
<div style="margin: 200px 500px">
 <FORM METHOD="post" ACTION="/ExamScheduling/mes/mes.do" name="form1" >
<h1 class="center-align">請輸入留言</h1>
<table border="0" class="table">
	<tr>
		<td>姓名:</td>
		<td><input type="TEXT" name="msgname" size="40"  value=""/></td>
	</tr>
	<tr>
		<td>e-mail:</td>
		<td><input type="TEXT" name="msgmail" size="40" /></td>
	</tr>
	<tr>
		<td>留言:</td>
		<td><textarea cols="40" rows="20" id="area1" name="msgcontent"></textarea></td>
	</tr>
</table>

<input type="hidden" name="action" value="leave">
<button class="light-blue darken-2 waves-light btn" type="submit" style="float: right;">
						送出<i class="material-icons right">mode_edit</i>
							</button>
</FORM>
</div>
 <div class="fixed-action-btn horizontal" style="bottom: 45px; right: 24px;">
    <a class="btn-floating btn-large red">
      <i class="large material-icons">contact_phone</i>
    </a>
    <ul>
      <li><a href='<%=request.getContextPath()%>/MesTurn?turn=LAM' class="btn-floating green" data-toggle="tooltip" title="留言板" ><i class="material-icons">comment</i></a></li>
      <li><a href='<%=request.getContextPath()%>/MesTurn?turn=MQTT' class="btn-floating blue darken-1" data-toggle="tooltip" title="即時通訊"><i class="material-icons">question_answer</i></a></li>
    </ul>
  </div>
<c:if test="${status=='NG'}">
<script>alert("你在這裡當駭客，你媽知道嗎!")</script>
</c:if>
</body>
</html>

