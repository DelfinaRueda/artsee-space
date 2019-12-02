import "bootstrap";

$(document).ready(function() {
  $('li.active').removeClass('active');
  $('a[href="' + location.pathname + '"]').closest('li').addClass('active');
});

$(document).ready(function() {
  $('.artist-nav-item.active').removeClass('active');
  $('a[href="' + location.pathname + '"]').closest('.artist-nav-item').addClass('active');
});
