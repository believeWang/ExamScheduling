<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
   
    <title>
        申請
    </title>

  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.1/css/materialize.min.css">

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

</head>
<body class=" blue-grey lighten-4">
 <div id="login-page" class="row">
    <div class="col s12 z-depth-6 card-panel">
      <form class="login-form">
        <div class="row">
          <div class="input-field col s12 center">
          <a href="choose">
            <img src="/ExamScheduling/images/iiI.png" alt="" class="responsive-img valign profile-image-login"></a>
            <p class="center login-form-text">iiInterviewer</p>
          </div>
        </div>
        <div class="row margin">
          <div class="input-field col s12">
            <i class="mdi-social-person-outline prefix"></i>
            <input class="validate" id="email" type="email" name="ecemail">
            <label for="email" data-error="wrong" data-success="right" class="center-align">Email</label>
          </div>
        </div>
        <div class="row">
          <div class="input-field col s12">
            <a href="#" id="send" class="btn waves-effect waves-light col s12">寄出驗證信</a>
             <p class="center login-form-text  red-text text-darken-2">${errors.ecemail}</p>
          </div>
        </div>
        <div class="input-field col s6 m6 l6">
            <p class="margin medium-small"><a href="login">登入</a></p>
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
  <!-- jQuery Library -->
 <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
  <!--materialize js-->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.1/js/materialize.min.js"></script>
<script type="text/javascript">
$('#send').click(
		function() {
		
				var em=$('#email').val();
				
				$('#send').attr(
						'href',
						'/ExamScheduling/eclogin/cheakmail?ecemail='
								+ em );
		

		});

</script>
</html>
