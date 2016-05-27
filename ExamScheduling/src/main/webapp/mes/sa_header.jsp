<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/mes/js/jquery-1.2.3.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/mes/js/jquery.easing.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/mes/js/jquery.lavalamp.js"></script>
<style>
@import url('<%=request.getContextPath()%>/mes/css/main.css');
</style>

<div style="background:black;height:80px;">
	<a href="<%=request.getContextPath()%>/index.jsp"><img
		src="<%=request.getContextPath()%>/mes/images/logo.png" width="150px"
		style="float: left" /></a>


	<ul class="HeaderStyle" id="header">

		<li>
		<li><a>Banner設定</a></li>
		<li><a href="/ExamScheduling/employee/Examiner2.jsp">主考官設定</a></li>
		<li><a href="/ExamScheduling/employee/student_upd.jsp">考生設定</a></li>
		<li><a>設定</a></li>
	<div style="float:right;color:white">
		<c:choose>
			<c:when test="${GoogleUser!=null}">
				<img src="<%=request.getContextPath()%>/mes/images/02.png"
					width="40px" style="float: left" />
				<a>系統管理員</a>
				</br>
				<a>${GoogleUser}</a>
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
