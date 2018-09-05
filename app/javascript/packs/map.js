import GMaps from 'gmaps/gmaps.js';
import slick from 'slick-carousel'


const mapElement = document.getElementById('map');

// function initMap() {
//   mapElement {
//     zoom: 4,
//     center: {lat: -33, lng: 151},
//     disableDefaultUI: true
//   });
// }



  // function initMap() {
  //   const mapElement = (document.getElementById('map'), {


  //   disableDefaultUI: true
  // });
// }


const markerIconUrl = document.getElementById('map-urls').dataset.markerIconUrl;
const userIconUrl = document.getElementById('map-urls').dataset.userIconUrl;

if (mapElement) { // don't try to build a map if there's no div#map to inject in
  const map = new GMaps({ el: '#map', lat: 0, lng: 0, disableDefaultUI: true });
  const markers = JSON.parse(mapElement.dataset.markers);
  map.addMarkers(markers);

  let pos;
  navigator.geolocation.getCurrentPosition(function(position) {
    pos = {
      lat: position.coords.latitude,
      lng: position.coords.longitude
    }
    map.addMarkers([{lat: pos.lat, lng: pos.lng, icon: {url: userIconUrl }}])
  })
  // define initial zoom
  if (markers.length === 0) {
    map.setZoom(2);
  } else {
    map.setCenter(markers[0].lat, markers[0].lng);
    map.setZoom(14);

  }

  const toggleBounce = (marker, index) => {
    map.removeMarkers()
    const markers = JSON.parse(mapElement.dataset.markers).slice(index, 0)
    map.addMarkers(markers)
    map.addMarkers([
      {
        animation: google.maps.Animation.BOUNCE,
        lat: marker.lat,
        lng: marker.lng,
        icon: { url: markerIconUrl }
      }
    ])

  }

    const changeMapZoom = (map, currentSlide) => {
    map.setCenter(markers[currentSlide].lat, markers[currentSlide].lng)
    map.setZoom(14)
    toggleBounce(markers[currentSlide])
  }



  document.addEventListener('DOMContentLoaded', () => {
    $('.carousel').slick({
      centerMode: true,
      centerPadding: '35px',
      arrows: false,
      mobileFirst: true
    })
  })

  $('.carousel').on('afterChange', (event, slick, currentSlide) => {
    changeMapZoom(map, currentSlide)
  })




  const styles = [
    {
        "featureType": "administrative",
        "elementType": "labels.text.fill",
        "stylers": [
            {
                "color": "#444444"
            }
        ]
    },
    {
        "featureType": "landscape",
        "elementType": "all",
        "stylers": [
            {
                "color": "#f2f2f2"
            }
        ]
    },
    {
        "featureType": "poi",
        "elementType": "all",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "road",
        "elementType": "all",
        "stylers": [
            {
                "saturation": -100
            },
            {
                "lightness": 45
            }
        ]
    },
    {
        "featureType": "road",
        "elementType": "labels.text",
        "stylers": [
            {
                "hue": "#ff0000"
            }
        ]
    },
    {
        "featureType": "road",
        "elementType": "labels.icon",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "road.highway",
        "elementType": "all",
        "stylers": [
            {
                "visibility": "simplified"
            },
            {
                "color": "#7c9299"
            }
        ]
    },
    {
        "featureType": "road.highway",
        "elementType": "labels",
        "stylers": [
            {
                "color": "#393e41"
            }
        ]
    },
    {
        "featureType": "road.highway",
        "elementType": "labels.text.stroke",
        "stylers": [
            {
                "color": "#ff0000"
            }
        ]
    },
    {
        "featureType": "road.highway",
        "elementType": "labels.icon",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "road.arterial",
        "elementType": "labels.icon",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "transit",
        "elementType": "all",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "water",
        "elementType": "all",
        "stylers": [
            {
                "color": "#6ac3dd"
            },
            {
                "visibility": "on"
            }
        ]
    } ];

      map.addStyle({
        styles: styles,
        mapTypeId: 'map_style'
      });
      map.setStyle('map_style');
}


import { autocomplete } from '../components/autocomplete';

autocomplete();




