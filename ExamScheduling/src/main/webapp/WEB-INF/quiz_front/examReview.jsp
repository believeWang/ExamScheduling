<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="exam_resourse/css/component.css" />
<link rel="stylesheet" type="text/css"
	href="/ExamScheduling/css/preload.css" />
<link rel="Shortcut Icon" type="image/x-icon" href="/ExamScheduling/images/logo13.ico" />

<style type="text/css">
@import url(http://fonts.googleapis.com/css?family=Lato:300,400,700);
@font-face {
	font-family: 'codropsicons';
	src:url('../fonts/codropsicons/codropsicons.eot');
	src:url('../fonts/codropsicons/codropsicons.eot?#iefix') format('embedded-opentype'),
		url('../fonts/codropsicons/codropsicons.woff') format('woff'),
		url('../fonts/codropsicons/codropsicons.ttf') format('truetype'),
		url('../fonts/codropsicons/codropsicons.svg#codropsicons') format('svg');
	font-weight: normal;
	font-style: normal;
}

body {
	background: #7E8D85;
	color: #fff;
	font-family: 'Lato', Arial, sans-serif;
}

#unanswered {
	color: #A2E3C4;
	font-size: 2.625em;
}

#home {
	text-align: center;
	font-size: 3.625em;
	color:#3C493F
}

a {
	color: #fff;
	opacity: 0.7;
	text-decoration: none;
}

a:hover, a:focus {
	opacity: 1;
}

.container > header {
	margin: 0 auto;
	padding: 4em 2em;
	text-align: center;
	background: rgba(0,0,0,.05);
}

.container > header h1 {
	font-size: 2.625em;
	line-height: 1.3;
	margin: 0;
	font-weight: 300;
}

.container > header span {
	display: block;
	font-size: 60%;
	color: rgba(0,0,0,.2);
	font-weight: 400;
	padding: 0 0 0.6em 0.1em;
}

section {
	padding: 7em 0;
}

section:nth-child(even) {
	background: rgba(0,0,0,.05);
}

section.related {
	text-align: center;
	font-size: 1.6em;
}

.related p {
	margin: 0;
	padding: 1.1em;
}

/* To Navigation Style */
.codrops-top {
	text-transform: uppercase;
	width: 100%;
	font-size: 0.69em;
	line-height: 2.2;
	font-weight: 700;
}

.codrops-top a {
	text-decoration: none;
	padding: 0 1em;
	letter-spacing: 0.1em;
	display: inline-block;
}

.codrops-top span.right {
	float: right;
}

.codrops-top span.right a {
	float: left;
	display: block;
}

.codrops-icon:before {
	font-family: 'codropsicons';
	margin: 0 4px;
	speak: none;
	font-style: normal;
	font-weight: normal;
	font-variant: normal;
	text-transform: none;
	line-height: 1;
	-webkit-font-smoothing: antialiased;
}

.codrops-icon-drop:before {
	content: "\e001";
}

.codrops-icon-prev:before {
	content: "\e004";
}

@media screen and (max-width: 25em) {

	.codrops-icon span {
		display: none;
	}

}
</style>
<title>考題回顧</title>
</head>

<body>
<!-- loading圖 -->
	<div id="loader-wrapper">
		<div id="loader"></div>
		<div class="loader-section section-left"></div>
        <div class="loader-section section-right"></div>
	</div>

<div class="container">
<header><h1 >考題回顧</h1></header>
	
	
<div  id="content">
	
	<c:forEach var="question" items="${requestScope.questionList}" varStatus="counter">
	
	<c:if test="${question.questionType eq'0'}">
		
   		<c:set var="typeQ1" scope="page" value="ac-custom ac-radio ac-circle"/>
   		<c:set var="typeQ2" scope="page" value="radio"/>
	</c:if>
	<c:if test="${question.questionType eq'1'}">
	
   		<c:set var="typeQ1" scope="page" value="ac-custom ac-checkbox ac-boxfill"/>
   		<c:set var="typeQ2" scope="page" value="checkbox"/>
	</c:if>
	
	<section>
	<form class="${typeQ1}" autocomplete="off">
		<h2 id="title">${counter.count}. ${question.question}</h2>
		<ul>
		<c:forEach var="option" items="${question.options}"	varStatus="optionCounter">
				   
			
			<c:choose>
				<c:when
					test="${answerMap[counter.count-1][optionCounter.count-1]}">
				
					<li><input disabled checked  type='${typeQ2}'><label >${option.optionsName}</label>
				</c:when>

				<c:otherwise>
					<li><input disabled  type="${typeQ2}"><label >${option.optionsName}</label>


				
				</c:otherwise>
			</c:choose>
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

			<span id="unanswered">Unanswered</span>
			<img height="30" width="30" src="exam_resourse/images/redcross.png" />
			<br />
		</c:if>
	</form>
	</section>
	</c:forEach>

</div>

	
	</div>
</body>
<script src='js/jquery.min.js'></script>
<script src="exam_resourse/js/svgcheckbx.js"></script>
<script>

$('input[type=radio]:checked').get().forEach( function( el, i ) { draw( el, 'circle' ); } );
$('input[type=checkbox]:checked').get().forEach( function( el, i ) { draw( el, 'boxfill' ); } );
$(document).ready(function(){
    $('body').addClass('loaded');
});
$('form').submit(function() {	
	$('body').removeClass('loaded');
	return true; // return false to cancel form action
});
</script>
</html>
