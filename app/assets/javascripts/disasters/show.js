function initMap() {
  let lat = $("#small_map").data("lat");
  let lng = $("#small_map").data("lng");
  let position = {lat: lat, lng: lng};
  let map = new google.maps.Map(document.getElementById("small_map"), {
    zoom: 4,
    center: position
  });
  let marker = new google.maps.Marker({ position: position, map: map });
}
