<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>編輯考試</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.6/css/materialize.min.css">
<link rel="stylesheet" type="text/css" href="exam_resourse/css/custom_form.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<!-- Compiled and minified JavaScript -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.6/js/materialize.min.js"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.15.0/jquery.validate.min.js"></script>

<style>

ul {
	list-style-type: none;
}

.toc-wrapper {
	position: fixed !important;
}
i[class='tiny material-icons']{
cursor: pointer;
margin-left:60px;

}
a[href|='#q']{
color=red;
width=35px;
}
</style>

</head>
<body>
	

	<div class="content">
	<div class="row">
			<div class="col s12 m9 l10">
				<form id="myForm" action="ExamEdit" enctype="multipart/form-data" method="post" autocomplete="off"
					class="col s12">
				
						<div class="row">

							<div class="input-field col s12">
								<input  name="exam_name" type="text"  > <label
									for="exam_name" >考試題目</label>
							</div>
						</div>
					
					<div class="row">
						<div class="input-field col s12">
						
							<input name="examno" type="text"  required> <label
								for="examno">考試編號</label>
						</div>
					</div>
					<div class="row">
					<!-- 書籤!!! -->
						<label id="detail" class="scrollspy">考試時間(分鐘)</label>
						<p class="range-field">
							<input type="range" name="duration" min="5" max="120" />
						</p>
					</div>
					<div class="row">
						<div class="file-field input-field">
							<div class="btn">
							
								<span >考試圖片</span> <input type="file" name="image" accept=".jpg,.png">
							</div>
							<div class="file-path-wrapper">
								<input class="file-path validate" placeholder="png or jpg"
									type="text">
							</div>
						</div>
					</div>
					<!-- q1start -->
					<div class="row" >
						
						
							<div class="input-field col s8">
								<textarea name="title1" class="materialize-textarea"></textarea>
								<label for="title1" >題目</label>

							</div>
							<div class="input-field col s4">
								<select class='mySelect'>
									<option value="0" disabled selected>題型</option>
									<option value="1">單選</option>
									<option value="1">多選</option>

								</select>
							</div>
							<input type="hidden"  name="questiontype1" value='0'>
						
					</div>
					<div class="row">

						<div class="input-field col s2">
							<input name="group1" type="radio" id="1option1" class="with-gap"  value="1" />
							<label for="1option1" id="q1" class="scrollspy"></label>

						</div>
						<div class="input-field col s10">
							<input name="question1" type="text" > <label>選項</label>
						</div>

					</div>
					<div class="row">

						<div class="input-field col s2">
							<input name="group1" type="radio" id="1option2" class="with-gap"  value="2"/>
							<label for="1option2"></label>

						</div>
						<div class="input-field col s10">
							<input name="question1" type="text"> <label>選項</label>
						</div>

					</div>
					<div class="row">

						<div class="input-field col s2">
							<input name="group1" type="radio" id="1option3" class="with-gap"  value="3"/>
							<label for="1option3"></label>

						</div>
						<div class="input-field col s10">
							<input name="question1" type="text"> <label>選項</label>
						</div>

					</div>
					<div class="row">

						<div class="input-field col s2">
							<input name="group1" type="radio" id="1option4" class="with-gap"  value="4" />
							<label for="1option4"></label>

						</div>
						<div class="input-field col s10">
							<input name="question1" type="text"> <label
								for="exam_name">選項</label>
						</div>

					</div>
					
					<!-- q1end -->
				
				
					<input type="hidden" id="numberOfQuestion" name="numberOfQuestion" value='1'> 
					<button class="btn waves-effect waves-light" type="submit"
						name="action">
						Submit <i class="material-icons right">send</i>
					</button>





				</form>

			</div>

   
			<div class="row">
				<div class="col hide-on-small-only m3 l2" >
					<div class="toc-wrapper" style="width: 180px; height: 100%;">


						<ul class="section table-of-contents">
							<li><a href="#detail">考試資料</a></li>
							<li id='test'><a href="#q1">01</a><i id='i1' class="tiny material-icons">delete</i></li>

						</ul>

					</div>
				</div>
			</div>
			
			<div class="fixed-action-btn" style="bottom: 45px; right: 24px;">
				<a id='addQuestion' class="btn-floating btn-large waves-effect waves-light red"><i
					class="material-icons">add</i></a>
			</div>
		</div>
	</div>
		
		
<!-- 			<div class="header"> -->
<!-- 				<ul> -->

<!-- 					<li class="group"> -->
<!-- 							<input type="text" name="exam_name"  placeholder="考題名稱" > 	 -->
<!-- 							 <span class="headerbar"></span> -->
<!-- 						</li> -->
<!-- 					<li class="group"><input type="text" name="examno" placeholder="考試代號:java1" required><span class="headerbar"></span> -->
<!-- 							</li> -->
<!-- 					<li><input type="number" name="duration" placeholder="考試時間(分鐘)"  min="5" ><span class="headerbar"></span></li> -->
<!-- 				</ul> -->
<!-- 			</div> -->
<!-- 			<div class="question"> -->
<!-- 			<ul > -->

<!-- 					<li ><textarea  name="title1" placeholder="題目名稱" ></textarea> -->
<!-- 					<select class='mySelect'> -->
<!-- 					<option value="1">單選</option> -->
<!-- 					<option value="1">多選</option> -->
<!-- 				</select><br></li> -->
				
<!-- 				<li class="group"><input type="radio" name="type1" value="1"><input type="text" name="question1" ><span class="questionbar"></span></li> -->
<!-- 				<li class="group"><input type="radio" name="type1" value="2"><input type="text" name="question1"><span class="questionbar"></span></li> -->
<!-- 				<li class="group"><input type="radio" name="type1" value="3"><input type="text" name="question1"><span class="questionbar"></span></li> -->
<!-- 				<li class="group"><input type="radio" name="type1" value="4"><input type="text" name="question1" ><span class="questionbar"></span></li> -->
<!-- 				<li class="group"><input type="hidden"  name="questiontype1" value='0'></li> -->
				
				
<!-- 			</ul> -->
<!-- 			</div> -->
		
<!-- 			<input type="hidden" id="numberOfQuestion" name="numberOfQuestion" value='1'> -->
<!-- 			<input type="submit" value='submit'> -->
<!-- 			<input type="button" value='add' id='addQuestion'> -->
	

</body>
<script>
     $(document).ready(function() {
        $('select').material_select();
        $('.scrollspy').scrollSpy();
        var wrapper=$('.toc-wrapper');
        wrapper .pushpin({ top: 200 });
        wrapper.on("mouseenter mouseleave", function (event) { //挷定滑鼠進入及離開事件
        	  if (event.type == "mouseenter") {
        	    $(this).css({"overflow-y": "scroll"}); //滑鼠進入
        	  } else {
        	    $(this).scrollTop(0).css({"overflow-y": "hidden"}); //滑鼠離開
        	  }
        	});
    });
  </script>
<script src="exam_resourse/js/exameditjs.js"></script>

</html>