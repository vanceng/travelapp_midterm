function displayMemoryMarker(memoryId) {
  $.ajax({
    url: "/api/memory/"+memoryId,
    success: function(response) {
      console.log(response);

      // Create the coordinate of the memory
      var coords = new google.maps.LatLng(response.latitude, response.longitude);

      // Create and display the map
      var mapProp = {
        center: coords,
        zoom: 15,
        mapTypeId:google.maps.MapTypeId.ROADMAP
      };
      var map = new google.maps.Map(document.getElementById("googleMap"),mapProp);

      // Display the markers on the map
      var marker = new google.maps.Marker({
        position: coords,
      });
      marker.setMap(map);

    }
  });
}

// google.maps.event.addDomListener(window, 'load', initialize);

$(document).ready(function() {

  var memoryIds = $(".memories").data("memory-ids");
  // create the map

  $.each(memoryIds, function(memoryId){
    displayMemoryMarker(memoryId);
  });
  
  // displayUserMemories();


  // var map;
  // var styles = [{"featureType":"landscape","stylers":[{"saturation":-100},{"lightness":65},{"visibility":"on"}]},{"featureType":"poi","stylers":[{"saturation":-100},{"lightness":51},{"visibility":"simplified"}]},{"featureType":"road.highway","stylers":[{"saturation":-100},{"visibility":"simplified"}]},{"featureType":"road.arterial","stylers":[{"saturation":-100},{"lightness":30},{"visibility":"on"}]},{"featureType":"road.local","stylers":[{"saturation":-100},{"lightness":40},{"visibility":"on"}]},{"featureType":"transit","stylers":[{"saturation":-100},{"visibility":"simplified"}]},{"featureType":"administrative.province","stylers":[{"visibility":"off"}]},{"featureType":"water","elementType":"labels","stylers":[{"visibility":"on"},{"lightness":-25},{"saturation":-100}]},{"featureType":"water","elementType":"geometry","stylers":[{"hue":"#ffff00"},{"lightness":-25},{"saturation":-97}]}]

  // var styledMap = new google.maps.StyledMapType(styles,
  //   {name: "Styled Map"});

  // function drawCenteredMap(dataFromServer) {
  //   console.log("datafromserver", dataFromServer)
  //   name = dataFromServer.name
  //   address = dataFromServer.vicinity
  //   lat = dataFromServer.lat
  //   lng = dataFromServer.lng

  //   $( "#restaurant_name" ).replaceWith( '<h1 id="restaurant_name">' + name + "</h1>" );
  //   $( "#restaurant_address" ).replaceWith( '<h1 id="restaurant_address">' + address + "</h1>" );

  // // map stuff starts
  //   console.log("LatLng", lat, lng);
  //   var centerPoint = new google.maps.LatLng(lat, lng);
  //   var mapOptions = {
  //     zoom: 15,
  //     center: centerPoint,
  //     mapTypeControlOptions: {
  //       mapTypeIds: [google.maps.MapTypeId.ROADMAP, 'map_style']
  //   }
  //   };

  //   map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
      
  //   var marker = new google.maps.Marker({
  //   position: centerPoint,
  //   map: map,
  //   url: "https://www.google.ca/maps/search/" + name,
  //   animation: google.maps.Animation.DROP
  //   });

  //   map.mapTypes.set('map_style', styledMap);
  //   map.setMapTypeId('map_style');

  //   google.maps.event.addListener(marker, 'click', function() { 
  //   window.open(marker.url, '_blank');
  //   });
    
  // }//end of drawCenteredMap
  // // test for map ------------------------------

  // function renderMap(postParams) {
  //   $.ajax({
  //     url: '/map',
  //     method: 'POST',
  //     data: postParams,
  //     dataType: 'json'
  //   })
  //   .done(drawCenteredMap);
  // }

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
});
