<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>編輯考試</title>
</head>
<style>
.content {
	margin: auto;
	padding-bottom: 64px;
	width: 770px;
	disyplay: block;
}

ul {
	list-style-type: none;
	list-style-position: inside;
}

</style>
<body>
	<div class="content">
		<form id="myForm" action="ExamEdit" method="post"  autocomplete="false">
			<div class="header">
				<ul>

					<li><input type="text" name="exam_name"  placeholder="考題名稱" ></li>
					<li><input type="text" name="examno" placeholder="考試代號:java1" required></li>
					<li><input type="number" name="duration" placeholder="考試時間"  min="5" >分鐘</li>
				</ul>
			</div>
			<div class="question">
			<ul >

					<li><textarea  name="title1" placeholder="題目名稱" ></textarea>
					<select class='mySelect'>
					<option value="1">單選</option>
					<option value="1">多選</option>
				</select><br></li>
				
				<li><input type="radio" name="type1" value="1"><input type="text" name="question1" ></li>
				<li><input type="radio" name="type1" value="2"><input type="text" name="question1"></li>
				<li><input type="radio" name="type1" value="3"><input type="text" name="question1"></li>
				<li><input type="radio" name="type1" value="4"><input type="text" name="question1" ></li>
				<li><input type="hidden"  name="questiontype1" value='0'></li>
				
				
			</ul>
			</div>
		
			<input type="hidden" id="numberOfQuestion" name="numberOfQuestion" value='1'>
			<input type="submit" value='submit'>
			<input type="button" value='add' id='addQuestion'>
		</form>
	</div>

</body>
<script src="js/jquery.min.js"></script>
<script>

	var form = $('#myForm');

// 	form.on("change", 'input[type=checkbox]', function() {
// 		changeValue(this);
// 	});
// 	form.on("change", 'input[type=radio]', function() {
// 		changeValue(this);
// 	});

// 	function changeValue(myBtn) {
// 		if(myBtn.value!=0){
// 			myBtn.value = 0;
// 		}else{
// 			myBtn.value = 1;
// 		}
// 		console.log(myBtn.value);
// 	}

	$('#myForm').on(
			'change',
			'.mySelect',
			function(e) {

				var optionSelected = $("option:selected", this);
				var valueSelected = this.value;

				if ('單選' == optionSelected.text()) {
					$("input[name='questiontype" + valueSelected + "']").val(
							"0");
					$("input[name='type" + valueSelected + "']").each(
							function() {
								$(this).clone().attr('type', 'radio')
										.insertAfter(this).prev().remove();
							});

				} else {
					$("input[name='questiontype" + valueSelected + "']").val(
							"1");
					$("input[name='type" + valueSelected + "']").each(
							function() {
								$(this).clone().attr('type', 'checkbox')
										.insertAfter(this).prev().remove();
							});
				}

			});
	
		var numberOfQuestion = 1;

		var jqueryNumberOfQuestion = $('#numberOfQuestion');
		form.submit(function() {
						
			
			jqueryNumberOfQuestion.val(numberOfQuestion);
			return true; // return false to cancel form action
		});
		$('#addQuestion').click(function() {
			numberOfQuestion++;
			appendText();
		});
		function appendText() {

			var div = $('<div class="question"></div>')
			
			var input = '<li><input type="radio" value="1" name="type'+numberOfQuestion+'"><input type="text" name="question'+numberOfQuestion+'" ></li>';
			for(var i=2;i<5;i++){
				input+= '<li><input type="radio" value="'+i+'" name="type'+numberOfQuestion+'"><input type="text" name="question'+numberOfQuestion+'" ></li>';
			}
			var questionType = '<li><input type="hidden"  name="questiontype'+numberOfQuestion+'" value="0"></li>';
			var select = '<li><textarea name="title'+numberOfQuestion+'" placeholder="題目名稱" ></textarea><select class="mySelect"><option value="'+numberOfQuestion+'">單選</option>	<option value="'+numberOfQuestion+'">多選</option></select><br></li>';
			div.html('<ul>' + select + input + questionType + '</ul>');
			jqueryNumberOfQuestion.before(div);
		}

	
</script>
</html>