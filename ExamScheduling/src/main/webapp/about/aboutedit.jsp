<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<script type="text/javascript" src="<%=request.getContextPath()%>/ckeditor/ckeditor.js"></script>
	<script type="text/javascript" src="js/jquery-1.2.3.min.js"></script>
    <script type="text/javascript" src="js/jquery.easing.min.js"></script>
    <script type="text/javascript" src="js/jquery.lavalamp.js"></script>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<style>
    	 @import url('<%=request.getContextPath()%>/mes/css/main.css');  
	</style>
<title>Edit頁面</title>
</head>
<body>
<%@ include file="header.jsp" %> 
<h2>公司簡介 - 編輯頁面</h2>
<hr>
<br>
<div>
<textarea class="ckeditor" cols="80" id="aboutcompany" name=content rows="12">
<p>
<span style="color:rgb(128, 128, 128); font-size:22px">關於偉康</span>
</span>
</p>

<p>
<span>　
偉康科技股份有限公司，成立於1998年，由一群熱愛軟體技術、具備豐富實務經驗、且時時以高品質專業服務為念之優秀技術團隊所共同經營。公司設址於台北市，但服務據點遍布全台，甚至2011-2013年至馬來西亞協助Bank Rakyat及KATM等銀行進行 Core Banking 轉置。員工人數約60位，技術團隊中博碩士學歷即佔公司1/3以上，並擁有超過70張以上的專業證照，其中包含Java、.NET、C++開發語言認證及WebSphere Application Server、WebSphere MQ、WebSphere Portal Server等伺服器管理認證，也是Redhat、IBM、Oracle、CA、等國際大廠的重要技術伙伴。 
</span>
</p> 

</textarea>
</div>
<input type=submit value="Submit">
<input type=button value="Cancel">
</html>