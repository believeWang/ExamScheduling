<%@ page language="java" contentType="text/html; charset=UTF8"
	pageEncoding="UTF8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF8">
<style type="text/css">
body {
	background: url("exam_resourse"/ images/ background.jpg ");
}
</style>
<title>Review Exam</title>
</head>

<body>
	<h1 align="center">Quiz Review</h1>
	<br>

	<c:forEach var="question" items="${requestScope.questionList}"
		varStatus="counter">
		<br>
${counter.count}. ${question.question}<br />



		<c:forEach var="option" items="${question.options}"	varStatus="optionCounter">
${optionCounter.count}.   ${option.optionsName}

			<c:choose>
				<c:when
					test="${(answerMap[counter.count-1][optionCounter.count-1]) && (option.isAnswer)}">
					<img height="30" width="30" src="exam_resourse/images/correct.png" />
				</c:when>

				<c:otherwise>
				<c:if test='${option.isAnswer}'>
						<img height="30" width="30" src="exam_resourse/images/correct.png" />
					</c:if>
				

					<c:if test='${answerMap[counter.count-1][optionCounter.count-1]}'>
						<img height="30" width="30"
							src="exam_resourse/images/redcross.png" />
					</c:if>
				</c:otherwise>
			</c:choose>

			<br />
			<br />
		</c:forEach>


		<br>



		<br />




		<c:if test='${answerMap[counter.count-1]==null}'>
		
			<font color="#1334F1">Unanswered</font>
			<img height="30" width="30"
							src="exam_resourse/images/redcross.png" /><br/>
		</c:if>
		<br />
		<br />
_____________________________________________________________________________________________________________________________________________________________________<br>
	</c:forEach>
	<br />
	<br />


	<div align="center">
		<a href="${pageContext.request.contextPath}"><img height="50"
			width="50" src="exam_resourse/images/home.jpg"></img></a>
	</div>
</body>
</html>