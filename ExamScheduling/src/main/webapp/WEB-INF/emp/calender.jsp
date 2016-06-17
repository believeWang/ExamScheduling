<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="iii.team05.examinee.ecmodel.*"%>
<%

	ECHibernateDAO empSvc = new ECHibernateDAO();
	List<ECVO> list = empSvc.getAll();
	pageContext.setAttribute("list", list);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/WEB-INF/cdn.file"%>
<%@ include file="/WEB-INF/header/slide_mqtt.file" %>
<%@ include file="/WEB-INF/calendar.file"%>
<link rel="stylesheet" type="text/css"
	href="/ExamScheduling/css/preload.css" />
<title></title>

<style type="text/css">
#calendar {
	width: 960px;
	margin: 20px auto 10px auto
}

</style>
<script>
	$(document).ready(
			function() {
				$('body').addClass('loaded');
				$('#calendar').fullCalendar({
											header : {
												left : 'title today',
												center : 'month,basicWeek,basicDay,agendaWeek,agendaDay',
												right : 'prevYear prev next nextYear'
											},
											editable : true,
											events : '/ExamScheduling/employee/EmployeeJSONServlet',// 一開始頁面
											dayClick : function(date, allDay,jsEvnt, view) {
												var selDate = moment(date).format('YYYY-MM-DD');
											},
											eventClick : function(calEvent, jsEvent, view) {
												$.fancybox({
															'type' : 'ajax',
															'href' : '/ExamScheduling/employee/Score?action=get_Event&id='+ calEvent.id
														});
											}
										})
					});
</script>
<script type="text/javascript">
      // Your Client ID can be retrieved from your project in the Google
      // Developer Console, https://console.developers.google.com
      var CLIENT_ID = '365641492634-v85opm5qdpu84ql7gvaluok0ik48i82s.apps.googleusercontent.com';
      var SCOPES = ["https://www.googleapis.com/auth/calendar.readonly"];
      var gooEvent=[];
      /**
       * Check if current user has authorized this application.
       */
      function checkAuth() {
        gapi.auth.authorize(
          {
            'client_id': CLIENT_ID,
            'scope': SCOPES.join(' '),
            'immediate': true
          }, handleAuthResult);
      }
      /**
       * Handle response from authorization server.
       *
       * @param {Object} authResult Authorization result.
       */
      function handleAuthResult(authResult) {
        var authorizeDiv = document.getElementById('authorize-div');
        if (authResult && !authResult.error) {
          // Hide auth UI, then load client library.
          authorizeDiv.style.display = 'none';
          loadCalendarApi();
        } else {
          // Show auth UI, allowing the user to initiate authorization by
          // clicking authorize button.
          authorizeDiv.style.display = 'inline';
        }
      }
      /**
       * Initiate auth flow in response to user clicking authorize button.
       *
       * @param {Event} event Button click event.
       */
      function handleAuthClick(event) {
        gapi.auth.authorize(
          {client_id: CLIENT_ID, scope: SCOPES, immediate: false},
          handleAuthResult);
        return false;
      }
      /**
       * Load Google Calendar client library. List upcoming events
       * once client library is loaded.
       */
      function loadCalendarApi() {
        gapi.client.load('calendar', 'v3', listUpcomingEvents);
      }
      /**
       * Print the summary and start datetime/date of the next ten events in
       * the authorized user's calendar. If no events are found an
       * appropriate message is printed.
       */
      function listUpcomingEvents() {
        var request = gapi.client.calendar.events.list({
          'calendarId': 'primary',
          'timeMin': (new Date()).toISOString(),
          'showDeleted': false,
          'singleEvents': true,
          'maxResults': 10,
          'orderBy': 'startTime'
        });
        request.execute(function(resp) {
          var events = resp.items;
          //appendPre('Upcoming events:');
          if (events.length > 0) {
            for (i = 0; i < events.length; i++) {
              var event = events[i];
              var when = event.start.dateTime;
              if (!when) {
                when = event.start.date;
              }
            //  appendPre(event.summary + ' (' + when + ')')
              gooEvent.push({
                  id: event.id,
                  title: event.summary,
                  start: event.start.dateTime ,
                  end: event.end.dateTime ,
                  location: event.location,
                  description: event.description
              });
            }
            alert(gooEvent);
            $('#calendar').fullCalendar( 'addEventSource', gooEvent );
          } else {
           // appendPre('No upcoming events found.');
          }
        });
       
      }
      /**
       * Append a pre element to the body containing the given message
       * as its text node.
       *
       * @param {string} message Text to be placed in pre element.
       */
       $(document).ready(function() {
    	   $('#calendar').fullCalendar({
   			defaultDate: '2016-07-017',
   			editable: true,
   			eventLimit: true, // allow "more" link when too many events
    	   });
    	
       });
</script>
<style>
body {
	/* 		margin: 40px 10px; */
	padding: 0;
	font-family: "Lucida Grande", Helvetica, Arial, Verdana, sans-serif;
	font-size: 14px;
}

#calendar {
	padding: 10px;
	max-width: 900px;
	margin: 0 auto;
}

.list-group {
	padding: 10px;
}
</style>
</head>
<body>
<%@ include file="/WEB-INF/header/slidenav.jsp" %>
	<!-- loading圖 -->
	<div id="loader-wrapper">
		<div id="loader"></div>
		<div class="loader-section section-left"></div>
        <div class="loader-section section-right"></div>
	</div>

			<div class="container-fluid">
		<div class="row">

			<div class="col-md-2">
				<ul class="list-group">
					
				</ul>
			</div>
			<div class="col-md-10">
				<table class="table table-bordered">
					<tr>
						<td>
							<div id='calendar'></div>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
		


</body>
</html>
