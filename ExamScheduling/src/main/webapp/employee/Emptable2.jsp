
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="iii.team05.Employee.model.*"%>
<%

EmployeeService empSvc = new EmployeeService();
List<EmployeeVO> list = empSvc.getExam();
pageContext.setAttribute("list", list);
%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>員工表格</title>
<%@ include file="../WEB-INF/cdn.file" %>

<style>
@import url('<%=request.getContextPath()%>/employee/main.css');
@import url('<%=request.getContextPath()%>/mes/css/main.css');
</style>
</head>

<!---------------------------------------------------------------- 員工查詢<body>開始 -->
<body>

<div ><fieldset>
			<legend>員工表格</legend>

<table class=table4_9 style="width:800px">
                 <tr>				
					<th>員工編號</th>
					<th>員工姓名</th>
					<th>E-mail</th>
					<th>修改</th>
<!-- 					<th>刪除</th> -->
				</tr>

	<c:forEach var="EmpVO" items="${list}">
			<tr>

	<td>${EmpVO.empno}</td>
	<td>${EmpVO.empname}</td>
	<td>${EmpVO.empemail}</td>
	<td>
	<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/emp/emp.do" name="form1">
	    <input type="hidden" name="empno" value="${EmpVO.empno}">
	    <input type="hidden" name="action" value="update">
		<input type="submit"  value="增加考官">
			</FORM>
	</td>
<!-- 	<td> -->
<%-- 	<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/emp/emp.do" name="form1"> --%>
<%-- 	    <input type="hidden" name="empno" value="${EmpVO.empno}"> --%>
<!-- 	    <input type="hidden" name="action" value="delete"> -->
<!-- 		<input type="submit"  value="刪除"> -->
<!-- 			</FORM> -->
<!-- 	</td> -->
	
		</tr>
		
        </c:forEach>
      	</table>

		<a type="image" class="waves-effect waves-light btn modal-trigger" href="#modal1">新增</a>
		</fieldset></div>
		<a href='<%=request.getContextPath()%>/employee/Examiner2.jsp'>返回考官表格</a>
<!---------------------------------------------------------------- 員工查詢<body>結束 -->	
<!---------------------------------------------------------------- 新增表單<body>開始 -->
  
  <div id="modal1" class="modal bottom-sheet">
    <div class="modal-content">
<!---------------------------------------------------------------- For 表單開始 -->
    <form class="col s12" METHOD="post" ACTION="<%=request.getContextPath()%>/emp/emp.do">
      <div class="row">
         <div class="input-field col s6">
          <input id="last_name" type="text" name="empname" class="validate" value="">
          <label for="last_name">姓名：</label>
        </div>
      </div>
      
       <div class="row">
        <div class="input-field col s12">
          <input id="email" type="email"  name="empemail"class="validate" value="">
          <label for="email">Email</label>
        </div>
      </div> 
       <div class="input-field col s12">
    <select name="position">
      <option value="" disabled selected>Choose your position</option>
      <option  value="2">系統管理員</option>
      <option  value="1">主考官</option>
         </select>
    <label>選擇權限</label>
  </div>
  
   <div class="modal-footer">
<button class="btn waves-effect waves-light" type="submit" name="action" value="insert" >Submit
    <i class="material-icons right">send</i>
  </button>
</div>
        </form>
<!---------------------------------------------------------------- For 表單結束 -->
    </div>
<!--     <div class="modal-footer"> -->
<!--       <a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">Agree</a> -->
        
<!--     </div> -->

  </div>
</body>

<!---------------------------------------------------------------- 新增表單<body>結束 -->
<script>
$(document).ready(function(){
       $('.modal-trigger').leanModal();
    $('select').material_select();
        
  });
</script>





</html>
