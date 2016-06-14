<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>班級表單上傳與下載</title>
<style>
@import url('<%=request.getContextPath()%>/upload/upload.css');
</style>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.6/css/materialize.min.css">

<!--materialize ICON-->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<!--sweatAlert-->
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/sweetalert2/3.2.3/sweetalert2.min.css" />
<!--JQUERY-->
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<!--materialize-->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.6/js/materialize.min.js"></script>

<!--sweetalert js  -->
<script
	src="https://cdn.jsdelivr.net/sweetalert2/3.2.3/sweetalert2.min.js"></script>

<!-- JQUERY表單驗證 -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.15.0/jquery.validate.min.js"></script>

<script type="text/javascript">
	var method = "none";
	var iiiClass = "EEIT85";
	var dl;	
	var detail; 

	$(document).ready(function() {
		dl = $('#download');
		dl.hide();
		dl.click(function() {

			dl.attr('href', 'poitest.jspx?_m=poi_down&iiiClass=' + iiiClass);
		});
	});
	
	$(document).ready(function(){
		detail = $('#classdetail');
		detail.hide();
	});
	
	function classlist(btn) {
		var myTbody = $("#classTbody");
		iiiClass = $(btn).prop('id');
		//console.log(iiiClass);
		dl.show();
		detail.show();

		$.ajax({
			url : 'poitest.jspx',
			data : {
				'iiiClass' : iiiClass
			},
			type : 'GET',

			success : function(response) {

				var myTr;
				var cntEcno = 0;
				$("#classTbody>tr").remove();
				$.each(response, function(i, value) {
					//tr

					if (i % 3 == 0)
						myTr = $("<tr></tr>");

					$.each(JSON.parse(value), function(key, objectvalue) {
						//td
						if (key == 'ecno') {

							if (cntEcno % 3 == 0) {
								var myTd = "<td>" + objectvalue + "</td>";

								myTr.append(myTd);

							}
							cntEcno++;
							return;
						}

						else {
							var myTd;
							if (key == 'ecpsd') {

								return;
							} else if (key == 'ecstatus') {
								if (objectvalue == 'true') {
									myTd = $("<td>是</td>");
								} else
									myTd = $("<td>否</td>");
							} else {
								myTd = "<td>" + objectvalue + "</td>";
							}

							myTr.append(myTd);

						}

						// 						if (key == 'essex') {
						// 							if (objectvalue == 'true') {
						// 								myTr = $("<tr>男</tr>");
						// 							} else
						// 								myTr = $("<tr>女</tr>");
						// 						}

					});
					if (i % 3 == 2)
						myTbody.append(myTr);

				});

			}
		});
	};
</script>
</head>
<body>
	<h3>班級表單上傳與下載</h3>
	<hr>
	<div class="container">
		<div class="divider"></div>
		<div class="section">
			<div>
				<h4>班級列表</h4>
				<p>點選班級以顯示詳細名單資訊</p>
				<div>
					<table class="classlist centered">
						<tr>
							<c:forEach var="showclasslist" items="${allClass}">
								<td class=classlisttd><a onclick="classlist(this)" id="${showclasslist}">${showclasslist}</a></td>
							</c:forEach>
						</tr>
					</table>
				</div>
				
				<div>
					<h4>上傳新班級名單</h4>
					<form action="poitest.jspx?_m=poi_upload" method="post"
						enctype="multipart/form-data">
						<input type="file" name="file"> <input type="submit"
							value="上傳" class="btn btn-info">
					</form>
					<hr>
				</div>
			</div>
		</div>
		<div class="divider"></div>
		<div class="section">
			<div id="classdetail">
				<h4>班級詳細資料</h4>
				<div class=downloadexcel>
				<a id="download" href="poitest.jspx?_m=poi_down">下载目前班級為Excel檔</a>
				</div>
				<div>
					<table class="responsive-table hovereffect">
						<thead>
							<tr>
								<th>NO</th>
								<th>姓名</th>
								<th>E-mail</th>
								<th>是否預約考試</th>
								<th>備註</th>
								<th>資策會班級</th>
								<th>組別</th>
								<th>年次</th>
								<th>畢業學校</th>
								<th>性別</th>
								<th>最快可以上班日期</th>
								<th>期望新資</th>
								<th>Final Ranking</th>
								<th>備註</th>
								<th>上機測驗分數</th>
								<th>Interview 分數</th>
								<th>上機測驗時間</th>
								<th>線上測驗分數</th>


							</tr>
						</thead>
						<tbody id="classTbody">


						</tbody>
					</table>
				</div>

			</div>
		</div>

	</div>
</body>

</html>
