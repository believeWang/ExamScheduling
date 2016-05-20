<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<FORM METHOD="post" ACTION="/ExamScheduling/eclogin/signin"  >
<table>
<tr>
		<td>e-mail:</td>
		<td><input type="TEXT" name="ecemail" size="40" /></td>
	<td>${errors.ecemail}</td>
	</tr>
	</table>
	<input type="submit" value="送出">
</FORM>
</body>
</html>
