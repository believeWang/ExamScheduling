  <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- <head> -->
<!-- 	<link rel="stylesheet" href="header/css/demo.css"> -->
	<link rel="stylesheet" href="/ExamScheduling/header/css/header-user-dropdown.css">
	<link href='http://fonts.googleapis.com/css?family=Cookie' rel='stylesheet' type='text/css'>

<!-- <script src="/ExamScheduling/js/jquery.min.js"></script> -->
<script>

	$(document).ready(function(){

		var userMenu = $('.header-user-dropdown .header-user-menu');

		userMenu.on('touchend', function(e){

			userMenu.addClass('show');

			e.preventDefault();
			e.stopPropagation();

		});

		// This code makes the user dropdown work on mobile devices

		$(document).on('touchend', function(e){

			// If the page is touched anywhere outside the user menu, close it
			userMenu.removeClass('show');

		});

	});

</script>
<!-- </head> -->

<header class="header-user-dropdown">

	<div class="header-limiter">
		<h1><a href="${pageContext.request.contextPath}">Web<span>Comm</span></a></h1>

		<nav>
			<a href="<%=request.getContextPath()%>/fullcalendar/EventShowServlet?jobid=1">預約考試</a>
			<a href="${pageContext.request.contextPath}/choose">前往考試</a>
			<a href="#">關於緯康</a>
			<a href="<%=request.getContextPath()%>/mes/LeaveMessage.jsp">聯絡我們 </a>
	
<!-- 			<span class="header-new-feature">new</span> -->
		</nav>
		<c:choose>
				<c:when
					test="${not empty sessionScope.ecno}">
				
							<div class="header-user-menu">
								<label>${sessionScope.ecno}</label>

									<ul>
<!-- 									<li><a href="#">Settings</a></li> -->
<!-- 									<li><a href="#">Payments</a></li> -->

										<li><a href="${pageContext.request.contextPath}/LogoutServlet" class="highlight">Logout</a></li>
				

									</ul>
							</div>
				</c:when>

				<c:otherwise>
				<div class="header-user-login">
					<ul id="login">
								<li ><a href='${pageContext.request.contextPath}/login'>登入</a></li>

					</ul>
				</div>
				</c:otherwise>
			</c:choose>






	</div>

</header>




