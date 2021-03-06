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

const markers = document.querySelectorAll(".mapboxgl-marker")
document.querySelectorAll(".card-event").forEach((card, index) => {
  markers[index].querySelector("g[fill=\"#3FB1CE\"]").setAttribute("fill", "#795a43")

  card.addEventListener("mouseenter", e => {
    markers[index].querySelector("g[fill=\"#795a43\"]").setAttribute("fill", "orange")
  })
  card.addEventListener("mouseleave", e => {
    markers[index].querySelector("g[fill=\"orange\"]").setAttribute("fill", "#795a43")
  })
})


// Submit form when clicking the checkbox
$(".searching-form").on("change", "input:checkbox", function(){
    $(".searching-form").submit();
});

// const hearts = document.querySelectorAll(".icon-heart i")
// hearts.forEach((heart, index) => {
//   heart.addEventListener("click", e => {
//     if (hearts[index].className == "far fa-heart")
//      hearts[index].className = "fas fa-heart";
//    else
//      hearts[index].className = "far fa-heart";
//    })
// });
