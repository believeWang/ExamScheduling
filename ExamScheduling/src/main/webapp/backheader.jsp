<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery.min.js"></script>
<link
	href="https://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css"
	rel="stylesheet" type="text/css" />
<script
	src="https://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
	rel="stylesheet" type="text/css" />


<style type="text/css">
nav {
	background-color: #1b1b1e;
	font-size:14px;
}

.pull-right {
	color: #a9bcd0;
}
</style>
<script type="text/javascript">
	
</script>


</head>
<nav class="navbar navbar-light bg-faded">
<ul class="nav navbar-nav">
 <a class="navbar-brand"
	href="<%=request.getContextPath()%>/recaptcha.jsp"><img width="200"
	src="<%=request.getContextPath()%>/backheader/logolight.png" onmouseout="this.src='<%=request.getContextPath()%>/backheader/logolight.png'"
             onmouseover="this.src='<%=request.getContextPath()%>/backheader/logo.png'"></a>


	<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/upload/poitest.jspx">應徵者列表</a></li>
	<li class="nav-item"><a class="nav-link" href="">編輯考題</a></li>
	<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/aboutedit">編輯公司簡介</a></li>
	<li class="nav-item"><a class="nav-link" href="#">留言板</a></li>

</ul>
<ul class=pull-right>主考官 登入/登出
</ul>

<%-- <iframe frameborder=" scrolling="no" src="<%=request.getContextPath()%>/backheader/index.html" width="100%" height="150px"></iframe> --%>

</nav>

</body>
</html>