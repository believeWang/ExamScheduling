<%@ page language="java" contentType="text/html; charset=UTF8"
	pageEncoding="UTF8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF8">


<style type="text/css">
#content{
margin: 0 auto;
    width: 60%;
  
}
body {
	background: #8fb8ed;
	color: #fff;
	font-family: 'Lato', Arial, sans-serif;
}
.container > header {
	margin: 0 auto;
	padding: 4em 2em;
	text-align: center;
	
}

.container > header h1 {
	font-size: 2.625em;
	line-height: 1.3;
	margin: 0;
	font-weight: 300;
}
section {
	padding: 7em 0;
	background:#c2bbf0;
}

.container:nth-child(even) {
	
}

section.related {
	text-align: center;
	font-size: 1.6em;
}

li{
list-style-type:none;
}

section > h2{
	text-align: center;
	font-size: 1.6em;
}
</style>
<title>Review Exam</title>
</head>

<body>
<div class="container">
<header><h1 >Quiz Reviewaa</h1></header>
	
	
<div  id="content">
	<c:forEach var="question" items="${requestScope.questionList}" varStatus="counter">
		
			

	<section>
	<div>
		<h2 id="title">${counter.count}. ${question.question}</h2>
		<ul>
		<c:forEach var="option" items="${question.options}"	varStatus="optionCounter">
			<li>	${optionCounter.count}.   ${option.optionsName}
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

		</li>
		</c:forEach>
</ul>

	

		<c:if test='${answerMap[counter.count-1]==null}'>

			<font color="#3590f3">Unanswered</font>
			<img height="30" width="30" src="exam_resourse/images/redcross.png" />
			<br />
		</c:if>
		</div>
	</section>
_____________________________________________________________________________________________________________________________________________________________________<br>
	</c:forEach>

</div>

	<div align="center">
		<a href="${pageContext.request.contextPath}"><img height="50"
			width="50" src="exam_resourse/images/home.jpg"></img></a>
	</div>
	</div>
</body>
</html>