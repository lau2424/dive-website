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
      zoom: 13
    })
    this.#addMarkersToMap()
    this.#fitMapToMarkers()
    this.map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken,
      mapboxgl: mapboxgl }))
    // Add zoom and rotation controls to the map.
    this.map.addControl(new mapboxgl.NavigationControl());
    this.#geolocate()


    this.map.on('contextmenu', function(e) {
      let coordinates = e.lngLat
      console.log(coordinates)
      const url = `spots/new?lat=${e.lngLat.lat}&lng=${e.lngLat.lng}`
      window.location.href = url;




      // new mapboxgl.Popup()
      //   .setLngLat(coordinates)
      //   .setPopup(popup)
      //   .addTo(this.map)
// TODO : define URL
      // URL = "http://localhost:3000/"
      // fetch(URL, {headers: {"Accept": "text/plain"}})
      // .then(response => response.text())
      // .then((data) => { insertAdjacentHTML(data)})
      // console.log(this.coordinatesTarget)
      });

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
    this.map.addControl(geolocate);
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
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 5000 })
  }
}
