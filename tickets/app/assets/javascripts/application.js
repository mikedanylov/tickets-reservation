//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require_tree .

$(document).ready(function(){

  // Login icon toggles modal
  $('#login').click(function () {
    $('#loginModal').modal('show');
  });
  
});