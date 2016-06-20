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
    <h4 class="text-center"><b>預約時段</b></h4> 
    <form id="add_form" action="EventSaveServlet" method="post"> 
        <input type="hidden" name="action" value="edit">
        <input type="hidden" name="empno" value="${empno}">
        <input type="hidden" name="id" value="${id}" id="eventid">
        <input type="hidden" name="date" value="${section_date}">
        
        <label for="title">內容主旨：</label><input type="text" name="title" value="${eventVO.title}" placeholder="輸入預約標題" id="title" class="form-control"></p>
        
        
        <label for="">選擇時段：</label>
        <c:forEach var="section" items="${seclists}">
        	<p><input type="radio" name="section" value="${section.sectiontime}" id="${section.sectionid}" <c:if test="${section.sectiontime == section_time}">checked</c:if> ><label for="${section.sectionid}">${section.sectiontime}</label></p>
        </c:forEach>
        
        
        <label for="remark">備註：</label><textarea name="remark" rows="4" cols="50" id="remark" class="form-control">${eventVO.eventremark}</textarea>
        <div class="sub_btn">
        	<span class="del"><input type="button" class="btn btn_del" id="del_event" value="删除"></span> 
        	<input type="submit" class="btn btn-primary" value="確定"> <input type="button" class="btn btn_cancel" value="取消" onClick="$.fancybox.close()">
       	</div> 
    </form> 
</div> 

<script type="text/javascript" src="../js/jquery.form.min.js"></script>
<script type="text/javascript">
$(function(){
    
    //提交表单
    $('#add_form').ajaxForm({
        beforeSubmit: showRequest, //表单验证
        success: showResponse //成功返回預約考試標題
    }); 

    //删除事件
    $("#del_event").click(function(){
        if(confirm("您确定要删除吗？")){
            var eventid = $("#eventid").val();
            $.post("EventSaveServlet?action=del",{id:eventid},function(msg){
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

function showRequest(){//輸出表單的
    var events = $("#event").val();
    if(events==''){
        alert("請输入日程内容！");
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