<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ESS</title>

<h1><a href="<%=request.getContextPath()%>/employee/Emptable.jsp">主考官</a></h1>
<h1><a href="<%=request.getContextPath()%>/fullcalendar/EventShowServlet?jobid=1">前台</a></h1>
<h1><a href="<%=request.getContextPath()%>/test.jsp">後台登入</a></h1>
<h1><a href="<%=request.getContextPath()%>/validate/checkmail.jsp">mail驗證</a></h1>
${googleLoginErrors.loginNg}
</body>
</html> 
