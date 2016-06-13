<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<title>Banner編輯頁面</title>
<body>
<center>
    <h1>File Upload</h1>
    <table width="680" BORDER='0' style="background:#ACD6FF">
    <form method="post" action="bannerservlet" enctype="multipart/form-data">   
       	   
		    <tr height="36" >
		      <td height="61" colspan="6" align="center">
		         <input type="file" name="image" size="60" accept=".jpg,.png"/>
		         <input type="submit" value="新增圖片" />
		      </td>
		    </tr>
		    </form>
		    <tr>
		    <td>img<td/>
		    <td><td/>
		    <tr/>
        </table>
    
</center>
</body>
</html>