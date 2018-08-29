function autocomplete() {
  document.addEventListener("DOMContentLoaded", function() {
    var hostelAddress = document.getElementById('hostel_address');
    if (hostelAddress) {
      var autocomplete = new google.maps.places.Autocomplete(hostelAddress);
      google.maps.event.addDomListener(hostelAddress, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault();
        }
      });
    }
  });
}

export { autocomplete };
