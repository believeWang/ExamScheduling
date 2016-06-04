<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
 fieldset{
    	width:600px;
	 	margin:15px;
	  	border:1px solid #FF95CA;
		border-radius:10px;
        margin:100px auto;
		}
  .st1{
        font-size:25px;
        font-weight:900;
      }
</style>
</head>
<body>
<FORM METHOD="post" ACTION="/ExamScheduling/eclogin/cheakmail"  >
  <fieldset>
  <legend class="st1">請輸入E-mail</legend>
  <table>
	<tr>
		<td>e-mail:</td>
		<td><input type="TEXT" name="ecemail" size="40" /></td>
	    <td>${errors.ecemail}</td>
	</tr>
  </table>
	<input type="submit" value="送出">
	</fieldset>
</FORM>
</body>
</html>
