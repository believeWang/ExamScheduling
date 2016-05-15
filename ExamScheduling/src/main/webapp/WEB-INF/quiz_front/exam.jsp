<%@ page language="java" contentType="text/html; charset=UTF8"
	pageEncoding="UTF8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF8">
<title>Quiz</title>
<style type="text/css">
body {
	background: url("exam_resourse/images/background.jpg");
}
</style>
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
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

	$(function() {
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
			$("#singleChoice_div").show();
			$("#mutiChoice_div").hide();
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
			$("#singleChoice_div").hide();
			$("#mutiChoice_div").show();

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
		$('#title').html(questionTitle);
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

	<div
		style="position: absolute; width: 1000px; padding: 25px; height: 200px; border: 1px solid green; left: 100px; top: 60px">
		<span id="title"></span><br /> <br />

		<div id="singleChoice_div">

			<input type="radio" onclick="choose()" id="singleOption1"
				name="Answer" value="1"><span id="singleOptionSpan1"></span>
			<br /> <input type="radio" onclick="choose()" id="singleOption2"
				name="Answer" value="2"><span id="singleOptionSpan2"></span>
			<br /> <input type="radio" onclick="choose()" id="singleOption3"
				name="Answer" value="3"><span id="singleOptionSpan3"></span>
			<br /> <input type="radio" onclick="choose()" id="singleOption4"
				name="Answer" value="4"><span id="singleOptionSpan4"></span>
			<br /> <input type="radio" onclick="choose()" id="singleOption5"
				name="Answer" value="5"><span id="singleOptionSpan5"></span>
			<br /> <br />
		</div>
		<div id="mutiChoice_div">
			<input type="checkbox" onclick="choose()" id="mutiOption1"
				name="Answer" value="1"><span id="mutiOptionSpan1"></span> <br />
			<input type="checkbox" onclick="choose()" id="mutiOption2"
				name="Answer" value="2"><span id="mutiOptionSpan2"></span> <br />
			<input type="checkbox" onclick="choose()" id="mutiOption3"
				name="Answer" value="3"><span id="mutiOptionSpan3"></span> <br />
			<input type="checkbox" onclick="choose()" id="mutiOption4"
				name="Answer" value="4"><span id="mutiOptionSpan4"></span> <br />
			<input type="checkbox" onclick="choose()" id="mutiOption5"
				name="Answer" value="5"><span id="mutiOptionSpan5"></span> <br />



		</div>


		<input type="button" id="previous" value="Previous"	style="display: none" /> 
			<input type="button" id="next" value="Next" />

		<!-- 	 	 <input type="button" id="finish"  value="Finish Exam" /> -->
		<a href="" id='finishExam'>finish</a>
		</br>
		</br>
	
	 <c:forEach var="i" begin="1" end="${sessionScope.totalNumberOfQuizQuestions}">
	 <input type="button" id="no${i}" value="${i}" onclick=jumpTo(this.value) />
  
	</c:forEach>




	</div>



</body>
</html>