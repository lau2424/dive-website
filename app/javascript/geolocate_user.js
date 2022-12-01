const geolocateUser = (map) => {
  const geolocate = new mapboxgl.GeolocateControl({
    positionOptions: {
      enableHighAccuracy: true
    },
    fitBoundsOptions: {
      linear: false
    },
    trackUserLocation: false
  });
  map.addControl(geolocate);
  map.on('load', function() {
    geolocate.trigger();
  });
  geolocate.on('geolocate', function(e) {
    map.flyTo({
      zoom: 15,
      center: [e.coords.longitude, e.coords.latitude]
    });
  });
}
