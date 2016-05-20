<%@ page language="java" contentType="text/html; charset=UTF8"
	pageEncoding="UTF8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF8">
<title>Quiz</title>

<!-- <script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script> -->
<script src='js/jquery.min.js'></script>
<!-- Bootstrap -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- 依需要參考已編譯外掛版本（如下），或各自獨立的外掛版本 -->
<script src="js/bootstrap.min.js"></script>
<style type="text/css">
#content {
	position: absolute;
  	left: 50%;
  	top: 50%;
  	transform: translate(-50%, -50%);
    width: 60%;
/*     border: 3px solid #73AD21; */
    padding: 10px;
    display:block;   
   
}
#title {
    
	font-size: 5.375rem;
    line-height: 1.04;
    letter-spacing: 0.01em;
    
    font-weight: bold;
    
    position: relative;
    width: 88%;
    max-width: 1520px;
    margin: 0 auto;
    text-align: center;
}
#singleChoice_div{
font-size: 3.375rem;


}
#mutiChoice_div{
font-size: 3.375rem;


}
.buttons{

	text-align: center;
	width:100%;
	height:100px;
	position:absolute;
	bottom:0;
	left:0;


}
span[id*="Option"]{
cursor: pointer;
}
input[type="radio"]:checked+span{ font-weight: bold; } 
input[type="radio"]:not(:checked)+span{ font-weight: normal; } 
input[type="checkbox"]:checked+span{ font-weight: bold; } 
input[type="checkbox"]:not(:checked)+span{ font-weight: normal; } 
</style>
<script language="javascript">
	var tim;
	var min = '${sessionScope.min}';//計時
	var sec = '${sessionScope.sec}';
	var currentQuestion = '${sessionScope.currentQuestion}';//現在的題號
	var totalNumberOfQuizQuestions = '${sessionScope.totalNumberOfQuizQuestions}'//總共題數
	var targetQuestion = currentQuestion;//目標題號  預設是現在的題號
	var selected = [];//被考生選的選項編號
	var questionTitle = '${requestScope.title}'; //題目
	var options = ${requestScope.options};   //選項
	var questionType = ${requestScope.questionType}; //題型
	var userAnswer = [];  //從Server回傳的考生選項
	var singleDiv;
	var mutiDiv;
	var title;

	$(function() {
		singleDiv=$('#singleChoice_div');
		mutiDiv=$('#mutiChoice_div');
		title=$('#title');
		singleDiv.hide();
		mutiDiv.hide();
		title.hide();
		//結束按鈕
		$('#finishExam').click(
				function() {
					//如果沒寫
					if (selected.length == 0) {
						$('#finishExam').attr(
								'href',
								'/ExamScheduling/Examing?currentQuestion='
										+ currentQuestion);
					} else {
						//將選項放到陣列中
						var queryString = "";
						for (var i = 0, max = selected.length; i < max; i++) {
							queryString += '&selected[]=' + selected[i];
						}
						$('#finishExam').attr(
								'href',
								'/ExamScheduling/Examing?currentQuestion='
										+ currentQuestion + queryString);
					}

				});
		//下一題
		$('#next').click(function() {
			targetQuestion++;
			getQuestion();
		});
		//上一題
		$('#previous').click(function() {
			targetQuestion--;
			getQuestion();
		});
		//現在題號
		$("#no").text(currentQuestion + "/" + totalNumberOfQuizQuestions);
		//把第一題的按鈕diable
		$("#no1").prop('disabled', true);
		
		//設置題目
		setQuestion();

		
		
		

	});
	//取得題目  傳目前的題號(存答案用) 目標的題號(抓題目用) 考生的選擇(存考生答案用)
	function getQuestion() {
		
		if (questionType == 0) {
			//singleDiv.fadeOut(500);
			singleDiv.hide();
		}else{
			//mutiDiv.fadeOut(500);
			mutiDiv.hide();
		}
		title.hide();
		//AJAX傳陣列回去
		$.ajax({
			url : '/ExamScheduling/Examing',
			data : {
				'currentQuestion' : currentQuestion,
				'targetQuestion' : targetQuestion,
				'selected' : selected
			},
			type : 'GET',
			dataType : "json",
			success : function(response) {
				//如果這題寫過 將寫過的存入陣列中
				if (response['answer'] != null) {
					
					userAnswer = response['answer'];
					
				}
				//讓上一題按鈕可以使用
				$("#no"+currentQuestion).prop('disabled', false);
				currentQuestion = targetQuestion;
				//讓這一題的按鈕不能使用
				$("#no"+targetQuestion).prop('disabled', true);
				questionTitle = response['title'];  //題目
				options = [];//選項
				options.push(response['option1']);
				options.push(response['option2']);
				options.push(response['option3']);
				options.push(response['option4']);
				questionType = response['questionType'];//題型
				selected = [];//考生選項清空
				setQuestion();

			}
		});
	}
	//設置
	function setQuestion() {
		
		
		
		
		
		

		if (questionType == 0) {
			//單選
			singleDiv.fadeIn(500);
// 			$("#singleChoice_div").show();
			
			
			//如果這題寫過
			if (userAnswer.length > 0) {
				for (var i = 0, max = options.length; i < max; i++) {
					$('#singleOptionSpan' + (i + 1)).text(options[i]);
					//將寫過的選項checked
					if (userAnswer[i]) {
						$('#singleOption' + (i + 1)).prop('checked', true);
					} else {
						$('#singleOption' + (i + 1)).prop('checked', false);
					}
				}
			} else {
				for (var i = 0, max = options.length; i < max; i++) {
					$('#singleOptionSpan' + (i + 1)).text(options[i]);
					$('#singleOption' + (i + 1)).prop('checked', false);
				}
			}

		} else {
			//多選
			
			mutiDiv.fadeIn(500);

			if (userAnswer.length > 0) {
				for (var i = 0, max = options.length; i < max; i++) {

					$('#mutiOptionSpan' + (i + 1)).text(options[i]);
					if (userAnswer[i]) {
						$('#mutiOption' + (i + 1)).prop('checked', true);
					} else {
						$('#mutiOption' + (i + 1)).prop('checked', false);
					}
				}
			} else {
				for (var i = 0, max = options.length; i < max; i++) {

					$('#mutiOptionSpan' + (i + 1)).text(options[i]);
					$('#mutiOption' + (i + 1)).prop('checked', false);
				}
			}

		}
		//題目，題號
		$('#title').html(questionTitle).fadeIn(500);;
		$("#no").text(currentQuestion + "/" + totalNumberOfQuizQuestions);
		//判斷下一題按鈕是否出現
		if (currentQuestion > 1) {

			$("#previous").css('display', 'inline')
		} else {

			$("#previous").css('display', 'none')
		}
		if (currentQuestion == totalNumberOfQuizQuestions) {
			$("#next").css('display', 'none')
		} else {
			$("#next").css('display', 'inline')
		}
		//寫過的陣列清空
		userAnswer=[];
	}
	//選擇
	function choose() {
		selected = [];
		//單選  
		if (questionType == 0) {

			selected.push(document
					.querySelector('input[name = "Answer"]:checked').value);
		} else {
		//多選
			$('input:checkbox:checked[name="Answer"]').each(function(i) {
				selected.push(this.value);
			});
		}

		// 
		//console.log(selected);

	}
	//跳題
	function jumpTo(value){
		//console.log(value);
		targetQuestion=value;
		getQuestion();
	}
//計時
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

	<div  id="content">
		<h1 id="title"></h1><br />

		<div id="singleChoice_div">

			<label for="singleOption1"><input type="radio" onclick="choose()" id="singleOption1" name="Answer" value="1">
			<span id="singleOptionSpan1"></span></label>
			<br /> 
			<label for="singleOption2"><input type="radio" onclick="choose()" id="singleOption2" name="Answer" value="2">
			<span id="singleOptionSpan2"></span></label>
			<br /> 
			<label for="singleOption3"><input type="radio" onclick="choose()" id="singleOption3" name="Answer" value="3">
			<span id="singleOptionSpan3"></span></label>
			<br /> 
			<label for="singleOption4"><input type="radio" onclick="choose()" id="singleOption4" name="Answer" value="4">
			<span id="singleOptionSpan4"></span></label>
			<br /> 
<!-- 			<label for="singleOption5"><input type="radio" onclick="choose()" id="singleOption5" name="Answer" value="5" disabled> -->
<!-- 			<span id="singleOptionSpan5"></span></label> -->
			<br /> <br />
		</div>
		<div id="mutiChoice_div">
			<label for="mutiOption1"><input type="checkbox" onclick="choose()" id="mutiOption1"
				name="Answer" value="1"><span id="mutiOptionSpan1"></span> </label><br />
			<label for="mutiOption2"><input type="checkbox" onclick="choose()" id="mutiOption2"
				name="Answer" value="2"><span id="mutiOptionSpan2"></span></label> <br />
			<label for="mutiOption3"><input type="checkbox" onclick="choose()" id="mutiOption3"
				name="Answer" value="3"><span id="mutiOptionSpan3"></span></label> <br />
			<label for="mutiOption4"><input type="checkbox" onclick="choose()" id="mutiOption4"
				name="Answer" value="4"><span id="mutiOptionSpan4"></span></label> <br />
<!-- 			<label for="mutiOption5"><input type="checkbox" onclick="choose()" id="mutiOption5" -->
<!-- 				name="Answer" value="5"><span id="mutiOptionSpan5"></span> </label><br /> -->


			<br/>
		</div>

		

	</div>
		<div class="buttons">

				<input class="btn-primary" type="button" id="previous" value="Previous"	style="display: none" /> 
				<a href="" id='finishExam'>finish</a>
				<input class="btn-primary" type="button" id="next" value="Next" />
				<br/>
 				<c:forEach var="i" begin="1" end="${sessionScope.totalNumberOfQuizQuestions}">
					<input  class="btn-info" type="button" id="no${i}" value="${i}" onclick=jumpTo(this.value) />
  
				</c:forEach>


		</div>
		


</body>
</html>