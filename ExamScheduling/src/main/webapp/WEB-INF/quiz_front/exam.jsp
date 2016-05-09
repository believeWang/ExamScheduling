<%@ page language="java" contentType="text/html; charset=UTF8"
	pageEncoding="UTF8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Quiz</title>
<style type="text/css">
body {
	background:
		url("exam_resourse/images/background.jpg");
}
</style>
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script language="javascript">
    
	var tim;
	var min = '${sessionScope.min}';
	var sec = '${sessionScope.sec}';
	var currentQuestion ='${sessionScope.currentQuestion}';
	var totalNumberOfQuizQuestions= '${sessionScope.totalNumberOfQuizQuestions}'
	
	$(function(){
		


		$('#next').click( function() {
			currentQuestion++;
			getQuestion(); } );
		
		$('#previous').click( function() {
			currentQuestion--;
			getQuestion();
		} );
		
		function getQuestion(){
			console.log(currentQuestion);
			$.ajax({
			    url: '/ExamScheduling/Examing?currentQuestion='+currentQuestion,
			    type: 'GET',
			    dataType: "json",			  
			    success: function(response) {
			    	
			    	$('#title').html(response['title']);
			    	$('#option1').text(response['option1']);
			    	$('#option2').text(response['option2']);
			    	$('#option3').text(response['option3']);
			    	$('#option4').text(response['option4']);
			    	$("#no").text(currentQuestion);
			    	if(currentQuestion>1){
			    		
			    		$("#previous").css('display','inline')
			    	}else{
			    		
			    		$("#previous").css('display','none')
			    	}
			    	if(currentQuestion==totalNumberOfQuizQuestions){
			    		$("#next").css('display','none')
			    	}else{
			    		$("#next").css('display','inline')
			    	}
			    	
			    	
			 
			    }
			  });
		}

		
	});
	
		
		
	
	function finishExam() {

	
	}

	function passToServlet() {
		console.log('passToServlet');
		
		
	
		//document.questionForm.minute.value = min;
		//document.questionForm.second.value = sec;
		//document.questionForm.submit();
	}

	function examTimer() {
		if (parseInt(sec) > 0) {

			document.getElementById("showtime").innerHTML = "Time Remaining :"
					+ min + " Minute ," + sec + " Seconds";
			sec = parseInt(sec) - 1;
			tim = setTimeout("examTimer()", 1000);
		} else {

			if (parseInt(min) == 0 && parseInt(sec) == 0) {
				document.getElementById("showtime").innerHTML = "Time Remaining :"
						+ min + " Minute ," + sec + " Seconds";
				alert("Time Up");
				document.questionForm.minute.value = 0;
				document.questionForm.second.value = 0;
				document.questionForm.submit();

			}

			if (parseInt(sec) == 0) {
				document.getElementById("showtime").innerHTML = "Time Remaining :"
						+ min + " Minute ," + sec + " Seconds";
				min = parseInt(min) - 1;
				sec = 59;
				tim = setTimeout("examTimer()", 1000);
			}

		}
	}
</script>

</head>
<br />

<body onload="examTimer()">

	<div style="position: absolute; left: 50px; top: 20px">
	
		Current Question <span id="no">1</span> /
		${totalNumberOfQuizQuestions}
	</div>

	<div id="showtime" style="position: absolute; left: 800px; top: 20px"></div>

	<div
		style="position: absolute; width: 1000px; padding: 25px; height: 200px; border: 1px solid green; left: 100px; top: 60px">
		<span id="title">${requestScope.title}</span><br />
		<br />

	<div id="choice_div">
		<c:forEach var="choice" items="${requestScope.options}"
			varStatus="counter">
			<input type="radio"   name="answer"  value="${counter.count}"><span id="option${counter.count}">${choice.optionsName}</span>  <br />
		</c:forEach>
		<br />
 </div>

	
		 <input type="submit" id="previous" name="action" value="Previous" style="display:none"/>
		

	
			 <input type="submit" id="next"  name="action" value="Next" />


	
	 <input type="submit" name="action" value="Finish Exam" onclick="customSubmit" />

	




	</div>



</body>
</html>