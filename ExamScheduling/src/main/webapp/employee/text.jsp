<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</style>
</head>
<body>
<label class="title">Season查詢所有資料</label>
<form action="../Text" method="post">
<input type="submit" >
</form>

<label class="title">Employee查詢所有資料</label>
<form action="../Text2" method="post">
<input type="submit" name="employee">
</form>




  <li><a href="<%=request.getContextPath()%>/employee/Examiner.jsp">聯絡我們</a></li>


</body>
</html>