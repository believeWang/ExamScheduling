<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="exam_resourse/css/styles.css">
    <style type="text/css">
body {
	background: url("exam_resourse/images/background.jpg");
}

</style>
<title>Result</title>
</head>
<body>

<div style="position:absolute;left:500px;top:70px">
<h3 align="center">Quiz Result</h3>
<table border=1>
        <tr>
            <td class="head">
                Quiz :
            </td>
            <td>
                <span id="lblSubject">${sessionScope.examtitle}</span></td>
        </tr>
        <tr>
            <td class="head">
                Starting Time :
            </td>
            <td >
                <span id="lblStime">${sessionScope.quizDuration}</span></td>
        </tr>
        
              
                <tr>
            <td class="head">
               No. of Questions :
            </td>
            <td>
                <span id="lblNquestions">${sessionScope.totalNumberOfQuizQuestions}</span></td>
        </tr>
        
                <tr>
            <td class="head">
                No. of correct answers :
            </td>
            <td>
                <span id="lblNcans">${requestScope.rightCnt}</span></td>
        </tr>
        
    </table>

<c:if test="${requestScope.result >= 5}">
   <h3 align="center">Passed</h3>
</c:if>
<c:if test="${requestScope.result < 5}">
   <h3 align="center">Failed</h3>
</c:if>
<h3 align="center"><a href='${pageContext.request.contextPath}/ExamReview'>Review Answers</a></h3><br>

</div>

</body>
</html>