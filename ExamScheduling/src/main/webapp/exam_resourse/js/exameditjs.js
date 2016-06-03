var form = $('#myForm');
// 改變單選多選
form.on('change', '.mySelect', function(e) {

	var optionSelected = $("option:selected", this);
	var valueSelected = this.value;
	if (valueSelected == 'undefined')
		return;

	// console.log(valueSelected);

	if ('單選' == optionSelected.text()) {
		$("input[name='questiontype" + valueSelected + "']").val("0");
		$("input[name='group" + valueSelected + "']").each(
				function() {
					$(this).clone().attr('type', 'radio').insertAfter(this)
							.prev().remove();
				});

	} else {
		$("input[name='questiontype" + valueSelected + "']").val("1");
		$("input[name='group" + valueSelected + "']").each(
				function() {
					$(this).clone().attr('type', 'checkbox').insertAfter(this)
							.prev().remove();
				});
	}

});

var numberOfQuestion = 1;
var idNum = 1;
var jqueryNumberOfQuestion = $('#numberOfQuestion');
var addBtn = $('#addQuestion');
var ul = $('ul[class="section table-of-contents"]');
// submit前把總題數傳進去
form.submit(function() {
	jqueryNumberOfQuestion.val(idNum);
	return true; // return false to cancel form action
});
// 增加
addBtn.click(function() {
	idNum++;
	numberOfQuestion++;
	appendText();
	addBtn.attr('href', '#q' + idNum);
});
function appendText() {

	var divrow = $('<div class="row"></div>');
	// var divq=$('<div id="q'+idNum+'" class="scrollspy"></div>');
	var divtitle = $('<div class="input-field col s8"></div>');
	var divtype = $('<div class="input-field col s4"></div>');

	divtitle.append('<textarea name="title' + idNum
			+ '" class="materialize-textarea"></textarea>', '<label for="title'
			+ idNum + '">題目</label>');
	divtype
			.append('<select class="mySelect"><option value="0" disabled selected>題型</option><option value="'
					+ idNum
					+ '">單選</option><option value="'
					+ idNum
					+ '">多選</option></select>');

	// divq.append(divtitle,divtype);
	divrow.append(divtitle, divtype, '<input type="hidden"  name="questiontype'
			+ idNum + '" value="0">');

	jqueryNumberOfQuestion.before(divrow);
	var divOption = null;
	for (var i = 1; i < 5; i++) {
		divOption = $('<div class="row"></div>');
		if (i == 1)
			var optionRadio = $('<div class="input-field col s2"><input  value="1" name="group'
					+ idNum
					+ '" type="radio" id="'
					+ idNum
					+ 'option'
					+ i
					+ '" class="with-gap" /><label id="q'
					+ idNum
					+ '" class="scrollspy" for="'
					+ idNum
					+ 'option'
					+ i
					+ '"></label></div>');
		else
			var optionRadio = $('<div class="input-field col s2"><input  value="'
					+ i
					+ '" name="group'
					+ idNum
					+ '" type="radio" id="'
					+ idNum
					+ 'option'
					+ i
					+ '" class="with-gap" /><label  for="'
					+ idNum
					+ 'option'
					+ i + '"></label></div>');
		var optionText = $('<div class="input-field col s10"><input name="question'
				+ idNum + '" type="text"> <label>選項</label></div>');
		divOption.append(optionRadio, optionText);

		jqueryNumberOfQuestion.before(divOption);
	}
	if (numberOfQuestion < 10)
		ul.append('<li><a href="#q' + idNum + '">0' + numberOfQuestion
				+ '</a><i id="i' + idNum
				+ '" class="tiny material-icons">delete</i></li>');
	else
		ul.append('<li><a href="#q' + idNum + '">' + numberOfQuestion
				+ '</a><i id="i' + idNum
				+ '" class="tiny material-icons">delete</i></li>');

	$('select').material_select();
	$('.scrollspy').scrollSpy();
}
// 刪除
var rightUl = $('ul[class="section table-of-contents"]');
rightUl.on("click", "i[id*='i']", function() {
	numberOfQuestion--;

	var questionNO = $(this).attr('id');
	questionNO = parseInt(questionNO.replace("i", ""));

	//			
	$('input[name="group' + questionNO + '"]').parent().parent().remove();
	$('textarea[name="title' + questionNO + '"]').parent().parent().remove();

	rightUl.children('li').each(function(index, value) {
		if (index == 0)
			return;
		value = $(value);

		var valueId = value.children('i').attr('id');
		valueId = parseInt(valueId.replace("i", ""));

		if (valueId == questionNO) {
			value.remove();
		} else if (valueId > questionNO) {
			// value.children('i').attr('id','i'+(index-1));
			if (index < 10)
				value.children('a').text('0' + (index - 1));
			else
				value.children('a').text(index - 1);
		}
		// $(value).children('i').attr('id','i'+index);
		// .attr("id","newId");
	});
});
// 資料驗證

$(function() {

	form.validate({
		onkeyup : false,
		rules : {
			
			examno : {
				minlength : 2,
				"remote" : {
					url : 'ExamEdit',
					type : "post",
					data : {
						userExamno : function() {
							return $('#myForm :input[name="examno"]').val();
						}
					}
				}
			},

		},
		messages : {
			
			examno : {
				required : "Enter a examno",
				minlength : "Enter at least 2 characters",
				remote : jQuery.validator.format("{0} is already taken.")
			},
		},

		highlight: function(element, errorClass, validClass) {
		    $(element).addClass('invalid').removeClass(validClass);
		    
		  },
		  unhighlight: function(element, errorClass, validClass) {
		    $(element).removeClass('invalid').addClass(validClass);
		   
		  },
		errorElement : 'div',
		errorPlacement : function(error, element) {

			var placement = $(element).data('error');
			if (placement) {
				$(placement).append(error)
			} else {
				error.insertAfter(element);
			}
		}
	})
})
