<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>GoogleMap</title>
<head>
       <style>
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
      #map {
        height: 100%;
      }
/* #floating-panel { */
/*   position: absolute; */
/*   top: 10px; */
/*   left: 25%; */
/*   z-index: 5; */
/*   background-color: #fff; */
/*   padding: 5px; */
/*   border: 1px solid #999; */
/*   text-align: center; */
/*   font-family: 'Roboto','sans-serif'; */
/*   line-height: 30px; */
/*   padding-left: 10px; */
/* } */

#right-panel {
  font-family: 'Roboto','sans-serif';
  line-height: 30px;
  padding-left: 10px;
}

#right-panel select, #right-panel input {
  font-size: 15px;
}

#right-panel select {
  width: 100%;
}

#right-panel i {
  font-size: 12px;
}
#floating-panel {
  position: absolute;
  top: 10px;
  left: 25%;
  z-index: 5;
  background-color: #fff;
  padding: 5px;
  border: 1px solid #999;
  text-align: center;
  font-family: 'Roboto','sans-serif';
  line-height: 30px;
  padding-left: 10px;
}

      #right-panel {
        height: 100%;
        float: right;
        width: 390px;
        overflow: auto;
      }

      #map {
        margin-right: 400px;
      }

/*        #floating-panel {  */
/*          background: #fff; */
/*          padding: 5px;  */
/*          font-size: 14px; */
/*          font-family: Arial; */
/*          border: 1px solid #ccc; */
/*          box-shadow: 0 2px 2px rgba(33, 33, 33, 0.4); */
/*          display: none; */
/*      }  */

      @media print {
        #map {
          height: 500px;
          margin: 0;
        }

        #right-panel {
          float: none;
          width: auto;
        }
      }
    </style>
    <script type="text/javascript"
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBcxcHllcnjvqlP8OnUGKxTPIYkKdWAIec">
    </script>
    <script type="text/javascript">
	  var directionsDisplay = new google.maps.DirectionsRenderer;
	  var directionsService = new google.maps.DirectionsService;
	  var lat;
	  var lng;
	  if(window.navigator.geolocation){   
	      var geolocation=window.navigator.geolocation;   
	      geolocation.getCurrentPosition(getPositionSuccess);   
	  }else{   
	      alert("你的瀏覽器不支援地理定位");   
	  }   
	 
	  function getPositionSuccess(position){   

	    	  lat=position.coords.latitude;
	    	  lng=position.coords.longitude; 
	      //定位到目前位置   
	  }
	  function initialize() { 

		  var mapOptions = {
           center: { lat: 25.0463042, lng: 121.53318869999998},
          zoom: 15
        };
        var map = new google.maps.Map(document.getElementById('map'),mapOptions);
//         var marker = new google.maps.Marker({
//     	    position: { lat: lat, lng: lng},
//     	    map: map,
//     	    title: '偉康科技'
//     	  });
        directionsDisplay.setMap(map);
        directionsDisplay.setPanel(document.getElementById('right-panel'));

        calculateAndDisplayRoute(directionsService, directionsDisplay);
        document.getElementById('mode').addEventListener('change', function() {
        	calculateAndDisplayRoute(directionsService, directionsDisplay)
        });
      }
        
        function calculateAndDisplayRoute(directionsService, directionsDisplay) {
        	 var selectedMode = document.getElementById('mode').value;
        	  directionsService.route({
        		  origin: {lat: lat, lng: lng},  // Haight. 
        		    destination: {lat: 25.0463042, lng: 121.53318869999998},  // Ocean Beach.
        	    // Note that Javascript allows us to access the constant
        	    // using square brackets and a string value as its
        	    // "property."
        	    travelMode: google.maps.TravelMode[selectedMode]
        	  }, function(response, status) {
        	    if (status == google.maps.DirectionsStatus.OK) {
        	      directionsDisplay.setDirections(response);
        	    } else {
        	      console.log('Directions request failed due to ' + status);
        	    }
        	  });
        }
        function calculateAndDisplayRoute(directionsService, directionsDisplay) {
        	 var selectedMode = document.getElementById('mode').value;
        	var request = {
        			origin: {lat: lat, lng: lng},  // Haight. 
          		    destination: {lat: 25.0463042, lng: 121.53318869999998},  // Ocean Beach.
        	    travelMode: google.maps.TravelMode[selectedMode]
        	  };
        	  directionsService.route(request, function(response, status) {
        	    if (status == google.maps.DirectionsStatus.OK) {
        	      directionsDisplay.setDirections(response);
        	    }
        	  });
        }
        

      google.maps.event.addDomListener(
          window, 'load', initialize);
    </script>
  </head>
  <body>
 <div id="floating-panel">
    <b>移動方式: </b>
    <select id="mode">
      <option value="DRIVING">開車</option>
      <option value="WALKING">走路</option>
      <option value="TRANSIT">大眾運輸</option>
    </select>
    </div>
<div id="right-panel"></div>
<div id="map"></div>

  </body>
</html>