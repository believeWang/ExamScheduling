<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <script type="text/javascript" src="<%=request.getContextPath()%>/mes/js/jquery-1.2.3.min.js"></script> --%>
<script type="text/javascript"	src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<!-- <script src="//code.jquery.com/jquery-1.10.2.js"></script>	 -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script type="text/javascript" src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<link href="/ExamScheduling/chat/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
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
  	$("#effect").toggle(500);
	});
	
	
	
	$("#effect").on("mouseenter mouseleave", function (event) { //挷定滑鼠進入及離開事件
		  if (event.type == "mouseenter") {
		    $(this).css({"overflow-y": "scroll"}); //滑鼠進入
		  } else {
// 		    $(this).scrollTop(0).css({"overflow-y": "hidden"}); //滑鼠離開
		  }
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
    <h3 id="button" class="ui-widget-header ui-corner-all">即時通訊</h3>
    <input type="checkbox" id="checkboxid"  value="0" ><span>提醒通知<span>
  <div id="effect" class="ui-widget-content ui-corner-all" style="width: 450px;height:450px;">
<!-- <iframe src="/ExamScheduling/chat/mqtt.jsp" width="450" height="200" ></iframe> -->
<%@ include file="/WEB-INF/chat/mqtt.jsp" %>
</div>

</div>