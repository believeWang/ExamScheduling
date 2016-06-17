<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/WEB-INF/cdn.file"%>
<link rel="stylesheet" type="text/css"
	href="/ExamScheduling/css/preload.css" />

<title>ExamInfo</title>
    
   

    
        <style>
      /* NOTE: The styles were added inline because Prefixfree needs access to your styles and they must be inlined if they are on local disk! */
        @font-face {
  font-family: 'Electrolize';
  font-style: normal;
  font-weight: 400;
  src: local('Electrolize'), local('Electrolize-Regular'), url(http://themes.googleusercontent.com/static/fonts/electrolize/v2/DDy9sgU2U7S4xAwH5thnJ4bN6UDyHWBl620a-IRfuBk.woff) format('woff');
}

body {
	background: #310404 url(http://web-sonick.zz.mu/images/sl/red_texture.jpg) repeat top left;
	font-family: 'Electrolize';
}


.container{
	width: 100%;
	position: relative;
	overflow:hidden;
}

a {
  text-decoration:none;
}

h1.main,p.demos {
	-webkit-animation-delay: 18s;
	-moz-animation-delay: 18s;
	-ms-animation-delay: 18s;
	animation-delay: 18s;
}
.sp-container {
	position: fixed;
	top: 0px;
	left: 0px;
	width: 100%;
	height: 100%;
	
	z-index: 9998;
	background: -webkit-radial-gradient(rgba(0, 0, 0, 0.1), rgba(0, 0, 0, 0.3) 35%, rgba(0, 0, 0, 0.7));
	background: -moz-radial-gradient(rgba(0, 0, 0, 0.1), rgba(0, 0, 0, 0.3) 35%, rgba(0, 0, 0, 0.7));
	background: -ms-radial-gradient(rgba(0, 0, 0, 0.1), rgba(0, 0, 0, 0.3) 35%, rgba(0, 0, 0, 0.7));
	background: radial-gradient(rgba(0, 0, 0, 0.1), rgba(0, 0, 0, 0.3) 35%, rgba(0, 0, 0, 0.7));
}
.sp-content {
	position: absolute;
	width: 100%;
	height: 100%;
	left: 0px;
	top: 0px;
	z-index: 9999;
}
.sp-container h2 {
	position: absolute;
	top: 50%;
	line-height: 100px;
	height: 90px;
	margin-top: -50px;
	font-size: 90px;
	width: 100%;
	text-align: center;
	color: transparent;
	-webkit-animation: blurFadeInOut 1s ease-in backwards;
	-moz-animation: blurFadeInOut 1s ease-in backwards;
	-ms-animation: blurFadeInOut 1s ease-in backwards;
	animation: blurFadeInOut 1s ease-in backwards;
}
.sp-container h2.frame-1 {
	-webkit-animation-delay: 0s;
	-moz-animation-delay: 0s;
	-ms-animation-delay: 0s;
	animation-delay: 0s;
}
.sp-container h2.frame-2 {
	-webkit-animation-delay: 1s;
	-moz-animation-delay: 1s;
	-ms-animation-delay: 1s;
	animation-delay: 1s;
}
.sp-container h2.frame-3 {
	-webkit-animation-delay: 2s;
	-moz-animation-delay: 2s;
	-ms-animation-delay: 2s;
	animation-delay: 2s;
}
.sp-container h2.frame-4 {
	font-size: 200px;
	-webkit-animation-delay: 3s;
	-moz-animation-delay: 3s;
	-ms-animation-delay: 3s;
	animation-delay: 3s;
}
.sp-container h2.frame-5 {
	-webkit-animation: none;
	-moz-animation: none;
	-ms-animation: none;
	animation: none;
	color: transparent;
	text-shadow: 0px 0px 1px #fff;
}
.sp-container h2.frame-5 span {
	-webkit-animation: blurFadeIn 1s ease-in 4s backwards;
	-moz-animation: blurFadeIn 1s ease-in 4s backwards;
	-ms-animation: blurFadeIn 1s ease-in 4s backwards;
	animation: blurFadeIn 1s ease-in 4s backwards;
	color: transparent;
	text-shadow: 0px 0px 1px #fff;
}
.sp-container h2.frame-5 span:nth-child(2) {
	-webkit-animation-delay: 5s;
	-moz-animation-delay: 5s;
	-ms-animation-delay: 5s;
	animation-delay: 5s;
}
.sp-container h2.frame-5 span:nth-child(3) {
	-webkit-animation-delay: 6s;
	-moz-animation-delay: 6s;
	-ms-animation-delay: 6s;
	animation-delay: 6s;
}
.sp-globe {
	position: absolute;
	width: 282px;
	height: 273px;
	left: 50%;
	top: 50%;
	margin: -137px 0 0 -141px;
	background: transparent url(http://web-sonick.zz.mu/images/sl/globe.png) no-repeat top left;
	-webkit-animation: fadeInBack 3.6s linear 14s backwards;
	-moz-animation: fadeInBack 3.6s linear 14s backwards;
	-ms-animation: fadeInBack 3.6s linear 14s backwards;
	animation: fadeInBack 3.6s linear 14s backwards;
	-ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=30)";
	filter: alpha(opacity=30);
	opacity: 0.3;
	-webkit-transform: scale(5);
	-moz-transform: scale(5);
	-o-transform: scale(5);
	-ms-transform: scale(5);
	transform: scale(5);
}
.sp-circle-link {

	position: absolute;
	left: 60%;
	bottom: 100px;
	margin-left: -50px;
	text-align: center;
	line-height: 100px;
	width: 100px;
	height: 100px;
	background: #fff;
	color: #3f1616;
	font-size: 25px;
	-webkit-border-radius: 50%;
	-moz-border-radius: 50%;
	border-radius: 50%;
	-webkit-animation: fadeInRotate 1s linear 1s backwards;
	-moz-animation: fadeInRotate 1s linear 1s backwards;
	-ms-animation: fadeInRotate 1s linear 1s backwards;
	animation: fadeInRotate 1s linear 1s backwards;
	-webkit-transform: scale(1) rotate(0deg);
	-moz-transform: scale(1) rotate(0deg);
	-o-transform: scale(1) rotate(0deg);
	-ms-transform: scale(1) rotate(0deg);
	transform: scale(1) rotate(0deg);
}
.sp-circle-link2 {

	position: absolute;
	left: 40%;
	bottom: 100px;
	margin-left: -50px;
	text-align: center;
	line-height: 100px;
	width: 100px;
	height: 100px;
	background: #fff;
	color: #3f1616;
	font-size: 25px;
	-webkit-border-radius: 50%;
	-moz-border-radius: 50%;
	border-radius: 50%;
	-webkit-animation: fadeInRotate 1s linear 1s backwards;
	-moz-animation: fadeInRotate 1s linear 1s backwards;
	-ms-animation: fadeInRotate 1s linear 1s backwards;
	animation: fadeInRotate 1s linear 1s backwards;
	-webkit-transform: scale(1) rotate(0deg);
	-moz-transform: scale(1) rotate(0deg);
	-o-transform: scale(1) rotate(0deg);
	-ms-transform: scale(1) rotate(0deg);
	transform: scale(1) rotate(0deg);
}
.sp-circle-link:hover {
	background: #85373b;
	color: #fff;
}
.sp-circle-link2:hover {
	background: #85373b;
	color: #fff;
}
/**/
@-webkit-keyframes blurFadeInOut{
	0%{
		opacity: 0;
		text-shadow: 0px 0px 40px #fff;
		-webkit-transform: scale(1.3);
	}
	20%,75%{
		opacity: 1;
		text-shadow: 0px 0px 1px #fff;
		-webkit-transform: scale(1);
	}
	100%{
		opacity: 0;
		text-shadow: 0px 0px 50px #fff;
		-webkit-transform: scale(0);
	}
}
@-webkit-keyframes blurFadeIn{
	0%{
		opacity: 0;
		text-shadow: 0px 0px 40px #fff;
		-webkit-transform: scale(1.3);
	}
	50%{
		opacity: 0.5;
		text-shadow: 0px 0px 10px #fff;
		-webkit-transform: scale(1.1);
	}
	100%{
		opacity: 1;
		text-shadow: 0px 0px 1px #fff;
		-webkit-transform: scale(1);
	}
}
@-webkit-keyframes fadeInBack{
	0%{
		opacity: 0;
		-webkit-transform: scale(0);
	}
	50%{
		opacity: 0.4;
		-webkit-transform: scale(2);
	}
	100%{
		opacity: 0.2;
		-webkit-transform: scale(5);
	}
}
@-webkit-keyframes fadeInRotate{
	0%{
		opacity: 0;
		-webkit-transform: scale(0) rotate(360deg);
	}
	100%{
		opacity: 1;
		-webkit-transform: scale(1) rotate(0deg);
	}
}
/**/
@-moz-keyframes blurFadeInOut{
	0%{
		opacity: 0;
		text-shadow: 0px 0px 40px #fff;
		-moz-transform: scale(1.3);
	}
	20%,75%{
		opacity: 1;
		text-shadow: 0px 0px 1px #fff;
		-moz-transform: scale(1);
	}
	100%{
		opacity: 0;
		text-shadow: 0px 0px 50px #fff;
		-moz-transform: scale(0);
	}
}
@-moz-keyframes blurFadeIn{
	0%{
		opacity: 0;
		text-shadow: 0px 0px 40px #fff;
		-moz-transform: scale(1.3);
	}
	100%{
		opacity: 1;
		text-shadow: 0px 0px 1px #fff;
		-moz-transform: scale(1);
	}
}
@-moz-keyframes fadeInBack{
	0%{
		opacity: 0;
		-moz-transform: scale(0);
	}
	50%{
		opacity: 0.4;
		-moz-transform: scale(2);
	}
	100%{
		opacity: 0.2;
		-moz-transform: scale(5);
	}
}
@-moz-keyframes fadeInRotate{
	0%{
		opacity: 0;
		-moz-transform: scale(0) rotate(360deg);
	}
	100%{
		opacity: 1;
		-moz-transform: scale(1) rotate(0deg);
	}
}
/**/
@keyframes blurFadeInOut{
	0%{
		opacity: 0;
		text-shadow: 0px 0px 40px #fff;
		transform: scale(1.3);
	}
	20%,75%{
		opacity: 1;
		text-shadow: 0px 0px 1px #fff;
		transform: scale(1);
	}
	100%{
		opacity: 0;
		text-shadow: 0px 0px 50px #fff;
		transform: scale(0);
	}
}
@keyframes blurFadeIn{
	0%{
		opacity: 0;
		text-shadow: 0px 0px 40px #fff;
		transform: scale(1.3);
	}
	50%{
		opacity: 0.5;
		text-shadow: 0px 0px 10px #fff;
		transform: scale(1.1);
	}
	100%{
		opacity: 1;
		text-shadow: 0px 0px 1px #fff;
		transform: scale(1);
	}
}
@keyframes fadeInBack{
	0%{
		opacity: 0;
		transform: scale(0);
	}
	50%{
		opacity: 0.4;
		transform: scale(2);
	}
	100%{
		opacity: 0.2;
		transform: scale(5);
	}
}
@keyframes fadeInRotate{
	0%{
		opacity: 0;
		transform: scale(0) rotate(360deg);
	}
	100%{
		opacity: 1;
		transform: scale(1) rotate(0deg);
	}
}
    </style>

    
        <script src="exam_resourse/js/prefixfree.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
    $('body').addClass('loaded');
});
</script>

</head>
<body>
<!-- loading圖 -->
	<div id="loader-wrapper">
		<div id="loader"></div>
		<div class="loader-section section-left"></div>
        <div class="loader-section section-right"></div>
	</div>

<div class="container">
    <div class="header">
        <div class="clr"></div>
    </div>
    <div class="sp-container">
        <div class="sp-content">
            <div class="sp-globe"></div>
            	<h2 class="frame-1">${sessionScope.examtitle}</h2>

            	<h2 class="frame-2">${sessionScope.totalNumberOfQuizQuestions}題單選或多選</h2>

            	<h2 class="frame-3">你有${sessionScope.quizDuration}分鐘的時間</h2>

            	<h2 class="frame-4">NOW!</h2>

            	<h2 class="frame-5"><span>${sessionScope.examtitle}</span> <span>${sessionScope.quizDuration}分鐘</span> <span>${sessionScope.totalNumberOfQuizQuestions}題</span></h2>
	<a class="sp-circle-link" href="${pageContext.request.contextPath}/Examing">考試!</a>
	<a class="sp-circle-link2" href="choose">回上一頁</a>
	
        </div>
    </div>
</div>





</body>
</html>
