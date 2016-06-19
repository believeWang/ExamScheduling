<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<header>


	<nav class="top-nav  blue-grey lighten-3">
		<div class="container" style="height: 5%">
			<div class="nav-wrapper">
				<a class="page-title"></a>
			</div>
		</div>
	</nav>
	<div class="container">
		<a href="#" data-activates="nav-mobile"
			class="button-collapse top-nav full hide-on-large-only"><i
			class="material-icons">menu</i></a>
	</div>
	<ul id="nav-mobile" class="side-nav fixed">

		<li class="user-details blue-grey lighten-3">
			<div class="row cyan darken-1">

				<div class="col col s12">
					<ul id="profile-dropdown" class="dropdown-content">

						<li><a href="gmail_login/loginout.do"><i
								class="mdi-hardware-keyboard-tab"></i> Logout</a></li>
					</ul>
					<a
						class="btn-flat dropdown-button waves-effect waves-light white-text profile-btn"
						href="#" data-activates="profile-dropdown">${sessionScope.GoogleUser }<i
						class="mdi-navigation-arrow-drop-down right"></i></a>
					<p class="user-roal">主考官</p>
				</div>
			</div>
		</li>
<!-- 		<li class="bold"><a href="EmpCaes?empturn=EVENT" -->
<!-- 			class="waves-effect waves-teal">預約管理</a></li> -->
		<li class="bold"><a href="EmpCaes?empturn=CAL"
			class="waves-effect waves-teal">行事曆</a></li>
		<li class="bold"><a href="ExamList"
			class="waves-effect waves-teal">編輯考題</a></li>
		<li class="bold"><a href="MesTurn?turn=LNRM"
			class="waves-effect waves-teal">留言版</a></li>


	</ul>
</header>

<!-- 以下MQTT -->

<div class="toggler" id="mqtt">
	<!--   <button id="button" class="ui-state-default ui-corner-all">即時通訊 </button> -->
	<h3 id="button" class="card-panel hoverable">
		<!-- 		<i class=" large material-icons">textsms</i> -->
		<img src="/ExamScheduling/images/button.jpg">
	</h3>

	<div id="effect" class="ui-widget-content ui-corner-all">
		<div class="switch">
			<label> Off <input type="checkbox" id="checkboxid" value="0">
				<span class="lever"></span> On
			</label>
		</div>
		<span>提醒通知<span>
				<div style="background: white;">
					<input type="hidden" id="messageName" value="主考官  ${GoogleUser}">
					</br>
					<div contenteditable="false" id="show"
						style="width: 450px; height: 450px; overflow: scroll; border-style: outset;"></div>
					</br> <input type="text" id="messageText" name="messageText" size="45">
					<p>
						<span class="emotion">表情</span>
						<button class="light-blue darken-2 waves-light btn" type="submit"
							onclick="sendMessage();">
							送出<i class="material-icons right">mode_edit</i>
						</button>

					</p>
				</div>
	</div>
</div>
<!-- MQTT結尾 -->
