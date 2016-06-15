<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
.parallax-container {
      height: "your height here";
    }
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/cdn.file" %>
<script src='https://www.google.com/recaptcha/api.js'></script>
<script type="text/javascript">
$(function(){
    $('.parallax').parallax();
  });
      
</script>
</head>
<body >
<div class="parallax-container" >
    <div class="parallax"><img src="images/p1.jpg"></div>
  </div>
  <div class="section white" style="margin:0 600px" >
    <div class="row container" >

      <h5 class="header" style="font-family: monospace;">--歡迎使用後台考試預約系統--驗證成功後將登入</h5>${googleLoginErrors.loginNg}
     <p class="grey-text text-darken-3 lighten-3">
<!--      CAPTCAH 主體 -->
 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/captcha" method="post" onsubmit="return check();">
<div class="g-recaptcha" data-sitekey="6LcppyETAAAAALqRFGJr52mKiSTW1KYCR-E43TfL"></div>
<!-- <input type="submit" value="送出"> -->
 <button class="btn waves-effect  orange darken-2" type="submit" style="margin:20px 80px">確認
    <i class="material-icons right">send</i>
  </button>
</FORM></p>
    </div>
  </div>
  <div class="parallax-container">
    <div class="parallax"><img src="images/p3.jpg"></div>
  </div>
</body>
</html>
