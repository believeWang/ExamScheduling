<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/cdn.file"%>

 <%@ include file="../header/header_resourse.file" %>
    
<link rel="stylesheet" type="text/css"
	href="/ExamScheduling/css/preload.css" />
    
    <style type="text/css">
    
body {
	background: url("exam_resourse/images/background.jpg");
	padding:0;
	margin:0;
}

.button {
	padding: 10px 15px;
	font-size: 14px;
	line-height: 100%;
	text-shadow: 0 1px rgba(0, 0, 0, 0.4);
	color: #fff;
	
	vertical-align: middle;
	text-align: center;
	cursor: pointer;
	font-weight: bold;
	transition: background 0.1s ease-in-out;
	-webkit-transition: background 0.1s ease-in-out;
	-moz-transition: background 0.1s ease-in-out;
	-ms-transition: background 0.1s ease-in-out;
	-o-transition: background 0.1s ease-in-out;
	text-shadow: 0 1px rgba(0, 0, 0, 0.3);
	color: #fff;
	-webkit-border-radius: 40px;
	-moz-border-radius: 40px;
	border-radius: 40px;
	font-family: 'Helvetica Neue', Helvetica, sans-serif;
}

.button, .button:hover, .button:active {
	outline: 0 none;
	text-decoration: none;
        color: #fff;
}

.username {
	background-color: #2ecc71;
	box-shadow: 0px 3px 0px 0px #239a55;
}
table{
	margin: 5% auto;
	width:80%;
}
</style>
  
   <title>考試列表</title>
<script type="text/javascript">
$(document).ready(function(){
    $('body').addClass('loaded');
});
</script>

</head>
<body>
<%@ include file="../header/header.jsp" %>
<!-- loading圖 -->
	<div id="loader-wrapper">
		<div id="loader"></div>
		<div class="loader-section section-left"></div>
        <div class="loader-section section-right"></div>
	</div>
<div class="content">
<table cellpadding="0" cellspacing="50">
<c:forEach var="examEntry" items="${applicationScope.examsMap}" varStatus="counter">
<c:if test='${counter.count%4==1}'>
<tr>
</c:if>

<c:choose>
				<c:when
					test='${not empty examEntry.value}'>
				
					<td><a href="TakeExam?test=${examEntry.key}"><img alt="${examEntry.key}" title="${examEntry.key}" height="200" width="200" src="${examEntry.value}"/></a></td>
				</c:when>

				<c:otherwise>
				<td><a href="TakeExam?test=${examEntry.key}"><img alt="${examEntry.key}" title="${examEntry.key}" height="200" width="200" src="exam_resourse/images/examImg.png"/></a></td>
					


				
				</c:otherwise>
			</c:choose>

<c:if test='${counter.count%4==0}'>
</tr>
</c:if>




</c:forEach>



</table>
</div>


</body>
</html>
