
function allowDrop(ev)
{
	ev.preventDefault();
}

function dragg(ev)
{
	ev.dataTransfer.setData("Text",ev.target.id);
}

function drop(ev)
{
	ev.preventDefault();
	var data=ev.dataTransfer.getData("Text");
	ev.target.appendChild(document.getElementById(data));
}


function TestGeo()
    {
         if (navigator.geolocation) 
            {
              navigator.geolocation.getCurrentPosition( TestMap, error, {maximumAge: 30000, timeout: 10000, enableHighAccuracy: true} );
        }
        else
        {
              alert("Sorry, but it looks like your browser does not support geolocation.");
        }
    }
//Create a new map variable 
var map;
     function TestMap(position)
     {
           // Define the coordinates as a Google Maps LatLng Object
           var coords = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);

           // Prepare the map options
           var mapOptions =
          {
                      zoom: 10,
                      center: coords,
                      mapTypeControl: false,
                      navigationControlOptions: {style: google.maps.NavigationControlStyle.SMALL},
                      mapTypeId: google.maps.MapTypeId.ROADMAP
            };

            // Create the map, and place it in the map_canvas div
            map = new google.maps.Map(document.getElementById("map_canvas"), mapOptions);

            // Place the initial marker
            var marker = new google.maps.Marker({
                      position: coords,
                      map: map,
                      title: "Your current location!"
            });
        }
  
function error() {
    alert("Cannot locate user");
    } 

