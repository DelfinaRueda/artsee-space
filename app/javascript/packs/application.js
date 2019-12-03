import "bootstrap";

// Menu Main – Set active
$(document).ready(function() {
  $('li.active').removeClass('active');
  $('a[href="' + location.pathname + '"]').closest('li').addClass('active');
});

// Menu Profile – Set active
$(document).ready(function() {
  $('.artist-nav-item.active').removeClass('active');
  $('a[href="' + location.pathname + '"]').closest('.artist-nav-item').addClass('active');
});


// Map
import 'mapbox-gl/dist/mapbox-gl.css';
// internal imports
import { initMapbox } from '../plugins/init_mapbox';
initMapbox();
