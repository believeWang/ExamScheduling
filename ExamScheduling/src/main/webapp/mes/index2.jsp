<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>考試預約系統Reception</title>
		<style>
       @import url('<%=request.getContextPath()%>/mes/css/main.css');
		</style>
</head>
<body>
     	
     	
 		   	<a href="<%=request.getContextPath()%>/mes/index2.jsp"><img src="<%=request.getContextPath()%>/mes/images/logo.png" style="float:left" /> </a>   
       		<ul id="menu">	   
       	  	      <li><a href="<%=request.getContextPath()%>/index.jsp">輸入成績</a></li>
       		      <li><a href="<%=request.getContextPath()%>/index.jsp">編輯考題</a></li>
		  	      <li><a href="<%=request.getContextPath()%>/mes/ListNotReplyMessage.jsp">留言板</a></li>
       			
       			<c:choose >
       			<c:when  test="${GoogleUser!=null}">
       			<li><a>${GoogleUser}</a></li>
       			<li><a href="<%=request.getContextPath()%>/mes/loginout.do">登出</a></li>
       			</c:when>
       			<c:otherwise>
       			<li><a href="<%=request.getContextPath()%>/mes/googlelogin.jsp">登入</a></li>
       			</c:otherwise>
       			</c:choose>		
       		</ul>
            	
       
${loginout}

</body>
</html>

