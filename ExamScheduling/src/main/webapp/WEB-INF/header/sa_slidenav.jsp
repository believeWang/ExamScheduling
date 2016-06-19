<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
$(function() {
	   $('.collapsible').collapsible({
		      accordion : false // A setting that changes the collapsible behavior to expandable instead of the default accordion style
		    });
		    $(".button-collapse").sideNav();
		});
</script>
  <header>


      <nav class="top-nav blue-grey lighten-3" >
        <div class="container" style="height:5%">
          <div class="nav-wrapper"><a class="page-title"></a></div>
        </div>
      </nav>
      <div class="container"><a href="#" data-activates="nav-mobile" class="button-collapse top-nav full hide-on-large-only"><i class="material-icons">menu</i></a></div>
      <ul id="nav-mobile" class="side-nav fixed">
                          
         <li class="user-details cyan darken-2">
            <div class="row cyan darken-1">
                
                <div class="col col s12">
                    <ul id="profile-dropdown" class="dropdown-content">
                    
                        <li><a href="/ExamScheduling/gmail_login/loginout.do"><i class="mdi-hardware-keyboard-tab"></i> Logout</a>
                        </li>
                    </ul>
                    <a class="btn-flat dropdown-button waves-effect waves-light white-text profile-btn" href="#" data-activates="profile-dropdown">${sessionScope.GoogleUser }<i class="mdi-navigation-arrow-drop-down right"></i></a>
                    <p class="user-roal">系統管理員</p>
                </div>
            </div>
            </li>           
           <ul class="collapsible" data-collapsible="accordion">
           <li class="bold"><a class="collapsible-header active waves-effect waves-teal">編輯前台</a>
              <div class="collapsible-body">
                <ul>
                  <li><a href="/ExamScheduling/aboutedit">關於緯康</a></li>
                  <li><a href="/ExamScheduling/setting/editmail">E-mail內容</a></li>
                  <li><a href="/ExamScheduling/bannerservlet">輪播圖</a></li>    
                </ul>
              </div>
            </li>
            </ul>
        <li class="bold"><a href="EmpCaes?empturn=EMP" class="waves-effect waves-teal">主考官管理</a></li>
        <li class="bold"><a href="/ExamScheduling/upload/poitest.jspx" class="waves-effect waves-teal">考生管理</a></li>
      <ul class="collapsible" data-collapsible="accordion">
        <li class="bold"><a class="collapsible-header active waves-effect waves-teal">設定</a>
              <div class="collapsible-body">
                <ul>
                  <li><a href="/ExamScheduling/job/JobServlet">職缺管理</a></li>
                  <li><a href="/ExamScheduling/section/SectionServlet">時段管理</a></li>
                 
                </ul>
              </div>
            </li>
        </ul>
        
      </ul>
    </header>
        
