//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require_tree .

$(function() {
  $(".alert").fadeTo(3000, 500).fadeOut('slow', function(){
      $(".alert").alert('close');
  });
});
