<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<header>
	 <nav class="top-nav  blue-grey lighten-3" style="height:122px;box-shadow: none;">
        <div class="container">
          <div class="nav-wrapper"><h1>主考官</h1></div>
        </div>
      </nav>

	
	<div class="container">
		<a href="#" data-activates="nav-mobile"
			class="button-collapse top-nav full hide-on-large-only"><i
			class="material-icons">menu</i></a>
	</div>
	<ul id="nav-mobile" class="side-nav fixed" >
	 <li class="logo" style="background-color:#0097a7">
            <img style="width:240px" id="front-page-logo"  src="/ExamScheduling/images/iiIVlight.png"/>
            </li>
		<li class="user-details blue-grey lighten-3">
			<div class="row cyan darken-1">

				<div class="col col s12">
					<ul id="profile-dropdown" class="dropdown-content">

						<li><a href="/ExamScheduling/gmail_login/loginout.do"><i
								class="mdi-hardware-keyboard-tab"></i> Logout</a></li>
					</ul>
					<a
						class="btn-flat dropdown-button waves-effect waves-light white-text profile-btn"
						href="#" data-activates="profile-dropdown" style="font-size:1.6em;">${sessionScope.GoogleUser }<i
						class="mdi-navigation-arrow-drop-down right"></i></a>
				
				</div>
			</div>
		</li>

		<li class="bold" ><a href="/ExamScheduling/EmpCaes?empturn=CAL"
			class="waves-effect waves-teal" style="font-size:1.4em;">行事曆</a></li>
		<li class="bold"><a href="/ExamScheduling/ExamList"
			class="waves-effect waves-teal" style="font-size:1.4em;">編輯考題</a></li>
		<li class="bold"><a href="/ExamScheduling/MesTurn?turn=LNRM"
			class="waves-effect waves-teal" style="font-size:1.4em;">留言版</a></li>


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
