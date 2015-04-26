$(document).ready(function() {

  function displayMemoryMarker(memoryId) {
    $.ajax({
      url: "/api/memory/"+memoryId,
      success: function(response) {
        console.log(response);

        // Create the coordinate of the memory
        var coords = new google.maps.LatLng(response.latitude, response.longitude);
       
        // Create and display the map

        // Display the markers on the map
        
        var image = new google.maps.MarkerImage(
            '../img/templogo.png', //url
            new google.maps.Size(width, height), //size
            new google.maps.Point(0,0), //origin
            new google.maps.Point(anchor_left, anchor_top) //anchor 
    );


        var marker = new google.maps.Marker({
          position: coords,
          // animation:google.maps.Animation.BOUNCE,
          icon: image
        });
        marker.setMap(map);

      }
    });
  }

  var memoryIds = $(".memories").data("memory-ids");
  // create the map

  var mapProp = {
    center: new google.maps.LatLng(49.282022399999995, -123.108199),
    zoom: 10,
    mapTypeId:google.maps.MapTypeId.ROADMAP
  };
  var map = new google.maps.Map(document.getElementById("googleMap"),mapProp);

  $.each(memoryIds, function(index, memoryId){
    displayMemoryMarker(memoryId);
  });

});
