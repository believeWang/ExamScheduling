<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/jquery-ui.css">
</head>
<body>
	<div class="fancy"> 
    <h3>預約時段</h3> 
    <form id="add_form" action="EventSaveServlet" method="post"> 
        <input type="hidden" name="action" value="add">
        <input type="hidden" name="date" value="${date}">
        <input type="hidden" name="jobid" value="${jobid}">
        <input type="hidden" name="ecemail" value=""> <!-- 考生email -->
        <input type="hidden" name="empno" value=""> <!-- 主考官id -->
        <p>預約考試標題：<input type="text" name="title" value="" placeholder="輸入預約考試標題"></p>
        <c:forEach var="section" items="${seclists}">
        	<p><input type="radio" name="section" value="${section.sectiontime}">${section.sectiontime}</p>
        </c:forEach>
        <div class="sub_btn"><span class="del"><input type="button" class="btn btn_del" id="del_event" value="删除"></span> 
        <input type="submit" class="btn btn_ok" value="确定"> <input type="button" class="btn btn_cancel" value="取消" onClick="$.fancybox.close()"></div> 
    </form> 
</div> 

<script type="text/javascript" src="../js/jquery.form.min.js"></script>
<script type="text/javascript">
$(function(){
    $(".datepicker").datepicker();
    
    
    //提交表单
    $('#add_form').ajaxForm({
        beforeSubmit: showRequest, //表单验证
        success: showResponse //成功返回預約考試標題
    }); 

    //删除事件
    $("#del_event").click(function(){
        if(confirm("您确定要删除吗？")){
            var eventid = $("#eventid").val();
            $.post("do.php?action=del",{id:eventid},function(msg){
                if(msg==1){//删除成功
                    $.fancybox.close();
                    $('#calendar').fullCalendar('refetchEvents'); //重新获取所有事件数据
                }else{
                    alert(msg); 
                }
            });
        }
    });

});

function showRequest(){
    var events = $("#event").val();
    if(events==''){
        alert("请输入日程内容！");
        $("#event").focus();
        return false;
    }
}

function showResponse(responseText, statusText, xhr, $form){
    if(statusText=="success"){  
        if(responseText==1){
            $.fancybox.close();
            $('#calendar').fullCalendar('refetchEvents'); //重新获取所有事件数据
        }else{
            alert(responseText);
            alert("失敗0");
        }
    }else{
        alert(statusText);
        alert("失敗1");
    }
}
</script>

</body>
</html>