<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<script src="/ExamScheduling/chat/js/mqttws31.js" type="text/javascript"></script>
<script src="/ExamScheduling/chat/js/jquery.qqFace.js" type="text/javascript"></script>
<link href="//cdn.bootcss.com/pnotify/2.0.0/pnotify.all.min.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="//cdn.bootcss.com/pnotify/2.0.0/pnotify.all.min.js"></script>
<!-- <script type="text/javascript"> -->
<!-- // 	PNotify.prototype.options.styling = "bootstrap3"; -->
<!-- </script> -->


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
	var clientid = "${GoogleUser}"
	var client = new Paho.MQTT.Client(wsbroker, wsport, clientid);
	client.onConnectionLost = function(responseObject) {
		console.log("connection lost: " + responseObject.errorMessage);
	};
	client.onMessageArrived = function(message) {
		var messageArray = message.payloadString.split(":");
		var checkId = "主考官  " + clientid + " ";
		if (messageArray[0] == checkId) {
			$("#show").append(
					"<h6 style='color:blue; text-align:right;'>"
							+ replace_em(messageArray[1]) + "</h6></br>");
		} else {
			$("#show").append(
					"<h6 style='text-align:left;'>"
							+ replace_em(message.payloadString) + "</h6></br>");
			var checkbox=$("#checkboxid");
			var chexval=checkbox.val();
			checkbox.change(function() {
				if(chexval=="1"){
					checkbox.val("0");
				}else{
					checkbox.val("1");
				}

			});
			if (chexval == "1") {
				new PNotify({
					title :"<h5>"+ messageArray[0] + ':</h5>',
					text : replace_em(messageArray[1])
				});
			}
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
	<div style="background: white;">
		<input type="hidden" id="messageName" value="主考官  ${GoogleUser}">
		</br>
		<div contenteditable="false" id="show" style="width: 450px;height:450px; overflow:scroll;border-style:outset;"></div>
		<!--  	<textarea id="messagesUser" readonly="readonly" rows="10" cols="15"></textarea>  -->
		</br> <input type="text" id="messageText" name="messageText" size="45">
		<p>
				<span class="emotion">表情</span>
				<button class="light-blue darken-2 waves-light btn" type="submit"
									onclick="sendMessage();">
									送出<i class="material-icons right">mode_edit</i>
								</button>

		</p>
	</div>
</body>

</html>