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
<script src="https://code.jquery.com/jquery.min.js"></script>
<link
	href="https://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css"
	rel="stylesheet" type="text/css" />
<script
	src="https://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
	rel="stylesheet" type="text/css" />
<title>班級表單上傳與下載</title>
<style type="text/css">
html {
	padding-left: 10%;
	padding-right: 10%;
}
</style>
<script type="text/javascript">
	var method = "none";
	var iiiClass = "EEIT85";
	var dl;
	
	$(document).ready(function(){
		dl= $('#download');
		dl.hide();
		dl.click(function(){
			
			dl.attr(
					'href',
					'poitest.jspx?_m=poi_down&iiiClass='
							+ iiiClass);
		});
		});
	function classlist(btn) {
		var myTbody = $("#classTbody");
		iiiClass = $(btn).prop('id');
		//console.log(iiiClass);
		dl.show();
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
							}else if (key=='ecstatus'){
								if (objectvalue == 'true') {
									myTd = $("<td>是</td>");
								} else
									myTd = $("<td>否</td>");
							}else{
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
	<h2>班級表單上傳與下載</h2>
	<hr>
	<div class="row">
		<div class="col-md-2">
			<div>
				<h3>班級列表</h3>
				<table>
					<c:forEach var="showclasslist" items="${allClass}"
						varStatus="loopCounter">
						<tr>

							<td><a onclick="classlist(this)" id="${showclasslist}">${showclasslist}</a></td>

						</tr>
					</c:forEach>
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
		<div class="col-md-10">
			<div>
				<h3 align="center">班級詳細資料</h3>
				<div>
					<table>
						<thead>
							<tr>
								<td>NO</td>
								<td>姓名</td>
								<td>E-mail</td>
								<td>是否預約考試</td>
								<td>備註</td>
								<td>資策會班級</td>
								<td>組別</td>
								<td>年次</td>
								<td>畢業學校</td>
								<td>性別</td>
								<td>最快可以上班日期</td>
								<td>期望新資</td>
								<td>Final Ranking</td>
								<td>備註</td>
								<td>上機測驗分數</td>
								<td>Interview 分數</td>
								<td>上機測驗時間</td>
								<td>線上測驗分數</td>


							</tr>
						</thead>
						<tbody id="classTbody">


						</tbody>
					</table>
				</div>
				<a id="download"  href="poitest.jspx?_m=poi_down">下载目前班級為Excel檔</a>
			</div>
		</div>
	</div>

</body>

</html>