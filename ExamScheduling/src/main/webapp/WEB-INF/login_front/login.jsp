<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
   
    <title>
        HTML Document Structure
    </title>
    <link rel="stylesheet" type="text/css" href="exam_resourse/css/style.css" />

    <style type="text/css">
body {
	background: url("exam_resourse/images/background.jpg");
}
.user-icon {
	top:153px; /* Positioning fix for slide-in, got lazy to think up of simpler method. */
	background: rgba(65,72,72,0.75) url('exam_resourse/images/user-icon.png') no-repeat center;	
}
.pass-icon {
	top:201px;
	background: rgba(65,72,72,0.75) url('exam_resourse/images/pass-icon.png') no-repeat center;
}


</style>
</head>
<body>
<%@ include file="../header/header.jsp" %>

<div style="position:absolute;left:500px;top:20%">
Don`t have an account, click here to <a href=''>申請帳號</a>
<br/>
<h3 align="center">${errorMessage}</h3>
</div>
<div id="wrapper">

	<form name="login-form" class="login-form" action="LoginServlet" method="post">
	
		<div class="header">
		<h1>Login </h1>
		<span></span>
		</div>
	
		<div class="content">
		<input name="username" type="text" class="input username" placeholder="Username" />
		<div class="user-icon"></div>
		<input name="password" type="password" class="input password" placeholder="Password" />
		<div class="pass-icon"></div>		
		</div>

		<div class="footer">
		<input type="submit" name="submit" value="Login" class="button" />
		
		</div>
	
	</form>

</div>



</body>
</html>
