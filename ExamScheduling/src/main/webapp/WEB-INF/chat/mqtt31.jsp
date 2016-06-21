<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<%@ include file="/WEB-INF/cdn.file"%>
<title>即時通訊</title>
<%@ include file="/WEB-INF/header/header_resourse.file" %>
<script src="/ExamScheduling/chat/js/mqttws31.js" type="text/javascript"></script>
<script src="/ExamScheduling/chat/js/jquery.qqFace.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css"
	href="/ExamScheduling/css/preload.css" />
<script type="text/javascript">
	$(function() {
		$('.emotion').qqFace({
			id : 'facebox', //表情盒子的ID
			assign : 'messageText', //给那个控件赋值
			path : '/ExamScheduling/chat/tiger/' //表情存放的路径
		});

		$("[data-toggle='tooltip']").tooltip();
		
	});

	//查看结果
	function replace_em(str) {
		str = str.replace(/\</g, '&lt;');
		str = str.replace(/\>/g, '&gt;');
		str = str.replace(/\n/g, '<br/>');
		str = str.replace(/\[em_([0-9]*)\]/g,
				'<img src="/ExamScheduling/chat/tiger/$1.gif" border="0" />');
		return str;
	}
	var wsbroker = "test.mosquitto.org"; //mqtt websocket enabled broker
	var wsport = 8080 // port for above
// 	var clientid = "myclientid_" + parseInt(Math.random() * 100, 10);
	var clientid ="${ecno}";
	var client = new Paho.MQTT.Client(wsbroker, wsport, clientid);
	client.onConnectionLost = function(responseObject) {
		console.log("connection lost: " + responseObject.errorMessage);
	};
	client.onMessageArrived = function(message) {
		var messageArray= message.payloadString.split(":");
		var checkId="考生  "+clientid+" ";
		if(messageArray[0]==checkId){		
			$("#show").append("<h6 style='color:blue; text-align:right;'>"+replace_em(messageArray[1]) + "</h6></br>");

		}else{
			$("#show").append(replace_em(message.payloadString) + "</br>");
		}
		var div = document.getElementById("show");
		div.scrollTop = div.scrollHeight;
	};

	var options = {
		//       timeout: 3,
		onSuccess : function() {
			console.log("mqtt connected");
			// Connection succeeded; subscribe to our topic, you can add multile lines of these
			client.subscribe('/ESS', {
				qos : 1
			});
		},
		onFailure : function(message) {
			console.log("Connection failed: " + message.errorMessage);
		}

	};
	function init() {
		client.connect(options);
	}
	function sendMessage() {
		var value = document.getElementById("messageText").value;
		var name = document.getElementById("messageName").value;
	if(value!=""){
		message = new Paho.MQTT.Message(name + " : " + value);
		message.destinationName = "/ESS";
// 		message.retained = true;
		client.send(message);
		messageText.value = "";
	}
	}
</script>
<style>
span.emotion {
	width: 42px;
	height: 20px;
	background: url(/ExamScheduling/chat/icon.gif) no-repeat 2px 2px;
	padding-left: 20px;
	cursor: pointer
}

span.emotion:hover {
	background-position: 2px -28px
}

.qqFace {
	margin-top: 4px;
	background: #fff;
	padding: 2px;
	border: 1px #dfe6f6 solid;
}

.qqFace table td {
	padding: 0px;
}

.qqFace table td img {
	cursor: pointer;
	border: 1px #fff solid;
}

.qqFace table td img:hover {
	border: 1px #0066cc solid;
}

#show {
	width: 400px;
}
</style>
</head>
<body onload="init();">
<%@ include file="/WEB-INF/header/header.jsp" %>
<!-- loading圖 -->
	<div id="loader-wrapper">
		<div id="loader"></div>
		<div class="loader-section section-left"></div>
        <div class="loader-section section-right"></div>
	</div>
<%-- 	<%@ include file="/WEB-INF/header/header.jsp" %> --%>
	<div  style="width:700px;height:500px;margin: 0px auto;">
		<div style="background: white">
			<input type="hidden" id="messageName" size="50" value="考生  ${ecno}">
			</br>
			<div contenteditable="false" id="show" style="width:700px;height:300px; overflow:scroll;border-style:inset;" ></div>
			</br> <input type="text" id="messageText" name="messageText" >
			<p style="float: left">
				<span class="emotion">表情</span>
<!-- 				<a class="blue darken-1 waves-light btn" onclick="sendMessage();"><i class="large material-icons">mode_edit</i></a> -->
					<button class="light-blue darken-2 waves-light btn" type="submit" onclick="sendMessage();">
					送出<i class="material-icons right">mode_edit</i></button>
			</p>
		</div>
	</div>
 <div class="fixed-action-btn horizontal" style="bottom: 45px; right: 24px;">
    <a class="btn-floating btn-large red">
     <i class="large material-icons">contact_phone</i>
    </a>
    <ul>
      <li><a href='<%=request.getContextPath()%>/MesTurn?turn=LAM' class="btn-floating green tooltipped" data-position="top" data-delay="50" data-tooltip="留言板" ><i class="material-icons">comment</i></a></li>
      <li><a href='<%=request.getContextPath()%>/MesTurn?turn=LM' class="btn-floating blue darken-1 tooltipped" data-position="top" data-delay="50" data-tooltip="留言" ><i class="material-icons">library_add</i></a></li>
    </ul>
  </div>
  <%@ include file="/WEB-INF/header/footer.jsp" %>
</body>
<script type="text/javascript">
$(document).ready(function(){
    $('.tooltipped').tooltip({delay: 50});
    $('body').addClass('loaded');
  });
</script>
</html>
