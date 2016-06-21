<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> --%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no" />
<title>Parallax Template - Materialize</title>

<!-- CSS  -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link href="/ExamScheduling/css/materialize.css" type="text/css"
	rel="stylesheet" media="screen,projection" />
<link href="/ExamScheduling/css/style.css" type="text/css"
	rel="stylesheet" media="screen,projection" />
</head>
<body>
	<nav class="white" role="navigation">
		<div class="nav-wrapper container">
			<a id="logo-container" href="/ExamScheduling/AboutServlet"
				class="brand-logo"> <!-- 				<p style="color:#4DB6AC; margin-top:15px"></>i Interviewer</p> -->
				<img src="/ExamScheduling/images/iiIV.png" height="80px">
			</a>
			<ul class="right hide-on-med-and-down">
				<li><a
					href="<%=request.getContextPath()%>/fullcalendar/EventShowServlet">預約考試</a></li>
				<li><a href="${pageContext.request.contextPath}/choose">前往考試</a></li>
				<li><a href="<%=request.getContextPath()%>/MesTurn?turn=LM">聯絡我們</a></li>
				<c:choose>
					<c:when test="${not empty sessionScope.ecno}">
						<li><a href="<%=request.getContextPath()%>/LogoutServlet">登出</a></li>
						<li style="color: #000000;">${sessionScope.ecno}</li>
					</c:when>
					<c:otherwise>
						<li><a href="<%=request.getContextPath()%>/login">登入</a></li>
					</c:otherwise>
				</c:choose>
			</ul>

			<ul id="nav-mobile" class="side-nav">
				<li><a
					href="<%=request.getContextPath()%>/fullcalendar/EventShowServlet">預約考試</a></li>
				<li><a href="${pageContext.request.contextPath}/choose">前往考試</a></li>
				<li><a href="<%=request.getContextPath()%>/MesTurn?turn=LM">聯絡我們</a></li>	
<%-- 				<li><a href="<%=request.getContextPath()%>/login">登入</a> --%>
<%-- 				<a href="<%=request.getContextPath()%>/LogoutServlet">登出</a></li> --%>
<%-- 				<li style="color: #000000;">${sessionScope.ecno}</li> --%>
				<c:choose>
					<c:when test="${not empty sessionScope.ecno}">
						<li><a href="<%=request.getContextPath()%>/LogoutServlet">登出</a></li>
						<li style="color: #000000;">使用者：${sessionScope.ecno}</li>

					</c:when>
					<c:otherwise>
						<li><a href="<%=request.getContextPath()%>/login">登入</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
			<a href="#" data-activates="nav-mobile" class="button-collapse"><i
				class="material-icons">menu</i></a>
		</div>
	</nav>

	<div id="index-banner" class="parallax-container">
		<div class="section no-pad-bot">
			<div class="container">
				<br>
				<br>
				<h1 class="header center teal-text text-lighten-2">i
					Interviewer</h1>
				<div class="row center">
					<h5 class="header col s12 light">i Interviewer
						讓您快速選出最符合該公司需求的人才</h5>
				</div>
				<div class="row center">
					<a href="http://materializecss.com/getting-started.html"
						id="download-button"
						class="btn-large waves-effect waves-light teal lighten-1">Get
						Started</a>
				</div>
				<br>
				<br>

			</div>
		</div>
		<div class="parallax">
			<img src="/ExamScheduling/images/background1.jpg"
				alt="Unsplashed background img 1">
		</div>
	</div>

	<!--  Scripts-->
	<!--   <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script> -->
	<script src="/ExamScheduling/js/materialize.js"></script>
	<script src="/ExamScheduling/js/init.js"></script>

</body>
</html>
