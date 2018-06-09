function initMap() {
  let center = {lat: 0.000, lng: 0.000};

  let disasters = $(`#map`).data(`disasters`)

  let map = new google.maps.Map(document.getElementById("map"), {
    zoom: 2,
    center: center
  });

  disasters.forEach(disaster => {
    let marker = new google.maps.Marker({
      position: { lat: disaster.latitude, lng: disaster.longitude },
      map: map
    });
    attachMarkerInfo(marker, createMarkerLink(disaster.type, disaster.country, disaster.rw_id))
  });
};

function attachMarkerInfo(marker, content) {
  let infowindow = new google.maps.InfoWindow({
    content: content
  });
  marker.addListener('click', () => {
    infowindow.open(marker.get('map'), marker);
  });
};

function createMarkerLink (type, country, id) {
  let a = document.createElement('a');
  let text = document.createTextNode(`${type} in ${country}`);
  a.appendChild(text);
  a.title = `${type} in ${country}`;
  a.href = `/disasters/${id}`;
  return a;
};
