<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
   
    <title>
        登入
    </title>
<%@ include file="../cdn.file" %>
<style type="text/css">
html,
body {
    height: 100%;
}
html {
    display: table;
    margin: auto;
}
body {
    display: table-cell;
    vertical-align: middle;
}
.margin {
  margin: 0 !important;
}
</style>
 <script>
            $(function() {
 
                if (localStorage.chkbx && localStorage.chkbx != '') {
                    $('#remember_me').attr('checked', 'checked');
                    $('#username').val(localStorage.usrname);
                    $('#password').val(localStorage.pass);
                } else {
                    $('#remember_me').removeAttr('checked');
                    $('#username').val('');
                    $('#password').val('');
                }
 
                $('#remember_me').click(function() {
 
                    if ($('#remember_me').is(':checked')) {
                        // save username and password
                        localStorage.usrname = $('#username').val();
                        localStorage.pass = $('#password').val();
                        localStorage.chkbx = $('#remember_me').val();
                    } else {
                        localStorage.usrname = '';
                        localStorage.pass = '';
                        localStorage.chkbx = '';
                    }
                });
            });
 
        </script>
</head>
<body class=" blue-grey lighten-4">
<div id="login-page" class="row">
    <div class="col s12 z-depth-6 card-panel">
      <form class="login-form" action="LoginServlet" method="post">
        <div class="row">
          <div class="input-field col s12 center">
           <a href="/ExamScheduling/AboutServlet">
            <img src="/ExamScheduling/images/iiI.png" alt="" class="responsive-img valign profile-image-login"></a>
             <p class="center login-form-text  red-text text-darken-2">${regi}</p>
          </div>
        </div>
        <div class="row margin">
          <div class="input-field col s12">
            <i class="mdi-social-person-outline prefix"></i>
          	<input id="text" type="text" name="username">
            <label for="text">學號</label>
          </div>
        </div>
        <div class="row margin">
          <div class="input-field col s12">
            <i class="mdi-action-lock-outline prefix"></i>
            <input id="password" type="password" name="password">
            <label for="password">Password</label>
          </div>
        </div>
        <div class="row">          
          <div class="input-field col s12 m12 l12  login-text">
              <input type="checkbox" id="remember_me" />
              <label for="remember_me">Remember me</label>
          </div>
        </div>
        <div class="row">
          <div class="input-field col s12">
          	<input type="submit" class="btn waves-effect waves-light col s12" value="login">
      
          </div>
        </div>
        <div class="row">
          <div class="input-field col s6 m6 l6">
            <p class="margin medium-small"><a href="regi">取得密碼</a></p>
          </div>
            
        </div>

      </form>
    </div>
  </div>

<!-- <div style="position:absolute;left:500px;top:20%"> -->
<!-- Don`t have an account, click here to <a href=''>申請帳號</a> -->
<!-- <br/> -->
<%-- <h3 align="center">${errorMessage}</h3> --%>
<!-- </div> -->
<!-- <div id="wrapper"> -->

<!-- 	<form name="login-form" class="login-form" action="LoginServlet" method="post"> -->
	
<!-- 		<div class="header"> -->
<!-- 		<h1>Login </h1> -->
<!-- 		<span></span> -->
<!-- 		</div> -->
	
<!-- 		<div class="content"> -->
<!-- 		<input name="username" type="text" class="input username" placeholder="Username" /> -->
<!-- 		<div class="user-icon"></div> -->
<!-- 		<input name="password" type="password" class="input password" placeholder="Password" /> -->
<!-- 		<div class="pass-icon"></div>		 -->
<!-- 		</div> -->

<!-- 		<div class="footer"> -->
<!-- 		<input type="submit" name="submit" value="Login" class="button" /> -->
		
<!-- 		</div> -->
	
<!-- 	</form> -->

<!-- </div> -->



</body>
</html>
