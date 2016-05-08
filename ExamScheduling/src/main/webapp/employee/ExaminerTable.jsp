<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>主考官表格</title>
</head>
<body>
 
     	
<div>
 <FORM METHOD="post" ACTION="examiner.do" name="form1">
<fieldset>
<legend>主考官表格</legend>
<table border="0">

	<tr>
		<td>Name:</td>
		<td><input type="TEXT" name="empname" size="40" /></td>
	</tr>
	<tr>
		<td>E-mail:</td>
		<td><textarea cols="40" rows="5" id="emp1" name="empemail"></textarea></td>
	</tr>
	<tr>
		<td>Position:</td>
		<td><textarea cols="40" rows="5" id="emp1" name="position"></textarea></td>
	</tr>
</table>

<input type="hidden" name="action" value="leave">
<input type="submit" value="送出留言" style="width:70px;height:30px;border:2px blue none" ></fieldset></FORM>

</div>

<label class="title">Employee查詢所有資料</label>
<form action="../Text2" method="post">
<input type="submit" name="employee">
</form>

</body>
</html>