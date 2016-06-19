<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.*"%>
<%@ page import="iii.team05.slide.model.*"%>
<%--頁面載入自動baSvc.queryImag()叫出所有圖片 --%>
<%
    BannerService baSvc = new BannerService();
	Map map =baSvc.queryImag();
	pageContext.setAttribute("map", map);
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="css/preload.css" />
<title>Banner編輯頁面</title>
<%@ include file="cdn.file" %>
</head>

<body>
<%@ include file="header/sa_slidenav.jsp" %>
<div id="loader-wrapper">
			<div id="loader"></div>

			<div class="loader-section section-left"></div>
            <div class="loader-section section-right"></div>

		</div>
<div class="row">
  <div class="col s10 offset-s2">
    <h3>Banner編輯</h3>
    <table class="responsive-table" width="300" BORDER='0'bgcolor="#ACD6FF" >
      <form method="post" action="bannerservlet" enctype="multipart/form-data">    
		    <tr height="36" >
		      <td height="61" colspan="6" align="center">
<!-- 以下舊按鍵皆已備註<input type="file" name="image" size="60" accept=".jpg,.png"/> -->
				<div class="row">
				<div class="file-field input-field">
						<div class="light-blue darken-2 btn">
							<span>選擇圖片</span> <input type="file" name="image"
								accept=".jpg,.png" >
						</div>
						<div class="file-path-wrapper">
										<input class="file-path validate" placeholder="png or jpg"
											type="text">
						</div>
						</div>
<!-- 		         <input type="submit" value="新增圖片" /> -->
<button class="waves-light btn-large" type="submit" style="">
						新增圖片<i class="material-icons right">input</i>
							</button>
		         <input type="hidden" name="action" value="Banner_Imag_Insert">
		      </td>
		    </tr>
		    </form>
	    <c:forEach var="BannerVO" items="${map}">
			  <tr>
			  <td>
			    <img class="materialboxed" alt="" src="${BannerVO.value}" width="250px" height="250px">
			  </td>
			  <td>
				<form  METHOD="post" action="bannerservlet">
<!-- 				<input type="submit" value="刪除" name="delete"> -->
<button class="red lighten-2 waves-light btn-large" type="submit" style="">
						刪除<i class="material-icons right">delete</i>
							</button>
				<input type="hidden" name="deImag" value="${BannerVO.key}">
				<input type="hidden" name="action" value="Banner_Imag_Delete">
				</form>
			  <td/>
			  </tr>	
        </c:forEach>
    </table>
   </div>
 </div>

</body>

<!-- 使用materializecss做出圖片放大效果 -->
<!-- body內需改 img class="materialboxed" -->
<script type="text/javascript">$(document).ready(function(){
    $('.materialboxed').materialbox();

   
        $('body').addClass('loaded');
    
    
    
 // submit後跳出讀取畫面
    $('form').submit(function() {
    	
    	$('body').removeClass('loaded');
    	return true; // return false to cancel form action
    });
});</script>

</html>
