<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

  <header>

      <nav class="top-nav" >
        <div class="container" style="height:5%">
          <div class="nav-wrapper"><a class="page-title"></a></div>
        </div>
      </nav>
      <div class="container"><a href="#" data-activates="nav-mobile" class="button-collapse top-nav full hide-on-large-only"><i class="material-icons">menu</i></a></div>
      <ul id="nav-mobile" class="side-nav fixed">
                          
         <li class="user-details cyan darken-2">
            <div class="row">
                
                <div class="col col s12">
                    <ul id="profile-dropdown" class="dropdown-content">
                    
                        <li><a href="/gmail_login/loginout.do"><i class="mdi-hardware-keyboard-tab"></i> Logout</a>
                        </li>
                    </ul>
                    <a class="btn-flat dropdown-button waves-effect waves-light white-text profile-btn" href="#" data-activates="profile-dropdown">${sessionScope.GoogleUser }<i class="mdi-navigation-arrow-drop-down right"></i></a>
                    <p class="user-roal">系統管理員</p>
                </div>
            </div>
            </li>           
           <li class="bold"><a class="collapsible-header active waves-effect waves-teal">編輯前台</a>
              <div class="collapsible-body">
                <ul>
                  <li><a href="aboutedit">關於緯康</a></li>
                  <li><a href="#">輪播圖</a></li>
                 
                </ul>
              </div>
            </li>
        <li class="bold"><a href="#" class="waves-effect waves-teal">主考官管理</a></li>
        <li class="bold"><a href="upload/poitest.jspx" class="waves-effect waves-teal">考生管理</a></li>
        <li class="bold"><a class="collapsible-header active waves-effect waves-teal">設定</a>
              <div class="collapsible-body">
                <ul>
                  <li><a href="collapsible.html">關於緯康</a></li>
                  <li><a href="dialogs.html">輪播圖</a></li>
                 
                </ul>
              </div>
            </li>
        
        
      </ul>
    </header>
        