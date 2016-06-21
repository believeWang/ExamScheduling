<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
response.setHeader("Expires", "0");
%> 
<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF8">
<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />
<title>Exam</title>
<%@ include file="../cdn_bootstrap.file" %>
<link rel="stylesheet" type="text/css" href="exam_resourse/css/demo.css" />
<link rel="stylesheet" type="text/css" href="exam_resourse/css/component.css" />
<link rel="stylesheet" type="text/css"
	href="/ExamScheduling/css/preload.css" />
<link rel="Shortcut Icon" type="image/x-icon" href="/ExamScheduling/images/logo13.ico" />
<style type="text/css">
#content {
	position: absolute;
  	left: 50%;
  	top: 50%;
  	transform: translate(-50%, -50%);
    width: 60%;

    padding: 10px;
    display:block;   
   
}


.buttons{

	 /* 設定footer的高度 */
    height: 40px;
    box-sizing: border-box;
    /* 設定footer絕對位置在底部 */
    position: absolute;
    bottom: 50px;
    /* 展開footer寬度 */
    width: 100%;
    text-align: center;
	

}


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
		resetAll();
		if (questionType == 0) {
			//單選
			singleDiv.fadeIn(500);
//			$("#singleChoice_div").show();
			
			
			//如果這題寫過
			if (userAnswer.length > 0) {
				for (var i = 0, max = options.length; i < max; i++) {
					$('#singleOptionSpan' + (i + 1)).text(options[i]);
					//將寫過的選項checked
					if (userAnswer[i]) {
						var el =$('#singleOption' + (i + 1));
						draw( el.get(0), 'circle' );
						el.prop('checked', true);
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
						var el=$('#mutiOption' + (i + 1));
						draw( el.get(0), 'boxfill' );
						el.prop('checked', true);
					} else {
						$('#mutiOption' + (i + 1)).prop('checked', false);
					}
				}
			} else {
				resetAll();
				for (var i = 0, max = options.length; i < max; i++) {

					$('#mutiOptionSpan' + (i + 1)).text(options[i]);
					$('#mutiOption' + (i + 1)).prop('checked', false);
				}
			}

		}
		//題目，題號
		$('h2').html(questionTitle).fadeIn(500);;
		$("#no").text("Current Question:"+currentQuestion + "/" + totalNumberOfQuizQuestions);
		//判斷下一題按鈕是否出現
		if (currentQuestion > 1) {

			$("#previous").css('visibility', 'visible');
		} else {

			$("#previous").css('visibility', 'hidden');
		}
		if (currentQuestion == totalNumberOfQuizQuestions) {
			$("#next").css('visibility', 'hidden');
		} else {
			$("#next").css('visibility', 'visible');
		}
		//寫過的陣列清空
		userAnswer=[];
	}
	

	function resetRadio( el ) {
		Array.prototype.slice.call( document.querySelectorAll( 'input[type="radio"][name="' + el.getAttribute( 'name' ) + '"]' ) ).forEach( function( el ) { 
			var path = el.parentNode.querySelector( 'svg > path' );
			if( path ) {
				path.parentNode.removeChild( path );
			}
		} );
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

	$(document).ready(function(){

        $('body').addClass('loaded');
	});
	$('form').submit(function() {	
    	$('body').removeClass('loaded');
    	return true; // return false to cancel form action
    });
</script>

</head>
<br />

<body onload="examTimer()">
<!-- loading圖 -->
	<div id="loader-wrapper">
		<div id="loader"></div>
		<div class="loader-section section-left"></div>
        <div class="loader-section section-right"></div>
	</div>

	<div class="codrops-top clearfix">
		<span  id="no"></span>
		<span id="showtime" class="right"></span>
	</div>
	
	

	<div  id="content">
		
	
		
		<section id="singleChoice_div">
			<form class="ac-custom ac-radio ac-circle" autocomplete="off">
				<h2 id="title"></h2>
				<ul>
				<li><input type="radio"  id="singleOption1" name="Answer" value="1">
				<label for="singleOption1" id="singleOptionSpan1"></label>
				</li> 
				<li><input type="radio"  id="singleOption2" name="Answer" value="2">
				<label for="singleOption2" id="singleOptionSpan2"></label>
				</li> 
				<li><input type="radio"  id="singleOption3" name="Answer" value="3">
				<label for="singleOption3" id="singleOptionSpan3"></label>
				</li>
				<li><input type="radio"  id="singleOption4" name="Answer" value="4">
				<label for="singleOption4" id="singleOptionSpan4"></label>
				</li> 
<!-- 			<label for="singleOption5"><input type="radio"  id="singleOption5" name="Answer" value="5" disabled> -->
<!-- 			<span id="singleOptionSpan5"></span></label> -->
				
				</ul>
			</form>
			</section>
			<section id="mutiChoice_div">
			<form class="ac-custom ac-checkbox ac-boxfill" autocomplete="off">
				<h2 id="title"></h2>
				<ul>
				<li><input type="checkbox"  id="mutiOption1" name="Answer" value="1">
				<label for="mutiOption1" id="mutiOptionSpan1"></label>
				</li> 
				<li><input type="checkbox"  id="mutiOption2" name="Answer" value="2">
				<label for="mutiOption2" id="mutiOptionSpan2"></label>
				</li> 
				<li><input type="checkbox"  id="mutiOption3" name="Answer" value="3">
				<label for="mutiOption3" id="mutiOptionSpan3"></label>
				</li>
				<li><input type="checkbox"  id="mutiOption4" name="Answer" value="4">
				<label for="mutiOption4" id="mutiOptionSpan4"></label>
				</li> 
<!-- 			<label for="singleOption5"><input type="radio"  id="singleOption5" name="Answer" value="5" disabled> -->
<!-- 			<span id="singleOptionSpan5"></span></label> -->
				
				</ul>
			</form>
			</section>
		
		

		

	</div>
		<div class="buttons">

				<input class="btn-primary" type="button" id="previous" value="Previous"	style="visibility: hidden" /> 
				<a class="btn btn-warning" href="" id='finishExam'>finish</a>
				<input class="btn-primary" type="button" id="next" value="Next" />
				<br/>
 				<c:forEach var="i" begin="1" end="${sessionScope.totalNumberOfQuizQuestions}">
					<input  class="btn-info" type="button" id="no${i}" value="${i}" onclick=jumpTo(this.value) />
  
				</c:forEach>


		</div>
		


</body>
<script src="exam_resourse/js/svgcheckbx.js"></script>
</html>