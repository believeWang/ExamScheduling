<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/cdn.file"%>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<style>
@import url('<%=request.getContextPath()%>/mes/css/main.css');
#mqtt {
 /* 設定footer的高度 */
    height: 200;
    box-sizing: border-box;
    /* 設定footer絕對位置在底部 */
    position: absolute;
    bottom: 50px;
    /* 展開footer寬度 */
    width: 450;
    text-align: center;
 
}
</style>
<script>

$(function() {
	$("#effect").hide();
	$("#button").click(function() {
  	$("#effect").slideToggle(500);
	});
	
});
</script>
<div style="background:black;height:80px;">
	<a href="<%=request.getContextPath()%>/index.jsp"><img
		src="<%=request.getContextPath()%>/mes/images/logo.png" width="150px"
		style="float: left" /></a>


	<ul class="HeaderStyle" id="header">

		<li>
		<li><a>輸入成績</a></li>
		<li><a>編輯考題</a></li>
<%-- 		<li><a href="<%=request.getContextPath()%>/mes/ListNotReplyMessage.jsp">留言板</a></li> --%>
	<li><a href="<%=request.getContextPath()%>/MesTurn?turn=LNRM">留言板</a></li>
	<div style="float:right;color:white">
		<c:choose>
			<c:when test="${GoogleUser!=null}">
				<img src="<%=request.getContextPath()%>/mes/images/01.png"
					width="40px" style="float: left" />
				<a style="color:white">主考官</a>
				</br>
				<a style="color:white">${GoogleUser}</a>
				<a href="<%=request.getContextPath()%>/gmail_login/loginout.do" >登出</a>
			</c:when>
			<c:otherwise>
				<a href="<%=request.getContextPath()%>/gmail_login/login.do">登入</a>
				<a>${googleLoginErrors.loginNg}</a>
			</c:otherwise>
		</c:choose>
	</div>
	</ul>
	
</div>
<div class="toggler" id="mqtt">
<!--   <button id="button" class="ui-state-default ui-corner-all">即時通訊 </button> -->
    <h3 id="button"  class="card-panel hoverable"><i class=" large material-icons">textsms</i></h3>
     <div class="switch">
    <label>
      Off
     <input type="checkbox" id="checkboxid"  value="0" >
      <span class="lever"></span>
      On
    </label>
  </div>  
    <span>提醒通知<span>
  <div id="effect" class="ui-widget-content ui-corner-all" >
<!-- <iframe src="/ExamScheduling/chat/mqtt.jsp" width="450" height="200" ></iframe> -->
<%@ include file="/WEB-INF/chat/mqtt.jsp" %>
</div>

</div>

