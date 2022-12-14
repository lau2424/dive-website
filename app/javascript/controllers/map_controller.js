import { Controller } from "@hotwired/stimulus"
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"


// Connects to data-controller="map"
export default class extends Controller {
  static targets = ["coordinates", "maps"]
  static values = {
    apiKey: String,
    markers: Array
  }
  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/fabpsl/clb51dy34001715ru9iybl3dg",
      center: [50.85, 4.35],
      zoom: 10
    })

    this.#addMarkersToMap()
    this.#fitMapToMarkers()
    this.map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken,
      mapboxgl: mapboxgl }), "bottom-right")
    // Add zoom and rotation controls to the map.
    this.map.addControl(new mapboxgl.NavigationControl(), "bottom-right");
    this.#geolocate("bottom-right")

    function onLongPress(element, callback) {
      let timer;

      element.addEventListener('touchstart', () => {
        timer = setTimeout(() => {
          timer = null;
          callback();
        }, 500);
      });

      function cancel() {
        clearTimeout(timer);
      }

      element.addEventListener('touchend', cancel);
      // element.addEventListener('touchmove', cancel);
    }

    onLongPress(this.element, () => {
      this.map.on('click', function(e) {
      let coordinates = e.lngLat
      console.log(coordinates)
      const url = `spots/new?lat=${e.lngLat.lat}&lng=${e.lngLat.lng}`
      window.location.href = url;
    });
  });
  this.map.on('contextmenu', function(e) {
  let coordinates = e.lngLat
  console.log(coordinates)
  const url = `spots/new?lat=${e.lngLat.lat}&lng=${e.lngLat.lng}`
  window.location.href = url;
  })



}
  #geolocate() {
    // Initialize the GeolocateControl.
    const geolocate = new mapboxgl.GeolocateControl({
      positionOptions: {
          enableHighAccuracy: true
      },
      trackUserLocation: true,
      fitBoundsOptions: {
        zoom: 8,
      }

    });
    // Add the control to the map.
    this.map.addControl(geolocate, "bottom-right");
    // Set an event listener that fires
    // when a geolocate event occurs.
    geolocate.on('geolocate', () => {
      console.log('A geolocate event has occurred.');
      // this.map.setZoom(3);
    });
  }

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window)
      // Create a HTML element for your custom marker
    const customMarker = document.createElement("div")
    customMarker.className = "marker"
    customMarker.style.backgroundImage = `url('${marker.image_url}')`
    customMarker.style.backgroundSize = "contain"
    customMarker.style.width = "25px"
    customMarker.style.height = "25px"
      new mapboxgl.Marker(customMarker)
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup)
        .addTo(this.map)
    })
  }
  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))

    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })

  }
}
