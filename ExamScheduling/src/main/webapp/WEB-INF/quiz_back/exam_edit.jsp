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

					<li><input type="text" name="exam_name"  placeholder="考題名稱" required></li>
					<li><input type="text" name="examno" placeholder="考試代號:java1" required></li>
					<li><input type="text" name="exam_explanation" placeholder="考題說明" required></li>
					<li><input type="number" name="quantity" placeholder="考試時間"  min="5" required>分鐘</li>
				</ul>
			</div>
			<div class="question">
			<ul>

					<li><textarea  name="title1" placeholder="題目名稱" ></textarea>
					<select>
					<option value="1">單選</option>
					<option value="1">多選</option>
				</select><br></li>
				
				<li><input type="radio" name="question1"><input type="text"  ></li>
				<li><input type="radio" name="question1"><input type="text"  ></li>
				<li><input type="radio" name="question1"><input type="text"  ></li>
				<li><input type="radio" name="question1"><input type="text"  ></li>
				
				
				
			</ul>
			</div>
			<div class="question">
			<ul>

					<li><textarea name="title2" placeholder="題目名稱" ></textarea>
					<select>
					<option value="2">單選</option>
					<option value="2">多選</option>
				</select><br></li>
				
				<li><input type="radio" name="question2"><input type="text"  ></li>
				<li><input type="radio" name="question2"><input type="text"  ></li>
				<li><input type="radio" name="question2"><input type="text"  ></li>
				<li><input type="radio" name="question2"><input type="text"  ></li>
				
				
				
			</ul>
			</div>
			<div class="question">
			<ul>

					<li><textarea name="title3" placeholder="題目名稱" ></textarea>
					<select>
					<option value="3">單選</option>
					<option value="3">多選</option>
				</select><br></li>
				
				<li><input type="radio" name="question3"><input type="text"  ></li>
				<li><input type="radio" name="question3"><input type="text"  ></li>
				<li><input type="radio" name="question3"><input type="text"  ></li>
				<li><input type="radio" name="question3"><input type="text"  ></li>
				
				
				
			</ul>
			</div>
			<input type="hidden" id="numberOfQuestion" name="numberOfQuestion" value='1'>
			<input type="submit" value='submit'>
			<input type="button" id="fortest" value='一件輸入'>
		</form>
	</div>

</body>
<script src="js/jquery.min.js"></script>
<script>
	$('fortest').on('click', function(e) {
		234
	});
	$('select').on(
			'change',
			function(e) {

				var optionSelected = $("option:selected", this);
				var valueSelected = this.value;

				if ('單選' == optionSelected.text()) {
					$("input[name='question" + optionSelected.val() + "']")
							.each(
									function() {
										$(this).clone().attr('type', 'radio')
												.insertAfter(this).prev()
												.remove();
									});

				} else {
					$("input[name='question" + optionSelected.val() + "']")
							.each(
									function() {
										$(this).clone()
												.attr('type', 'checkbox')
												.insertAfter(this).prev()
												.remove();
									});
				}

			});
	$(function() {
		$('#myForm').submit(function() {
			$('#numberOfQuestion').val(3);
			return true; // return false to cancel form action
		});
	});
</script>
</html>