<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/cdn.file" %>
<script type="text/javascript" src="<%=request.getContextPath()%>/ckeditor/ckeditor.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- <script   src="https://code.jquery.com/jquery-2.2.4.js"   integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI="   crossorigin="anonymous"></script> -->
<link rel="stylesheet" type="text/css"
	href="/ExamScheduling/css/preload.css" />
	<script type="text/javascript">
	$(document).ready(function(){
        $('body').addClass('loaded');
        $('select').material_select();
	});
	$('form').submit(function() {	
    	$('body').removeClass('loaded');
    	return true; // return false to cancel form action
    });
	</script>
<title>Edit mail</title>
</head>
<body>
<%@ include file="/WEB-INF/header/sa_slidenav.jsp" %>
<!-- loading圖 -->
	<div id="loader-wrapper">
		<div id="loader"></div>
		<div class="loader-section section-left"></div>
        <div class="loader-section section-right"></div>
	</div>
<div class="row">
  <div class="col s10 offset-s2">
<h2>E-mail-編輯頁面</h2>
<FORM METHOD="get" ACTION="/ExamScheduling/setting/editmail"  >

<textarea class="ckeditor" cols="80" id="content" name=content rows="12">${mail}</textarea>

<!-- 下兩排為單獨取出mail內文寫法留著 -->
<!-- <input type=submit value="讀取mail內文" > -->
<!-- <input type="hidden" name="action" value="Mail_Content_Query"> -->


<!-- 利用java script onchange做下拉選單給值抓資料庫寫法 -->
<!-- 利用上方<script type="text/javascript">套入漂亮jQuery選擇器-->
<div class="input-field col s12">
    <select name="action" onchange="functionname(this.options[this.options.selectedIndex].value)">
      <option value="" disabled selected>請選擇</option>
      <option value="Mail_Subject_Query">修改mail主旨</option>
      <option value="Mail_Content_Query">修改mail內文</option>
     
    </select>
    <label>修改之E-mail內容</label>
  </div>


<!-- <input type=submit value="讀取" > -->
<button class="waves-light btn" type="submit" style="">
						讀取<i class="material-icons right">input</i>
							</button>



</FORM> 
</div>
</div>
</body>
</html>


