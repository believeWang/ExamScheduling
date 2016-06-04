<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script src="/ExamScheduling/chat/js/mqttws31.js" type="text/javascript"></script>
<script src="/ExamScheduling/chat/js/jquery.qqFace.js" type="text/javascript"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.6/css/materialize.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.6/js/materialize.min.js"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<script type="text/javascript">
	$(function() {
		$('.emotion').qqFace({
			id : 'facebox', //表情盒子的ID
			assign : 'messageText', //给那个控件赋值
			path : '/ExamScheduling/chat/tiger/' //表情存放的路径
		});


		
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
			$("#show").append("<h4 style='color:blue; text-align:right;'>"+replace_em(messageArray[1]) + "</br>");
		}else{
			$("#show").append(replace_em(message.payloadString) + "</br>");
		}
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
	<div style="margin: 50px 500px">
		<div style="background: white">
			<input type="hidden" id="messageName" size="50" value="考生  ${ecno}">
			</br>
			<div contenteditable="false" id="show" style="width:700px;height:300px; overflow:scroll"></div>
			</br> <input type="text" id="messageText" name="messageText" >
			<p>
				<span class="emotion">表情</span>
				<a class="waves-effect waves-light btn" onclick="sendMessage();"><i class="large material-icons">mode_edit</i></a>
			</p>
		</div>
	</div>
</body>

</html>