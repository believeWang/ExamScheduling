<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <style type="text/css">
body {
	background: url("exam_resourse/images/background.jpg");
	 padding: 1em;
}

a{
  color: #739931;
}
.page{
  max-width: 60em;
  margin: 0 auto;
}
table th,
table td{
  
  text-align: left;
}
table{
table-layout:fixed;
  width: 100%;
  border-collapse: collapse;
}


table.display{
  margin: 1em 0;
}
table.display th,
table.display td{
  border: 1px solid #B3BFAA;
  padding: .5em 1em;
}

table.display th{ background: #D5E0CC; }
table.display td{ background: #fff; }

table.responsive-table{
  box-shadow: 0 1px 10px rgba(0, 0, 0, 0.2);
}

@media (max-width: 10em){
    table.responsive-table{
      box-shadow: none;  
    }
    table.responsive-table thead{
      display: none; 
    }
  table.display th,
  table.display td{
    padding: .5em;
  }
    
  table.responsive-table td:nth-child(1):before{
    content: 'Number';
  }
  table.responsive-table td:nth-child(2):before{
    content: 'Name';
  }
  table.responsive-table td:nth-child(1),
  table.responsive-table td:nth-child(2){
    padding-left: 25%;
  }
  table.responsive-table td:nth-child(1):before,
  table.responsive-table td:nth-child(2):before{
    position: absolute;
    left: .5em;
    font-weight: bold;
  }
  
    table.responsive-table tr,
    table.responsive-table td{
        display: block;
    }
    table.responsive-table tr{
        position: relative;
        margin-bottom: 1em;
    box-shadow: 0 1px 10px rgba(0, 0, 0, 0.2);
    }
    table.responsive-table td{
        border-top: none;
    }
    table.responsive-table td.organisationnumber{
        background: #D5E0CC;
        border-top: 1px solid #B3BFAA;    
    	

    }
    table.responsive-table td.actions{
        position: absolute;
        top: 0;
        right: 0;
        border: none;
        background: none;
    }
    
}

</style>
<title>Result</title>
</head>
<body>
<%-- <c:if test="${requestScope.result >= 5}"> --%>
<!--    <h3 align="center">Passed</h3> -->
<%-- </c:if> --%>
<%-- <c:if test="${requestScope.result < 5}"> --%>
<!--    <h3 align="center">Failed</h3> -->
<%-- </c:if> --%>


<div class="page">
<h1> 考試結果</h1>
<table class="layout display responsive-table">
    <thead>
        <tr>
          
            <th colspan="2" style="text-align:center">詳細資料</th>
        </tr>
    </thead>
    <tbody>

        <tr>
            <td  class="organisationnumber">考試名稱:</td>
            <td class="organisationname">${sessionScope.examtitle}</td>
            
        </tr>

        <tr>
            <td class="organisationnumber">考試時間:</td>
            <td class="organisationname">${sessionScope.quizDuration}</td>
        </tr>

        <tr>
            <td class="organisationnumber">考試題數:</td>
            <td class="organisationname">${sessionScope.totalNumberOfQuizQuestions}</td>
           
        </tr>

        <tr>
            <td class="organisationnumber">答對題數:</td>
            <td class="organisationname">${requestScope.rightCnt}</td>
            
        </tr>

       

    </tbody>
</table>
<h3 align="center"><a href='${pageContext.request.contextPath}/ExamReview'>Review Answers</a></h3><br>
<h3 align="center"><a href='${pageContext.request.contextPath}'>Home</a></h3><br>
</div>


</body>
</html>