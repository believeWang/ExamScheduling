<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="exam_resourse/css/styles.css">
<title>Insert title here</title>
<style type="text/css">
body {
	background: url("exam_resourse/images/background.jpg");
}
</style>
</head>
<body>
<div id='cssmenu'>
<ul>
   <li class=''><a href='${pageContext.request.contextPath}'><span>Home</span></a></li>
   <li><a href='${pageContext.request.contextPath}/login'><span>Login</span></a></li>
   <li><a href='${pageContext.request.contextPath}/choose'><span>Exam</span></a></li>
</ul>
</div>
<br><br><br>
<h2 align="center">Instruction for ${sessionScope.examtitle} Quiz : </h2>

<div style="position:absolute;left:500px;top:170px">
<ul style="list-style-type:disc">
 <li>Quiz contains ${sessionScope.totalNumberOfQuizQuestions} Multiple Choice Questions</li>
 <li>Total time for the Quiz is ${sessionScope.quizDuration} Minutes</li>
 <li>You can finish the exam at any time</li>
 <li>Read the question carefully before answering</li>
 <li>You can change your answers before submitting</li>
 <li>Good luck for the test.</li>
</ul>  
<br><br><br>
</div>

<div  style="position:absolute;left:600px;top:350px">
<button onclick="location.href='${pageContext.request.contextPath}/Examing'">Start Exam</button>
</div>


</body>
</html>