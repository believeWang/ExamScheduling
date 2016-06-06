<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>編輯考試</title>
<!-- materialize設計 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.6/css/materialize.min.css">
<!-- ICON -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<!-- sweetalert css -->
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/sweetalert2/3.2.3/sweetalert2.min.css" />
<link rel="stylesheet" type="text/css"
	href="exam_resourse/css/custom_form.css" />

<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<!-- Compiled and minified JavaScript -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.6/js/materialize.min.js"></script>

<!-- JQUERY驗證 -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.15.0/jquery.validate.min.js"></script>
<!--sweetalert js  -->
<script
	src="https://cdn.jsdelivr.net/sweetalert2/3.2.3/sweetalert2.min.js"></script>

<style>
ul {
	list-style-type: none;
}

.toc-wrapper {
	position: fixed !important;
}

i[class='tiny material-icons'] {
	cursor: pointer;
	margin-left: 60px;
}

a[href|='#q'] {color =red;width =35px;
	
}
</style>

</head>
<body>


	<div class="content">
		<div class="row">
			<div class="col s12 m9 l10">
				<form id="myForm" action="ExamEdit" enctype="multipart/form-data"
					method="post" autocomplete="off" class="col s12">
					<!-- 判斷是編輯還是新增 -->
					<c:choose>
						<c:when test='${requestScope.editMode}'>
							<div class="row">

								<div class="input-field col s12">
									<input name="exam_name" type="text" value="${examVO.examTitle}">
									<label for="exam_name">考試題目</label>
								</div>
							</div>

							<div class="row">
								<div class="input-field col s12">

									<input name="examno" type="text" disabled
										value="${examVO.examno}"> <label for="examno">考試編號</label>
									<input name="examno" type="hidden" value="${examVO.examno}">
								</div>
							</div>
							<div class="row">
								<!-- 書籤!!! -->
								<label id="detail" class="scrollspy">考試時間(分鐘)</label>
								<p class="range-field">
									<input type="range" name="duration" min="5" max="120"
										value="${examVO.duration}" />
								</p>
							</div>
							<div class="row">
								<div class="file-field input-field">
									<div class="btn">

										<span>考試圖片</span> <input type="file" name="image"
											accept=".jpg,.png">
									</div>
									<div class="file-path-wrapper">
										<input class="file-path validate" placeholder="png or jpg"
											type="text">
									</div>
								</div>
							</div>
							<!-- 題目迴圈 -->
							<c:forEach var="question" items="${requestScope.questionList}"
								varStatus="counter">
								<div class="row">


									<div class="input-field col s8">
										<textarea name="title${counter.count }"
											class="materialize-textarea"><c:out
												value="${question.question }" /></textarea>
										<label for="title${counter.count }">題目</label>

									</div>
									<!-- 單選多選 -->
									<c:choose>
										<c:when test="${question.questionType eq 0}">
											<!-- 單選 -->
											<div class="input-field col s4">
												<select class='mySelect'>
													<option value="0" disabled selected>題型</option>
													<option value="${counter.count }" selected>單選</option>
													<option value="${counter.count }">多選</option>

												</select>
											</div>
											<input type="hidden" name="questiontype${counter.count }"
												value='0'>
								</div>
								<!-- 選項迴圈 -->
								<c:forEach var="option" items="${question.options}"
									varStatus="optionCounter">
									<div class="row">

										<div class="input-field col s2">
											<!-- 判斷是否為答案 -->
											<c:choose>
												<c:when test="${option.isAnswer}">
													<input name="group${counter.count }" type="radio"
														id="${counter.count }option${optionCounter.count }"
														checked class="with-gap" value="${optionCounter.count }" />

												</c:when>
												<c:otherwise>
													<input name="group${counter.count }" type="radio"
														id="${counter.count }option${optionCounter.count }"
														class="with-gap" value="${optionCounter.count }" />

												</c:otherwise>
											</c:choose>
											<!-- 第一個要加上ID -->
											<c:choose>
												<c:when test="${optionCounter.count eq 1}">
													<label for="${counter.count }option${optionCounter.count }"
														id="q${counter.count }" class="scrollspy"></label>

												</c:when>
												<c:otherwise>
													<label for="${counter.count }option${optionCounter.count }"></label>

												</c:otherwise>
											</c:choose>

										</div>
										<div class="input-field col s10">
											<input name="question${counter.count }" type="text"
												value="<c:out value="${option.optionsName }"/>"> <label>選項</label>
										</div>

									</div>



									<!-- end 選項 -->
								</c:forEach>
								<!-- 單選 -->
						</c:when>

						<c:otherwise>
							<!-- 多選 -->
							<div class="input-field col s4">
								<select class='mySelect'>
									<option value="0" disabled selected>題型</option>
									<option value="${counter.count }">單選</option>
									<option value="${counter.count }" selected>多選</option>

								</select>
							</div>
							<input type="hidden" name="questiontype${counter.count }"
								value='1'>
			</div>

			<!-- 選項迴圈 -->
			<c:forEach var="option" items="${question.options}"
				varStatus="optionCounter">
				<div class="row">

					<div class="input-field col s2">
						<!-- 判斷是否為答案 -->
						<c:choose>
							<c:when test="${option.isAnswer}">
								<input name="group${counter.count }" type="checkbox"
									id="${counter.count }option${optionCounter.count }" checked
									class="with-gap" value="${optionCounter.count }" />

							</c:when>
							<c:otherwise>
								<input name="group${counter.count }" type="checkbox"
									id="${counter.count }option${optionCounter.count }"
									class="with-gap" value="${optionCounter.count }" />

							</c:otherwise>
						</c:choose>
						<!-- 第一個要加上ID -->
						<c:choose>
							<c:when test="${optionCounter.count eq 1}">
								<label for="${counter.count }option${optionCounter.count }"
									id="q${counter.count }" class="scrollspy"></label>

							</c:when>
							<c:otherwise>
								<label for="${counter.count }option${optionCounter.count }"></label>

							</c:otherwise>
						</c:choose>

					</div>
					<div class="input-field col s10">
						<input name="question${counter.count }" type="text"
							value="<c:out value="${option.optionsName }"/>"> <label>選項</label>
					</div>

				</div>



				<!-- END選項迴圈 -->
			</c:forEach>

			<!-- 多選 -->
			</c:otherwise>
			</c:choose>
			<!--單多選  -->


			<!--END 題目 -->
			</c:forEach>
			<!-- 編輯 -->
			<input type="hidden" id="numberOfQuestion" name="numberOfQuestion"
				value='${examVO.quantities}'>
			</c:when>


			<c:otherwise>
				<!-- 新增 -->
				<div class="row">

					<div class="input-field col s12">
						<input name="exam_name" type="text"> <label
							for="exam_name">考試題目</label>
					</div>
				</div>

				<div class="row">
					<div class="input-field col s12">

						<input name="examno" type="text" required> <label
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

							<span>考試圖片</span> <input type="file" name="image"
								accept=".jpg,.png">
						</div>
						<div class="file-path-wrapper">
							<input class="file-path validate" placeholder="png or jpg"
								type="text">
						</div>
					</div>
				</div>
				<!-- q1start -->
				<div class="row">


					<div class="input-field col s8">
						<textarea name="title1" class="materialize-textarea"></textarea>
						<label for="title1">題目</label>

					</div>
					<div class="input-field col s4">
						<select class='mySelect'>
							<option value="0" disabled selected>題型</option>
							<option value="1">單選</option>
							<option value="1">多選</option>

						</select>
					</div>
					<input type="hidden" name="questiontype1" value='0'>

				</div>
				<div class="row">

					<div class="input-field col s2">
						<input name="group1" type="radio" id="1option1" class="with-gap"
							value="1" /> <label for="1option1" id="q1" class="scrollspy"></label>

					</div>
					<div class="input-field col s10">
						<input name="question1" type="text"> <label>選項</label>
					</div>

				</div>
				<div class="row">

					<div class="input-field col s2">
						<input name="group1" type="radio" id="1option2" class="with-gap"
							value="2" /> <label for="1option2"></label>

					</div>
					<div class="input-field col s10">
						<input name="question1" type="text"> <label>選項</label>
					</div>

				</div>
				<div class="row">

					<div class="input-field col s2">
						<input name="group1" type="radio" id="1option3" class="with-gap"
							value="3" /> <label for="1option3"></label>

					</div>
					<div class="input-field col s10">
						<input name="question1" type="text"> <label>選項</label>
					</div>

				</div>
				<div class="row">

					<div class="input-field col s2">
						<input name="group1" type="radio" id="1option4" class="with-gap"
							value="4" /> <label for="1option4"></label>

					</div>
					<div class="input-field col s10">
						<input name="question1" type="text"> <label
							for="exam_name">選項</label>
					</div>

				</div>

				<!-- q1end -->


				<input type="hidden" id="numberOfQuestion" name="numberOfQuestion"
					value='1'>
			</c:otherwise>
			</c:choose>

			<button class="btn waves-effect waves-light" type="submit"
				name="action">
				儲存 <i class="material-icons right">send</i>
			</button>





			</form>

		</div>


		<div class="row">
			<div class="col hide-on-small-only m3 l2">
				<div class="toc-wrapper" style="width: 180px; height: 100%;">


					<ul class="section table-of-contents">
						<li><a href="#detail">考試資料</a></li>
						<li id='test'><a href="#q1">01</a><i id='i1'
							class="tiny material-icons">delete</i></li>

					</ul>

				</div>
			</div>
		</div>
		<div class="fixed-action-btn horizontal "
			style="bottom: 45px; right: 24px;">
			<a class="btn-floating btn-large teal darken-3"> <i class="material-icons">menu</i>
			</a>
			<ul>
				
				<li><a href="ExamList" class="btn-floating red darken-1"><i
						class="material-icons">replay</i></a></li>
						<li><a id='addQuestion' class="btn-floating teal lighten-2"><i
						class="material-icons">add</i></a></li>

			</ul>
		</div>

	</div>




</body>
<script>
	$(document).ready(function() {
		$('select').material_select();
		$('.scrollspy').scrollSpy();
		var wrapper = $('.toc-wrapper');
		wrapper.pushpin({
			top : 200
		});
		//         隱藏滾輪軸
		wrapper.on("mouseenter mouseleave", function(event) { //挷定滑鼠進入及離開事件
			if (event.type == "mouseenter") {
				$(this).css({
					"overflow-y" : "scroll"
				}); //滑鼠進入
			} else {
				$(this).scrollTop(0).css({
					"overflow-y" : "hidden"
				}); //滑鼠離開
			}
		});
	});
</script>
<script src="exam_resourse/js/exameditjs.js"></script>

</html>