<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Bootstrap 樣式</title>

<!-- Bootstrap -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- jQuery (Bootstrap 所有外掛均需要使用) -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<!-- 依需要參考已編譯外掛版本（如下），或各自獨立的外掛版本 -->
<script src="js/bootstrap.min.js"></script>


<!-- google sing in -->
<meta name="google-signin-scope" content="profile email">
<meta name="google-signin-client_id" content="YOUR_CLIENT_ID.apps.googleusercontent.com">
<script src="https://apis.google.com/js/platform.js" async defer></script>

<script>
	
</script>

</head>
<body>
<!-- 
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<nav class="navbar navbar-default">
				<div class="container-fluid">
					<div class="navbar-header">
						<a class="navbar-brand" href="#"> <img alt="Brand"
							src="images/calendar_icon.jpg" width="30px">
						</a>
						<p class="navbar-text">FullCalendar</p>
						<div class="container">
							<ul class="nav navbar-nav">
								<li class="active"><a href="#">Link 1</a></li>
								<li><a href="#">Link 2</a></li>
								<li><a href="#">Link 3</a></li>
								<li><a href="#">Link 4</a></li>
								<li><a href="#">Link 5</a></li>
							</ul>
						</div>
					</div>
				</div>
				</nav>
			</div>
		</div>

		<div class="row">
			<div class="col-md-2">
				<ul class="list-group">
					<li class="list-group-item">職位 1</li>
					<li class="list-group-item active">職位 2</li>
					<li class="list-group-item">職位 3</li>
					<li class="list-group-item">職位 4</li>
					<li class="list-group-item">職位 5</li>
				</ul>
			</div>
			<div class="col-md-10">
				<table class="table table-bordered">
					<tr>
						<td>
							
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
-->
	<div class="g-signin2" data-onsuccess="onSignIn" data-theme="dark"></div>
	
	<script>
      function onSignIn(googleUser) {
        // Useful data for your client-side scripts:
        var profile = googleUser.getBasicProfile();
        console.log("ID: " + profile.getId()); // Don't send this directly to your server!
        console.log('Full Name: ' + profile.getName());
        console.log('Given Name: ' + profile.getGivenName());
        console.log('Family Name: ' + profile.getFamilyName());
        console.log("Image URL: " + profile.getImageUrl());
        console.log("Email: " + profile.getEmail());

        // The ID token you need to pass to your backend:
        var id_token = googleUser.getAuthResponse().id_token;
        console.log("ID Token: " + id_token);
      };
    </script>
</body>
</html>