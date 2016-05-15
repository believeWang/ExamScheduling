<%@ page language="java" contentType="text/html; charset=UTF8"
	pageEncoding="UTF8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF8">
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
	var targetQuestion=currentQuestion;
	var selected=[];
	var questionTitle='${requestScope.title}';
	var options=${requestScope.options};
	var questionType=${requestScope.questionType};
	
	$(function(){
		$('#finishExam').click(function(){
			if(selected.length==0){
				$('#finishExam').attr('href','/ExamScheduling/Examing?currentQuestion='+currentQuestion);
			}else{
				var queryString="";
				for(var i=0,max=selected.length;i<max;i++){
					queryString+='&selected[]='+selected[i];
				}
				$('#finishExam').attr('href','/ExamScheduling/Examing?currentQuestion='+currentQuestion+queryString);
			}
			
		});
		$('#next').click( function() {
			targetQuestion++;
			getQuestion(); } );
		
		$('#previous').click( function() {
			targetQuestion--;
			getQuestion();
		} );
		$("#no").text(currentQuestion+"/"+totalNumberOfQuizQuestions);
		setQuestion();
		
		function getQuestion(){
			//AJAX傳陣列回去
			$.ajax({
			    url: '/ExamScheduling/Examing',
			    data:{'currentQuestion':currentQuestion,'targetQuestion':targetQuestion,'selected':selected},
			    type: 'GET',
			    dataType: "json",			  
			    success: function(response) {
			    	currentQuestion=targetQuestion;
			    	questionTitle=response['title'];
			    	options=[];
			    	options.push(response['option1']);
			    	options.push(response['option2']);
			    	options.push(response['option3']);
			    	options.push(response['option4']);
			    	questionType=response['questionType'];
			    	selected=-1;
			    	setQuestion();
			 
			    }
			  });
		}
		function setQuestion(){
			
			if(questionType==0){
				//單選
// 				$("#singleChoice_div").css('display','inline');
// 				$("#mutiChoice_div").css('display','none');
				$("#singleChoice_div").show();
				$("#mutiChoice_div").hide();
				for(var i=0,max=options.length;i<max;i++){
					$('#singleOptionSpan'+(i+1)).text(options[i]);
					$('#singleOption'+(i+1)).prop('checked', false);
				}
			
		    	
		  
				
			}else{
				//多選
// 				$("#mutiChoice_div").css('display','inline');
// 				$("#singleChoice_div").css('display','none');
				$("#singleChoice_div").hide();
				$("#mutiChoice_div").show();
				
				for(var i=0,max=options.length;i<max;i++){
					$('#mutiOption'+(i+1)).prop('checked', false);
					$('#mutiOptionSpan'+(i+1)).text(options[i]);
				}
			}
			//題目，題號
			$('#title').html(questionTitle);
			$("#no").text(currentQuestion+"/"+totalNumberOfQuizQuestions);
			//判斷下一題是否出現
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
	
	function choose(){
		selected=[];
		if(questionType==0){
			
			selected.push(document.querySelector('input[name = "Answer"]:checked').value);
		}else{
			
			$('input:checkbox:checked[name="Answer"]').each(function(i) {selected.push(this.value); });
		}
	
		
		// 
		//console.log(selected);
		
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
	
		Current Question <span id="no">1</span>
	</div>

	<div id="showtime" style="position: absolute; left: 800px; top: 20px"></div>

	<div
		style="position: absolute; width: 1000px; padding: 25px; height: 200px; border: 1px solid green; left: 100px; top: 60px">
		<span id="title"></span><br />
		<br />

	<div id="singleChoice_div">
		
			<input type="radio"  onclick="choose()" id="singleOption1" name="Answer"  value="1"><span id="singleOptionSpan1"></span>  <br />
			<input type="radio"  onclick="choose()" id="singleOption2" name="Answer"  value="2"><span id="singleOptionSpan2"></span>  <br />
			<input type="radio"  onclick="choose()" id="singleOption3" name="Answer"  value="3"><span id="singleOptionSpan3"></span>  <br />
			<input type="radio"  onclick="choose()" id="singleOption4" name="Answer"  value="4"><span id="singleOptionSpan4"></span>  <br />
			<input type="radio"  onclick="choose()" id="singleOption5" name="Answer"  value="5"><span id="singleOptionSpan5"></span>  <br />
		
		<br />
 </div>
 <div id="mutiChoice_div">
  			<input type="checkbox"  onclick="choose()" id="mutiOption1" name="Answer"  value="1"><span id="mutiOptionSpan1"></span>  <br />
			<input type="checkbox"  onclick="choose()" id="mutiOption2" name="Answer"  value="2"><span id="mutiOptionSpan2"></span>  <br />
			<input type="checkbox"  onclick="choose()" id="mutiOption3" name="Answer"  value="3"><span id="mutiOptionSpan3"></span>  <br />
			<input type="checkbox"  onclick="choose()" id="mutiOption4" name="Answer"  value="4"><span id="mutiOptionSpan4"></span>  <br />
			<input type="checkbox"  onclick="choose()" id="mutiOption5" name="Answer"  value="5"><span id="mutiOptionSpan5"></span>  <br />
		
 
 
 </div>

	
		 <input type="button" id="previous" value="Previous" style="display:none"/>		

	     <input type="button" id="next"   value="Next" />

<!-- 	 	 <input type="button" id="finish"  value="Finish Exam" /> -->
		<a href="" id='finishExam'>finish</a>

	




	</div>



</body>
</html>