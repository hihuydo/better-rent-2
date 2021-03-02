import mapboxgl from 'mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css';

const buildMap = (mapElement) => {
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  return new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/tobiasmentz/ckll67pfq0lhr17ppcju8t4vn'
  });
};

const addMarkersToMap = (map, markers) => {
  markers.forEach((marker) => {
    new mapboxgl.Marker({color: "#ff3f12"})
      .setLngLat([ marker.lng, marker.lat ])
      .setPopup(new mapboxgl.Popup().setHTML("<p><%= @property.description %></p>")) /*need ot figure out how to access the postgres db with javascript*/
      .addTo(map);
      console.log(marker);
      console.log(marker.lat);
  });
};

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 10 });
};

const initMapbox = () => {
  const mapElement = document.getElementById('map');
  if (mapElement) {
    const map = buildMap(mapElement);
    const markers = JSON.parse(mapElement.dataset.markers);
    addMarkersToMap(map, markers);
    fitMapToMarkers(map, markers);
  }
};

export { initMapbox };
